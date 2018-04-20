if (select(2, UnitClass"player") ~= "WARRIOR") then return end

local _, bindings = ...

local warriorBase = {
	BUTTON3 = "s|Pummel", -- Interrupt
	[9] 	= "s|Charge",

	-- Mouse top three buttons
	[7]		= "s|Battle Cry",

	-- Keyboard only
	C 		= "m|/stopcasting\n/qc\n/cast Shadowmeld",
	E		= "s|Taunt",
	F		= "s|Berserker Rage",
	R		= "m|/qc\n/use 13", -- Trinket Slot 1

	shift = {
		BUTTON4	= "s|Victory Rush",
		[9]		= "m|/cast [@CURSOR] Heroic Leap",
	},

	alt = {
	},

	ctrl = {
	},
}

local arms = {
	BUTTON4 = "s|Colossus Smash",
	BUTTON5 = "s|Slam",

	shift = {
		BUTTON5	= "s|Mortal Strike",
	},

	alt = {
		BUTTON5	= "s|Execute",
	},
}

local fury = {
}

local prot = {
	BUTTON5 = "s|Devastate",
	["#"]	= "s|Shield Slam",
	[6]		= "s|Demoralizing Shout",

	shift = {
		BUTTON5 = "s|Revenge",
		["#"] 	= "s|Shield Block",
		[6]		= "s|Last Stand",
	},

	alt = {
		BUTTON5 = "s|Thunder Clap",
		["#"] 	= "s|Ignore Pain",
		[6]		= "s|Shield Wall",
		[9] 	= "s|Intercept",
	},

	ctrl = {
		["#"]	= "s|Neltharion's Fury",
		[6]		= "s|Spell Reflection",
	},

}

draeBindings:RegisterKeyBindings("Arms", bindings.base, warriorBase, arms)
draeBindings:RegisterKeyBindings("Fury", bindings.base, warriorBase, fury)
draeBindings:RegisterKeyBindings("Protection", 	bindings.base, warriorBase, prot)
