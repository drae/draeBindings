if(select(2, UnitClass'player') ~= 'MAGE') then return end

local _, bindings = ...

--[[
		Clique setup
		------------

		Mirror setup here for mouseover healing (BUTTON4 at rear)

		shift-BUTTON4	- Cleanse

		General setup
		-------------

		', #, BUTTON4, BUTTON5 	- Primary rotation abilities
		BUTTON3					- Interrupts/Stuns/CC

		5 						- Defensive cooldowns
		6						- Power generation / Immunities
		7						- Group cooldown

		8 		 				- All HoPo uses
		9						- Misc / Talents

		E						- Taunts
		F						- Get out of jail free -> Every man for himself, Emancipate, Healthstone
		R						- Trinkets

		G						- Secondary throughput Cooldowns
		`						- Major throughput cooldown

		\						- Mass Ressurection

--]]

local base = {
	-- Mouse binds
	BUTTON3 = "m|/qc\n/stopcasting\n/cast [@target,harm][] Counterspell",

	[6]		= "m|/cast Arcane Barrier\n/cast Blazing Barrier\n/cast Frost Barrier", -- Survivability (Tier 2)
	[8]		= "m|/cast Incanter's Ward\n/cast Rune of Power",
	[9]		= "s|Blink", 			-- Escape/CC

	-- Keyboard binds
	F	= "m|/stopcasting\n/qc\n/cast Stoneform", -- Out of jail free card
	R	= "m|/qc\n/use 12",

	["`"]	= "s|Time Warp",	-- Suggested macro

	shift = {
		-- Mouse binds
		BUTTON3 = "m|/stopcasting\n/cast Frost Nova",

		[6] 	= "m|/stopcasting\n/cancelaura Ice Block\n/cast Ice Block",

		-- Keyboard binds
		F		= "m|/use Healthstone\n/use Lifeblood",	-- Out of jail free card
		R		= "m|/qc\n/use 13",
	},

	alt	= {
		-- Mouse binds
		BUTTON3 = "m|/cast [combat] Presence of Mind\n/cast [@focus,harm][@target,harm][] Polymorph(Turtle)",
		
		[6]		= "m|/cancelaura Invisibility\n/cast Invisibility",
		[7] 	= "m|/cast Ice Floes", -- Cast on the move (Tier 1)

		-- Keyboard binds
		F		= "s|Slow Fall",
	},

	ctrl = {
		BUTTON3 = "m|/stopcasting\n/cast Spellsteal",
		BUTTON4 = "m|/cast Nether Tempest\n/cast Living Bomb\n/cast Frost Bomb",
	}
}

--[[
	
	Rotation (ST):
	
	Rotation (AoE):

]]
local arcane = {
	-- Mouse binds
	BUTTON5	= "s|Arcane Blast",

	-- Keyboard binds
	["`"]	= "m|/qc 4\n/cast Arcane Power\n/use 13\n/cast Lifeblood\n/cast Alter Time",	-- Suggested macro

	shift 	= {
		-- Mouse binds
		BUTTON5	= "m|/cast [nochanneling:Arcane Missiles] Arcane Missiles",
		["#"]	= "s|Arcane Explosion",
		[7]		= "s|Evocation", 	-- Replenishment
	},

	alt = {
		BUTTON5	= "s|Arcane Barrage",

		-- Keyboard binds
	}
}

--[[
	
	Rotation (ST):
	
	Rotation (AoE):

]]
local fire = {
	-- Mouse binds
	BUTTON4	= "s|Fire Blast",
	BUTTON5 = "s|Fireball",
	["#"] 	= "s|Cinder Strike",
	
	-- Keyboard binds

	shift 	= {
		-- Mouse binds
		BUTTON4	= "s|Phoenix's Flames",
		BUTTON5	= "s|Pyroblast",
		["#"] 	= "m|/cast [@CURSOR] Flamestrike",
	},
	
	alt = {
		BUTTON4 = "s|Scorch",
		BUTTON5 = "s|Combustion",
		["#"] 	= "s|Dragon's Breath",
	},
}

--[[

	Rotation (single target)

	Rotation (multiple target)

--]]
local frost = {
	-- Mouse binds
	BUTTON4 = "s|Ebonbolt",
	BUTTON5	= "s|Frostbolt",
	["#"]	= "s|Frozen Orb",
	[6]		= "s|Ice Barrier",
	[7]		= "s|Icy Veins",

	-- Keyboard binds

	shift 	= {
		-- Mouse binds
		BUTTON4 = "s|Flurry",
		BUTTON5	= "s|Ice Lance",
		["#"]	= "s|Cone of Cold",
		[7]		= "s|Cold Snap",

		-- Keyboard binds
		C		= "m|/cast [pet] Freeze",
	},

	alt = {
		-- Mouse binds
		BUTTON5	= "s|Glacial Spike",
		["#"]	= "m|/cast [@CURSOR] Blizzard",
	
		-- Keyboard binds
	}
}

draeBindings:RegisterKeyBindings('Arcane', bindings.base, base, arcane)
draeBindings:RegisterKeyBindings('Fire', bindings.base, base, fire)
draeBindings:RegisterKeyBindings('Frost', bindings.base, base, frost)
