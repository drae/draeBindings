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

	BUTTON4 = "m|/cast Nether Tempest\n/cast Living Bomb\n/cast Frost Bomb",
	BUTTON5 = "m|/cast Presence of Mind\n/cast Scorch\n/cast Ice Floes", -- Cast on the move (Tier 1)

	[5]		= "m|/cast Temporal Shield\n/cast Blazing Speed\n/cast Ice Barrier", -- Survivability (Tier 2)
	[6]		= "m|/use Mana Gem", -- Replenishment

	[8]		= "m|/cast Incanter's Ward\n/cast Rune of Power",
	[9]		= "s|Blink", 			-- Escape/CC

	-- Keyboard binds
	F	= "m|/stopcasting\n/qc\n/cast Stoneform", -- Out of jail free card

	G 	= "s|Mirror Image",
	R	= "m|/qc\n/use 12",
	C	= "m|/petattack [nomodifier,pet]",

	shift = {
		-- Mouse binds
		BUTTON3 = "m|/stopcasting\n/cast Frost Nova",
		BUTTON4 = "m|/cast [@mouseover,help][] Decurse",

		[5] 	= "m|/stopcasting\n/cancelaura Ice Block\n/cast Ice Block",
		[6]		= "s|Evocation", 	-- Replenishment
		[9]		= "m|/cast [@mouseover,help][] Ice Ward\n/cast Ring of Frost\n/cast Lockjaw",-- Escape/CC (Tier 3)

		-- Keyboard binds
		F		= "m|/use Healthstone\n/use Lifeblood",	-- Out of jail free card
		R		= "m|/qc\n/use 13",
		C		= "m|/petpassive\n/petfollow\n/petassist",
	},

	alt	= {
		-- Mouse binds
		BUTTON3 = "m|/qc\n/cast [combat] Presence of Mind\n/cast [@focus,harm][@target,harm][] Polymorph(Turtle)",
		BUTTON5	= "s|Flamestrike",
		["#"]	= "s|Arcane Explosion",
		[5]		= "m|/cancelaura Invisibility\n/cast Invisibility",
		[6]		= "m|/qc\n/cast Presence of Mind\n/cast Conjure Mana Gem",

		-- Keyboard binds
		F	= "s|Slow Fall",
		C	= "s|Freeze",
	},

	ctrl = {
		BUTTON3 = "m|/stopcasting\n/cast Spellsteal",
	}
}

local arcane = {
	-- Mouse binds
	["'"]	= "s|Arcane Blast",

	-- Keyboard binds
	["`"]	= "m|/qc 4\n/cast Arcane Power\n/use 13\n/cast Lifeblood\n/cast Alter Time",	-- Suggested macro

	shift 	= {
		-- Mouse binds
		["'"]	= "m|/cast [nochanneling:Arcane Missiles] Arcane Missiles",
	},

	alt = {
		["'"]	= "s|Arcane Barrage",

		-- Keyboard binds
		["`"]	= "m|/use Potion of the Jade Serpent\n/cast Arcane Power\n/use 13\n/cast Lifeblood\n/cast Alter Time",	-- Suggested macro
	}
}

local fire = {
	-- Mouse binds
	["'"]	= "s|Fireball",
	["#"]	= "s|Pyroblast",

	shift 	= {
		-- Mouse binds
		["'"]	= "m|/stopcasting\n/cast Inferno Blast",
		["#"]	= "s|Combustion",
	},

	-- Keyboard binds
	["`"]	= "m|/cancelaura Alter Time\n/use Potion of the Jade Serpent\n/use 13\n/cast Lifeblood\n/cast Presence of Mind\n/cast Alter Time\n/cast Pyroblast",	-- Suggested macro
}

--[[

	Rotation (single target)
		Bomb
		Frostbolt
		Ice Lance
		Frostfire Bolt

	Rotation (multiple target)

--]]
local frost = {
	-- Mouse binds
	["'"]	= "s|Frostbolt",
	["#"]	= "s|Frostfire Bolt",

	-- Keyboard binds
	["`"]	= "m|/use Potion of the Jade Serpent\n/qc 2\n/use 12\n/use 13\n/cast Icy Veins\n/cast Alter Time",	-- Suggested macro

	shift 	= {
		BUTTON3 = "m|/cast Frost Nova\n/cast [pet] Freeze",

		-- Mouse binds
		["'"]	= "s|Ice Lance",
		["#"]	= "s|Frozen Orb",
	},

	alt = {
		-- Mouse binds
		["'"]	= "s|Cone of Cold",
		["#"]	= "s|Deep Freeze",

		-- Keyboard binds
	}
}

draeBindings:RegisterKeyBindings('Arcane', bindings.base, base, arcane)
draeBindings:RegisterKeyBindings('Fire', bindings.base, base, fire)
draeBindings:RegisterKeyBindings('Frost', bindings.base, base, frost)
