
-- Localise some functions
local CreateFrame, SetBinding, SetBindingClick, RegisterStateDriver, InCombatLockdown = CreateFrame, SetBinding, SetBindingClick, RegisterStateDriver, InCombatLockdown
local print, select, next, ipairs, pcall, split, format, type, tonumber, table = print, select, next, ipairs, pcall, string.split, string.format, type, tonumber, table

--
local print = function(...)
	return print('|cff33ff99draeBindings:|r', ...)
end

local printf = function(f, ...)
	return print(f:format(...))
end

-- WoW Forever (game type "camelot") runs the retail engine but reports a 1.60+ toc.
local _, _, _, tocVersion = GetBuildInfo()
local isForever = WOW_PROJECT_ID == 18 or (tocVersion >= 16000 and tocVersion < 20000)

-- Name of the set used when no spec / talent tree can be determined (e.g. no talent points spent yet).
local DEFAULT_SET = 'Default'

-- Prefer the namespaced specialisation API, fall back to the old globals.
local C_SpecializationInfo = C_SpecializationInfo
local GetSpecialization = (C_SpecializationInfo and C_SpecializationInfo.GetSpecialization) or GetSpecialization
local GetSpecializationInfo = (C_SpecializationInfo and C_SpecializationInfo.GetSpecializationInfo) or GetSpecializationInfo

--[[
	Forever has a single starter spec per class. The "spec" is instead the talent group
	(vanilla style tree) within the class trait tree that has the most points spent.
	Group IDs from LibSpecialization (DBM-Core/Libs/LibSpecialization). Names match the
	set names registered by the class files.
--]]
local FOREVER_TREES = {
	-- Mage
	[11582] = 'Arcane', [11594] = 'Fire', [11601] = 'Frost',
	-- Druid
	[11328] = 'Balance', [11347] = 'Feral', [11340] = 'Restoration',
	-- Hunter
	[11372] = 'Beast Mastery', [11371] = 'Marksmanship', [11370] = 'Survival',
	-- Paladin
	[11486] = 'Holy', [11541] = 'Protection', [11559] = 'Retribution',
	-- Priest
	[11608] = 'Discipline', [11615] = 'Holy', [11622] = 'Shadow',
	-- Rogue
	[11580] = 'Assassination', [11573] = 'Combat', [11572] = 'Subtlety',
	-- Shaman
	[11326] = 'Elemental', [11363] = 'Enhancement', [11362] = 'Restoration',
	-- Warlock
	[11629] = 'Affliction', [11636] = 'Demonology', [11637] = 'Destruction',
	-- Warrior
	[11650] = 'Arms', [11657] = 'Fury', [11670] = 'Protection',
}

local getForeverTree = function()
	if not (C_ClassTalents and C_Traits and C_Traits.GetGroupDisplayInfoByTreeID) then return end

	local configID = C_ClassTalents.GetActiveConfigID()
	local configInfo = configID and C_Traits.GetConfigInfo(configID)
	local treeID = configInfo and configInfo.treeIDs and configInfo.treeIDs[1]
	if not treeID then return end

	local bestGroup, bestSpent = nil, 0
	for _, group in ipairs(C_Traits.GetGroupDisplayInfoByTreeID(treeID) or {}) do
		local groupID = group.groupID
		local currency = groupID and C_Traits.GetGroupCurrencyInfo(configID, { groupID })
		local info = currency and currency[1] and currency[1].currencyInfos and currency[1].currencyInfos[1]
		local spent = info and info.spent or 0
		if spent > bestSpent then
			bestGroup, bestSpent = groupID, spent
		end
	end

	return bestGroup and FOREVER_TREES[bestGroup]
end

--[[
	Spell ranks (Forever only).

	Forever has vanilla style ranked spells. Rather than hard coding rank numbers that change as
	you level, the spellbook is scanned for the highest known rank of each spell and bindings are
	resolved to "Name(Rank N)" when loaded. Anything already written with an explicit subtext,
	e.g. "Holy Light(Rank 4)" for downranking, is left untouched.
--]]
local _RANKS = {} -- spell name -> subtext of highest known rank, e.g. "Rank 11"
local rankSignature = ''

