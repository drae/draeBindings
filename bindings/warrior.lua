if (select(2, UnitClass"player") ~= "WARRIOR") then return end

local _, bindings = ...

local warriorBase = {
	BUTTON3 = "s|Pummel", -- Interrupt
	[9] 	= "s|Charge",

	-- Keyboard only
	C 		= "m|/stopcasting\n/qc\n/cast Shadowmeld",
	E		= "s|Taunt",
	F		= "s|Berserker Rage",
	R		= "m|/qc\n/use 13", -- Trinket Slot 1

	shift = {
		[9]		= "m|/cast [@CURSOR] Heroic Leap",
	},

	alt = {
	},

	ctrl = {
		BUTTON4	= "s|Victory Rush",
	},
}

local arms = {
	BUTTON4 = "s|Overpower",
	BUTTON5 = "s|Slam",
	[";"] 	= "s|Whirlwind",
	[6]		= "s|Die by the Sword",

	["`"] 	= "s|Avatar",

	shift = {
		BUTTON4	= "s|Cleave",
		BUTTON5	= "s|Mortal Strike",
		[";"]	= "s|Bladestorm",
		[6]		= "s|Rallying Cry",
	},

	alt = {
		BUTTON4 = "s|Colossus Smash",
		BUTTON5	= "s|Execute",
	},

	ctrl = {
	}
}

local fury = {
	BUTTON4 = "s|Raging Blow",
	BUTTON5	= "s|Furious Slash",
	[";"] = "s|Whirlwind",
	["`"] = "s|Battle Cry",

	shift = {
		BUTTON4 = "s|Rampage",
		BUTTON5 = "s|Bloodthirst"
	},

	alt = {
		BUTTON5 = "s|Execute",
	},

}

local prot = {
	BUTTON5 = "s|Devastate",
	[";"]	= "s|Shield Slam",
	[6]		= "s|Demoralizing Shout",
	[9]		= "s|Shockwave",
	
	shift = {
		BUTTON5 = "s|Revenge",
		[";"] 	= "s|Shield Block",
		[6]		= "s|Last Stand",
	},

	alt = {
		BUTTON5 = "s|Thunder Clap",
		[";"] 	= "s|Ignore Pain",
		[6]		= "s|Shield Wall",
		[9] 	= "s|Intercept",
	},

	ctrl = {
		[6]		= "s|Spell Reflection",
	},

}

draeBindings:RegisterKeyBindings("Arms", bindings.base, warriorBase, arms)
draeBindings:RegisterKeyBindings("Fury", bindings.base, warriorBase, fury)
draeBindings:RegisterKeyBindings("Protection", 	bindings.base, warriorBase, prot)
