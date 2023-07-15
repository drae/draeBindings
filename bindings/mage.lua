if (select(2, UnitClass "player") ~= "MAGE") then
	return
end

local _, bindings = ...

--[[

--]]
local base = {
	-- Mouse binds
	BUTTON3 = "m|/stopcasting\n/cast [@target,harm][] Counterspell",
	[6] = "m|/cast Arcane Barrier\n/cast Blazing Barrier\n/cast Ice Barrier", -- Survivability (Tier 2)
	[8] = "m|/cast Incanter's Ward\n/cast Rune of Power",
	[9] = "s|Blink", -- Escape/CC

	-- Keyboard binds
	["`"] = "m|/qc 4\n/cast Arcane Power\n/use 13\n/cast Lifeblood\n/cast Alter Time", -- Suggested macro
	F = "m|/stopcasting\n/cast Escape Artist", -- Out of jail free card
	R = "m|/use 12",
	C = "m|/cast [@MOUSEOVER,help][@PLAYER][] Remove Curse",

	shift = {
		-- Mouse binds
		BUTTON3 = "m|/stopcasting\n/cast Frost Nova",
		[6] = "m|/stopcasting\n/cancelaura Ice Block\n/cast Ice Block",

		-- Keyboard binds
		["`"] = "s|Shifting Power",
		C = "s|Spellsteal",
		F = "m|/use Healthstone",
		R = "m|/use 13"
	},

	alt = {
		-- Mouse binds
		BUTTON3 = "m|/cast [combat] Presence of Mind\n/cast [@focus,harm][@target,harm][] Polymorph(Turtle)",
		[6] = "m|/cancelaura Greater Invisibility\n/cast Greater Invisibility",
		[7] = "m|/cast Ice Floes", -- Cast on the move (Tier 1)

		-- Keyboard binds
		["`"] = "s|Time Warp", -- Heroism/Bloodlust
		F = "s|Slow Fall"
	},

	ctrl = {
		BUTTON3 = "m|/stopcasting\n/cast Blast Wave",
		["#"] 	= "s|Arcane Explosion",
		[6]		= "s|Mirror Image"
	}
}

--[[
	
	Rotation (ST):
	
	Rotation (AoE):

]]
local arcane = {
	-- Mouse binds
	BUTTON5 = "s|Arcane Blast",
	-- Keyboard binds

	shift = {
		-- Mouse binds
		BUTTON5 = "m|/cast [nochanneling:Arcane Missiles] Arcane Missiles",
		[7] = "s|Evocation" -- Replenishment
	},
	alt = {
		BUTTON5 = "s|Arcane Barrage"

		-- Keyboard binds
	}
}

--[[
	
	Rotation (ST):
	
	Rotation (AoE):

]]
local fire = {
	-- Mouse binds
	BUTTON4 = "s|Fire Blast",
	BUTTON5 = "s|Fireball",
	["#"] = "s|Cinder Strike",
	-- Keyboard binds

	shift = {
		-- Mouse binds
		BUTTON4 = "s|Phoenix's Flames",
		BUTTON5 = "s|Pyroblast",
	},
	alt = {
		BUTTON4 = "s|Scorch",
		BUTTON5 = "s|Combustion",
		["#"] = "s|Dragon's Breath"
	}
}

--[[

	Rotation (single target)

	Rotation (multiple target)

--]]
local frost = {
	-- Mouse binds
	BUTTON4 = "s|Flurry",
	BUTTON5 = "s|Frostbolt",
	["#"] = "s|Frozen Orb",
	[7] = "s|Icy Veins",
	-- Keyboard binds

	shift = {
		-- Mouse binds
		BUTTON4 = "s|Ebonbolt",
		BUTTON5 = "s|Ice Lance",
		["#"] = "s|Cone of Cold",
		[7] = "s|Cold Snap",
		-- Keyboard binds
		C = "m|/cast [@CURSOR,pet] Freeze"
	},
	alt = {
		-- Mouse binds
		BUTTON5 = "s|Glacial Spike",
		["#"] = "m|/cast [@CURSOR][] Blizzard"

		-- Keyboard binds
	},
	ctrl = {
	}
}
--["#"] = "s|Comet Storm"

draeBindings:RegisterKeyBindings("Arcane", bindings.base, base, arcane)
draeBindings:RegisterKeyBindings("Fire", bindings.base, base, fire)
draeBindings:RegisterKeyBindings("Frost", bindings.base, base, frost)
