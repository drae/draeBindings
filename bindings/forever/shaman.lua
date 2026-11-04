if select(2, UnitClass("player")) ~= "SHAMAN" or not draeBindings.isForever then
	return
end

local _, bindings = ...

--[[
		WoW Forever shaman. Vanilla based kit plus Lava Burst (Elemental), Stormstrike /
		Rage of the Farseer (Enhancement), Riptide / Water Shield (Restoration) and the
		totem bar spells (Call of the Elements, Totemic Recall, Totemic Call).
		Interrupt is Earth Shock, taunt is Stoneclaw Totem.

		Spells are written without ranks, the highest known rank is resolved when the set loads.

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
		#, 						Earth spells
		BUTTON4					Fire spells
		BUTTON5					Nature spells
		BUTTON3                 Interrupts/Stuns/CC
		6                       Defensive totems
		7                       Totem bar (Call of the Elements / Recall / Call)
		8                       Shields
		9						Ghost Wolf

		-- Keyboard
		E                       Taunt (Stoneclaw Totem)
		F                       Healthstone/Pots
		R                       Trinkets
		C                       Cure Poison / Cure Disease / Purge
		`                       Major cooldown
		\                       Ancestral Spirit
--]]

local shamanBase = {
	-- Mouse based
	BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Earth Shock", -- Interrupt
	BUTTON4 = "s|Flame Shock",
	BUTTON5 = "s|Lightning Bolt",
	[6] = "s|Grounding Totem",
	[7] = "s|Call of the Elements",
	[8] = "s|Lightning Shield",
	[9] = "s|Ghost Wolf",
	["#"] = "",

	-- Keyboard based
	C = "m|/cast [@MOUSEOVER,help][] Cure Poison",
	E = "s|Stoneclaw Totem", -- Taunt
	F = "m|/use Healthstone",
	R = "m|/use 13",
	["`"] = "m|/use 13",
	["\\"] = "m|/cast [@MOUSEOVER,dead][@TARGET,dead][] Ancestral Spirit",

	shift = {
		-- Mouse based
		BUTTON3 = "s|Earthbind Totem",
		BUTTON4 = "m|/cast [known:Lava Burst] Lava Burst",
		BUTTON5 = "m|/startattack\n/cast Chain Lightning",
		[6] = "s|Stoneskin Totem",
		[7] = "s|Totemic Recall",
		[9] = "",

		-- Keyboard based
		[4] = "s|Tremor Totem",
		C = "m|/cast [@MOUSEOVER,help][] Cure Disease",
		F = "s|Stoneform",
		R = "m|/use 14",
	},

	alt = {
		-- Mouse based
		BUTTON3 = "m|/cast [@FOCUS,exists,harm][] Frost Shock",
		BUTTON4 = "s|Fire Nova",
		[7] = "m|/cast [known:Totemic Call] Totemic Call",

		-- Keyboard based
		C = "m|/cast [@FOCUS,harm,nodead][@TARGET,harm,nodead][@MOUSEOVER,harm][] Purge",
	},

	ctrl = {
		-- Mouse based
		BUTTON4 = "s|Searing Totem",
		["#"] = "s|Magma Totem",
	},
}

local elemental = {
	-- Mouse based
	["#"] = "s|Earth Shock",
}

local enhancement = {
	-- Mouse based
	["#"] = "m|/startattack\n/cast [known:Stormstrike] Stormstrike",

	-- Keyboard based
	["`"] = "m|/use 13\n/cast [known:Rage of the Farseer] Rage of the Farseer",

	shift = {
		-- Mouse based
		["#"] = "s|Earth Shock",
	},
}

local restoration = {
	-- Mouse based
	["#"] = "s|Healing Stream Totem",
	[8] = "m|/cast [known:Water Shield] Water Shield; Lightning Shield",

	-- Keyboard based
	["`"] = "m|/cast [known:Nature's Swiftness] Nature's Swiftness",

	shift = {
		-- Mouse based
		["#"] = "s|Mana Spring Totem",

		-- Keyboard based
		C = "s|Poison Cleansing Totem",
	},

	alt = {
		-- Mouse based
		[7] = "m|/cast [known:Mana Tide Totem] Mana Tide Totem",

		-- Keyboard based
		F = "m|/use Major Mana Potion\n/use Superior Mana Potion\n/use Greater Mana Potion\n/use Mana Potion\n/use Lesser Mana Potion\n/use Minor Mana Potion",
	},

	ctrl = {
		-- Keyboard based
		C = "s|Disease Cleansing Totem",
	},
}

-- Used until talent points are spent.
draeBindings:RegisterKeyBindings("Default", bindings.base, shamanBase)
draeBindings:RegisterKeyBindings("Elemental", bindings.base, shamanBase, elemental)
draeBindings:RegisterKeyBindings("Enhancement", bindings.base, shamanBase, enhancement)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, shamanBase, restoration)