-- Returns true if the known ranks changed since the last scan.
local scanRanks = function()
	if not (isForever and C_SpellBook and C_SpellBook.GetNumSpellBookSkillLines and Enum.SpellBookSpellBank) then
		return false
	end

	local ranks, best = {}, {}
	local bank, spellType = Enum.SpellBookSpellBank.Player, Enum.SpellBookItemType.Spell
	for line = 1, C_SpellBook.GetNumSpellBookSkillLines() do
		local lineInfo = C_SpellBook.GetSpellBookSkillLineInfo(line)
		if lineInfo then
			for index = lineInfo.itemIndexOffset + 1, lineInfo.itemIndexOffset + lineInfo.numSpellBookItems do
				local item = C_SpellBook.GetSpellBookItemInfo(index, bank)
				if item and item.itemType == spellType and not item.isPassive and item.name and item.subName then
					local rank = tonumber(item.subName:match('(%d+)'))
					if rank and rank > (best[item.name] or 0) then
						best[item.name] = rank
						ranks[item.name] = item.subName
					end
				end
			end
		end
	end

	local sig = {}
	for name, sub in next, ranks do
		sig[#sig + 1] = name .. '=' .. sub
	end
	table.sort(sig)
	sig = table.concat(sig, ';')

	if sig == rankSignature then return false end
	rankSignature = sig
	_RANKS = ranks
	return true
end

local rankedSpell = function(name)
	if name:find('(', 1, true) then return name end
	local sub = _RANKS[name]
	return sub and format('%s(%s)', name, sub) or name
end

-- Rewrites the spell in each clause of /cast lines, leaving [conditions] alone.
local rankClause = function(clause)
	local pos = clause:match('^%s*()')
	while true do
		local nextPos = clause:match('^%b[]%s*()', pos)
		if not nextPos then break end
		pos = nextPos
	end

	local spell, trail = clause:sub(pos):match('^(.-)(%s*)$')
	if spell == '' then return clause end
	return clause:sub(1, pos - 1) .. rankedSpell(spell) .. trail
end

local rankMacro = function(text)
	if not next(_RANKS) then return text end

	return (text:gsub('[^\n]+', function(line)
		local cmd, rest = line:match('^(/cast%s+)(.+)$')
		if not cmd then return line end

		local clauses = {}
		for clause in (rest .. ';'):gmatch('([^;]*);') do
			clauses[#clauses + 1] = rankClause(clause)
		end
		return cmd .. table.concat(clauses, ';')
	end))
end

local getRetailSpec = function()
	local spec = GetSpecialization and GetSpecialization()
	if spec and spec > 0 then
		local _, name = GetSpecializationInfo(spec)
		return name
	end
end

local states = {
	'alt|[mod:alt]',
	'ctrl|[mod:ctrl]',
	'shift|[mod:shift]',

	'possess|[bonusbar:5]',

	-- No bar1 as that's our default anyway.
	'bar2|[bar:2]',
	'bar3|[bar:3]',
	'bar4|[bar:4]',
	'bar5|[bar:5]',
	'bar6|[bar:6]',

	'stealth|[bonusbar:1,stealth]',
	'shadowDance|[stance:3]',

	'shadow|[bonusbar:1]',

	'bear|[stance:1]',
	'cat|[stance:3]',
	'moonkintree|[stance:5]',

	'battle|[stance:1]',
	'defensive|[stance:2]',
	'berserker|[stance:3]',

	'demon|[stance:2]',
}
-- it won't change anyway~
local numStates = #states

local hasState = function(st)
	for i=1,numStates do
		local state, data = split('|', states[i], 2)
		if(state == st) then
			return data
		end
	end
end

local _NAME = ...
local _NS = CreateFrame'Frame'
_G[_NAME] = _NS
_NS.isForever = isForever

local _BINDINGS = {}
local _BUTTONS = {}
-- Key strings (e.g. "SHIFT-BUTTON5") bound by the currently active set.
local _BOUNDKEYS = {}

local _CALLBACKS = {}

local _STATE = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
local _BASE = 'base'

function _STATE:Callbacks(state)
	for _, func in next, _CALLBACKS do
		func(self, state)
	end
end

_STATE:SetAttribute("_onstate-page", [[
   control:ChildUpdate('state-changed', newstate)
   control:CallMethod('Callbacks', newstate)
]])

function _NS:RegisterKeyBindings(name, ...)
	local bindings = {}

	for i=1, select('#', ...) do
		local tbl = select(i, ...)
		for key, action in next, tbl do
			if(type(action) == 'table') then
				for mod, modAction in next, action do
					if(not bindings[key]) then
						bindings[key] = {}
					end

					bindings[key][mod] = modAction
				end
			else
				bindings[key] = action
			end
		end
	end

	_BINDINGS[name] = bindings
end

function _NS:RegisterCallback(func)
	table.insert(_CALLBACKS, func)
end

local createButton = function(key)
	if(_BUTTONS[key]) then
		return _BUTTONS[key]
	end

	local btn = CreateFrame("Button", 'draeBindings' .. key, _STATE, "SecureActionButtonTemplate");
	btn:RegisterForClicks("AnyUp", "AnyDown")
	btn:SetAttribute('_childupdate-state-changed', [[
	   local type = message and self:GetAttribute('ob-' .. message .. '-type') or self:GetAttribute('ob-base-type')
	   -- It's possible to have buttons without a default state.
	   if(type) then
	      local attr, attrData = strsplit(',', (
	         message and self:GetAttribute('ob-' .. message .. '-attribute') or
	         self:GetAttribute('ob-base-attribute')
	      ), 2)
	      self:SetAttribute('type',type)
	      self:SetAttribute(attr, attrData)
	   else
	      self:SetAttribute('type', nil)
	  end
	]])

	if(tonumber(key)) then
		btn:SetAttribute('ob-possess-type', 'action')
		btn:SetAttribute('ob-possess-attribute', 'action,' .. (key + 120))
	end

	_BUTTONS[key] = btn
	return btn
end

local clearButton = function(btn)
	-- The base state isn't in the states table, clear it explicitly.
	btn:SetAttribute('ob-base-type', nil)
	btn:SetAttribute('ob-base-attribute', nil)

	for i=1, numStates do
		local key = split('|', states[i], 2)
		if(key ~= 'possess') then
			btn:SetAttribute(format('ob-%s-type', key), nil)
			btn:SetAttribute(format('ob-%s-attribute', key), nil)
		end
	end
end

local typeTable = {
	s = 'spell',
	i = 'item',
	m = 'macro',
}

local bindKey = function(key, action, mod)
	local modKey
	if(mod and (mod == 'alt' or mod == 'ctrl' or mod == 'shift')) then
		modKey = mod:upper() .. '-' .. key
	end
	local bindingKey = modKey or key

	local ty, action = split('|', action, 2)
	if(not action) then
		-- Plain binding command, or '' to explicitly leave the key unbound.
		SetBinding(bindingKey, ty ~= '' and ty or nil)
	else
		local btn = createButton(key)
		ty = typeTable[ty]
		if(not ty) then
			printf('Unknown action type for %s: %s', bindingKey, action)
			return
		end

		if(ty == 'spell') then
			action = rankedSpell(action)
		elseif(ty == 'macro') then
			action = rankMacro(action)
		end

		btn:SetAttribute(format('ob-%s-type', mod or 'base'), ty)
		ty = (ty == 'macro' and 'macrotext') or ty
		btn:SetAttribute(format('ob-%s-attribute', mod or 'base'), ty .. ',' .. action)

		SetBindingClick(bindingKey, btn:GetName())
	end

	_BOUNDKEYS[#_BOUNDKEYS + 1] = bindingKey
end

function _NS:LoadBindings(name)
	local bindings = _BINDINGS[name]

	if(bindings and self.activeBindings ~= name) then
		-- Rank updates reload the same set, don't announce those.
		if self.lastAnnounced ~= name then
			print("Switching to set:", name)
			self.lastAnnounced = name
		end
		self.activeBindings = name
		for _, btn in next, _BUTTONS do
			clearButton(btn)
		end

		-- Unbind everything the previous set bound, so keys it doesn't share don't linger.
		for i = #_BOUNDKEYS, 1, -1 do
			SetBinding(_BOUNDKEYS[i], nil)
			_BOUNDKEYS[i] = nil
		end

		for key, action in next, bindings do
			if(type(action) ~= 'table') then
				bindKey(key, action)
			elseif(hasState(key)) then
				for modKey, action in next, action do
					bindKey(modKey, action, key)
				end
			end
		end

		local _states = ''
		for i=1, numStates do
			local key,state = split('|', states[i], 2)
			if(bindings[key] or key == 'possess') then
				_states = _states .. state .. key .. ';'
			end
		end

		RegisterStateDriver(_STATE, "page", _states .. _BASE)
		_STATE:Execute(([[
		   local state = '%s'
		   control:ChildUpdate('state-changed', state)
		   control:CallMethod('Callbacks', state)
		]]):format(_STATE:GetAttribute'state-page'))
	end
end

-- Work out which set should be active and load it.
function _NS:UpdateBindingSet()
	if InCombatLockdown() then
		-- Secure attributes and bindings can't be changed in combat, try again afterwards.
		self.pendingUpdate = true
		self:RegisterEvent('PLAYER_REGEN_ENABLED')
		return
	end

	local name
	if isForever then
		name = getForeverTree()
	else
		name = getRetailSpec()
	end

	if not (name and _BINDINGS[name]) and _BINDINGS[DEFAULT_SET] then
		name = DEFAULT_SET
	end

	if name and _BINDINGS[name] then
		self.missingWarned = nil
		-- A newly learned rank means the active set has to be re-resolved.
		if scanRanks() then
			self.activeBindings = nil
		end
		self:LoadBindings(name)
	elseif not self.missingWarned then
		self.missingWarned = true
		print(name and format('Unable to find any bindings for "%s".', name) or 'No specialisation / talent tree, and no default set.')
	end
end

-- Talent events tend to fire in bursts, coalesce them.
function _NS:QueueUpdate()
	if self.updateQueued then return end
	self.updateQueued = true
	C_Timer.After(0.2, function()
		self.updateQueued = nil
		self:UpdateBindingSet()
	end)
end

_NS:SetScript('OnEvent', function(self, event, ...)
	if self[event] == nil then return end

	return self[event](self, event, ...)
end)

function _NS:ADDON_LOADED(event, addon)
	-- For the possess madness.
	if(addon == _NAME) then
		for i=0,9 do
			createButton(i)
		end

		self:UnregisterEvent("ADDON_LOADED")
		self.ADDON_LOADED = nil
	end
end
_NS:RegisterEvent"ADDON_LOADED"

function _NS:PLAYER_REGEN_ENABLED()
	self:UnregisterEvent('PLAYER_REGEN_ENABLED')
	if self.pendingUpdate then
		self.pendingUpdate = nil
		self:UpdateBindingSet()
	end
end

local updateEvents = {
	'PLAYER_LOGIN',
	'PLAYER_ENTERING_WORLD',
	'TRAIT_CONFIG_LIST_UPDATED', -- talent data can arrive after login
	'PLAYER_TALENT_UPDATE',
	'TRAIT_CONFIG_UPDATED',
	'ACTIVE_COMBAT_CONFIG_CHANGED',
	isForever and 'CHARACTER_POINTS_CHANGED' or 'ACTIVE_TALENT_GROUP_CHANGED',
	isForever and 'SPELLS_CHANGED' or 'PLAYER_SPECIALIZATION_CHANGED', -- Forever: new spell ranks
}

for _, event in next, updateEvents do
	-- Not every event exists on every client, registering an unknown event errors.
	if pcall(_NS.RegisterEvent, _NS, event) then
		_NS[event] = _NS.QueueUpdate
	end
end

-- /dbind - show the active set and, on Forever, the resolved spell ranks.
SLASH_DRAEBINDINGS1 = '/dbind'
SlashCmdList.DRAEBINDINGS = function()
	print('Active set:', _NS.activeBindings or 'none', isForever and '(Forever)' or '')
	if isForever then
		local names = {}
		for name in next, _RANKS do names[#names + 1] = name end
		table.sort(names)
		for _, name in ipairs(names) do
			print('  ' .. rankedSpell(name))
		end
		if #names == 0 then print('  No ranked spells found in spellbook.') end
	end
end
