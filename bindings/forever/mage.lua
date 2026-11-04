if select(2, UnitClass("player")) ~= "MAGE" or not draeBindings.isForever then
	return
end

local _, bindings = ...

--[[
		WoW Forever mage. Vanilla based kit plus Arcane Blast / Arcane Wrath (Arcane talents),
		Ice Lance (Frost talent) and Frostfire Bolt (trained at 40).

		Spells are written without ranks, the highest known rank is resolved when the set loads.
		Write e.g. "Frostbolt(Rank 1)" to pin a specific rank.

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
		#, BUTTON4, BUTTON5		Primary rotation abilities
		BUTTON3                 Interrupts/Stuns/CC
		6                       Defensive cooldowns
		7                       Special cooldowns
		8                       Wards
		9						Blink

		-- Keyboard
		F                       Get out of jail free -> Escape Artist, Healthstone
		R                       Trinkets
		C                       Remove Lesser Curse
		`                       Major dmg cooldown
--]]

local base = {
	-- Mouse binds
	BUTTON3 = "m|/stopcasting\n/cast [@target,harm][] Counterspell",
	[6] = "m|/cast [known:Ice Barrier] Ice Barrier; Mana Shield",
	[8] = "s|Fire Ward",
	[9] = "s|Blink",

	-- Keyboard binds
	["`"] = "m|/use 13",
	F = "m|/stopcasting\n/cast Escape Artist", -- Gnome only
	R = "m|/use 13",
	C = "m|/cast [@MOUSEOVER,help][@PLAYER][] Remove Lesser Curse",

	shift = {
		-- Mouse binds
		BUTTON3 = "m|/stopcasting\n/cast Frost Nova",
		[6] = "m|/stopcasting\n/cancelaura Ice Block\n/cast [known:Ice Block] Ice Block", -- Frost talent
		[7] = "s|Evocation",
		[8] = "s|Frost Ward",

		-- Keyboard binds
		F = "m|/use Healthstone",
		R = "m|/use 14",
	},

	alt = {
		-- Mouse binds
		BUTTON3 = "m|/cast [combat,known:Presence of Mind] Presence of Mind\n/cast [@focus,harm][@target,harm][] Polymorph",
		[6] = "s|Mana Shield",

		-- Keyboard binds
		F = "s|Slow Fall",
	},

	ctrl = {
		BUTTON3 = "m|/stopcasting\n/cast [known:Blast Wave] Blast Wave", -- Fire talent
		["#"] = "s|Arcane Explosion",
	},
}

-- Used until talent points are spent.
local default = {
	BUTTON4 = "s|Fire Blast",
	BUTTON5 = "s|Fireball",

	shift = {
		BUTTON4 = "s|Arcane Missiles",
		BUTTON5 = "s|Frostbolt",
	},
}

local arcane = {
	-- Mouse binds
	BUTTON5 = "m|/cast [known:Arcane Blast] Arcane Blast; Frostbolt",

	-- Keyboard binds
	["`"] = "m|/use 13\n/cast [known:Arcane Power] Arcane Power",

	shift = {
		-- Mouse binds
		BUTTON5 = "m|/cast [nochanneling:Arcane Missiles] Arcane Missiles",
	},
	alt = {
		BUTTON5 = "m|/cast [known:Arcane Wrath] Arcane Wrath",
	},
}

local fire = {
	-- Mouse binds
	BUTTON4 = "s|Fire Blast",
	BUTTON5 = "s|Fireball",
	["#"] = "m|/cast [@CURSOR][] Flamestrike",

	-- Keyboard binds
	["`"] = "m|/use 13\n/cast [known:Combustion] Combustion",

	shift = {
		-- Mouse binds
		BUTTON4 = "m|/cast [known:Frostfire Bolt] Frostfire Bolt",
		BUTTON5 = "m|/cast [known:Pyroblast] Pyroblast",
	},
	alt = {
		BUTTON4 = "s|Scorch",
		BUTTON5 = "m|/cast [known:Combustion] Combustion",
		["#"] = "s|Cone of Cold",
	},
}

local frost = {
	-- Mouse binds
	BUTTON4 = "m|/cast [known:Frostfire Bolt] Frostfire Bolt",
	BUTTON5 = "s|Frostbolt",
	["#"] = "s|Cone of Cold",
	[7] = "m|/cast [known:Cold Snap] Cold Snap",

	shift = {
		-- Mouse binds
		BUTTON4 = "s|Fire Blast",
		BUTTON5 = "m|/cast [known:Ice Lance] Ice Lance",
	},
	alt = {
		-- Mouse binds
		["#"] = "m|/cast [@CURSOR][] Blizzard",
	},
}

draeBindings:RegisterKeyBindings("Default", bindings.base, base, default)
draeBindings:RegisterKeyBindings("Arcane", bindings.base, base, arcane)
draeBindings:RegisterKeyBindings("Fire", bindings.base, base, fire)
draeBindings:RegisterKeyBindings("Frost", bindings.base, base, frost)
