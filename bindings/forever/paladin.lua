if select(2, UnitClass("player")) ~= "PALADIN" or not draeBindings.isForever then
	return
end

local _, bindings = ...

--[[
		WoW Forever paladin. Vanilla based kit, no Holy Power, no interrupt, the taunt is
		Judgement while Seal of Fury is active. Note the spelling: "Judgement".

		Spells are written without ranks, the highest known rank is resolved when the set loads.
		Write e.g. "Holy Light(Rank 4)" to pin a specific rank.

		MOUSE3 = mousewheel click
		MOUSE4 = rear left side button
		MOUSE5 = front left side button
		# = extra button on side
		6 = first button on left mouse button edge
		7 = second button on left mouse button edge
		8 = tilt mousewheel left
		9 = tilt mouseright right

		General setup
		-------------

		-- Mouse
		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Stuns/CC (no interrupts on Forever)
		6                       Defensive cooldowns
		7                       Special cooldowns
		8                       Seals
		9						Movement (Blessing of Freedom)

		-- Keyboard
		E                       Taunt (Judgement + Seal of Fury) / Swift Judgement
		F                       Heal pot/healthstone (EQoL macro), mana pot
		R                       Trinkets
		C                       Cleanse / Purify
		`                       Major cooldown
		\                       Redemption
--]]

local palaBase = {
	-- Mouse based
	BUTTON3 = "m|/stopcasting\n/cancelqueuedspell\n/cast [@FOCUS,exists,harm][] Hammer of Justice",
	BUTTON4 = "s|Exorcism", -- Undead/Demon only
	BUTTON5 = "s|Holy Strike",
	[6] = "s|Divine Protection",
	[8] = "s|Seal of Righteousness",
	[9] = "m|/cast [@MOUSEOVER,help][@PLAYER] Blessing of Freedom",

	-- Keyboard based
	E = "m|/cast [@FOCUS,exists,harm][] Judgement", -- Taunts while Seal of Fury is active
	--	F = "m|/castsequence reset=combat item:241305", -- EQol macro
	R = "m|/use 13",
	C = "m|/cast [@MOUSEOVER,help,known:Cleanse][known:Cleanse] Cleanse; [@MOUSEOVER,help][] Purify",
	["\\"] = "m|/cast [@MOUSEOVER,dead,help][] Redemption",

	shift = {
		-- Mouse based
		BUTTON3 = "m|/stopcasting\n/cancelqueuedspell\n/cast [@FOCUS,exists,harm,known:Repentance][known:Repentance] Repentance",
		BUTTON4 = "s|Holy Wrath", -- Undead/Demon AoE
		BUTTON5 = "s|Judgement",
		[6] = "m|/stopcasting\n/cancelqueuedspell\n/cast Divine Shield",
		[8] = "",
		[9] = "",

		-- Keyboard based
		--		[1] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Protection',
		--		[2] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Freedom',
		--		[3] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Sacrifice',

		E = "m|/cast [known:Swift Judgement] Swift Judgement", -- Backup taunt (Protection talent)
		R = "m|/use 14",
	},

	alt = {
		-- Mouse based
		BUTTON3 = "m|/stopcasting\n/cancelqueuedspell\n/cast [@FOCUS,exists,harm][] Turn Undead",
		BUTTON5 = "s|Consecration",
		[6] = "m|/cast [@MOUSEOVER,help][@PLAYER] Lay on Hands",
		[8] = "s|Seal of the Crusader",
	},

	ctrl = {
		-- Mouse based
		BUTTON5 = "s|Hammer of Wrath",
		[8] = "s|Seal of Justice",
	},
}

local prot = {
	-- Mouse based
	BUTTON4 = "m|/cast [known:Hammer of the Righteous] Hammer of the Righteous; Exorcism",
	[6] = "m|/cast [known:Templar's Bulwark] Templar's Bulwark; Divine Protection",
	[7] = "s|Righteous Fury",
	[8] = "s|Seal of Fury",

	alt = {
		-- Mouse based
		["#"] = "m|/cast [known:Holy Shield] Holy Shield",
	},

	ctrl = {
		[6] = "s|Divine Protection",
	},
}

--[[
		Retribution: Holy Strike, Judgement, Seals (Command/Righteousness/Crusader),
		Consecration, Exorcism, Hammer of Wrath. No Holy Power spenders.
]]
local ret = {
	-- Mouse based
	[8] = "m|/cast [known:Seal of Command] Seal of Command; Seal of Righteousness",
}

--[[
		Healing is on Clique. Holy Shock (21 pt), Divine Favor (16 pt), Light's Vigil (31 pt),
		Voice of Truth (11 pt).
]]
local holy = {
	-- Mouse based
	BUTTON4 = "m|/cast [@TARGET,harm,known:Holy Shock] Holy Shock; Exorcism",
	[7] = "m|/cast [@MOUSEOVER,exists,known:Light's Vigil][known:Light's Vigil] Light's Vigil",
	[8] = "m|/cast [known:Seal of Wisdom] Seal of Wisdom; Seal of Righteousness",

	-- Keyboard based
	["`"] = "m|/use 13\n/cast [known:Divine Favor] Divine Favor",

	shift = {
		-- Mouse based
		[7] = "m|/cast [known:Voice of Truth] Voice of Truth",
	},

	alt = {
		-- Keyboard based
		F = "m|/use Major Mana Potion\n/use Superior Mana Potion\n/use Greater Mana Potion\n/use Mana Potion\n/use Lesser Mana Potion\n/use Minor Mana Potion",
	},
}

-- Used until talent points are spent.
draeBindings:RegisterKeyBindings("Default", bindings.base, palaBase)
draeBindings:RegisterKeyBindings("Protection", bindings.base, palaBase, prot)
draeBindings:RegisterKeyBindings("Retribution", bindings.base, palaBase, ret)
draeBindings:RegisterKeyBindings("Holy", bindings.base, palaBase, holy)
