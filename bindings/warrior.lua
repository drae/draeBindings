if (select(2, UnitClass"player") ~= "WARRIOR") then return end

local _, bindings = ...

local warriorBase = {
	BUTTON3 = "s|Pummel", -- Interrupt
	BUTTON4	= "s|Victory Rush",

	-- Mouse top three buttons
	[5] 	= "s|Shield Wall", -- Damage Reduction 1
	[6]		= "s|Charge",

	-- Keyboard only
	E 		= "m|/stopcasting\n/cast [nostance:2] Defensive Stance; [stance:2, target=mouseover, exists, harm][stance:2, nodead, harm][stance:2, target=targettarget, nodead, harm][stance:2] Taunt",
	F 		= "m|/stopcasting\n/qc\n/cast Stoneform",
	R		= "m|/qc\n/use 13", -- Trinket Slot 1

	shift = {
		BUTTON5 = "s|Slam",

		[1]		= "s|Battle Stance",
		[2]		= "s|Berserker Stance",
		[3]		= "s|Defensive Stance",
	},

	ctrl = {
	},
}

local arms = {
	BUTTON5	= "s|Heroic Strike",
	["'"]	= "s|Mortal Strike",
	["#"]	= "s|Overpower", -- Main rotation

	shift = {
		["'"] = "s|Cleave",
	},

	alt = {
		["#"] = "m|/cast [nomod,nostance:1] Battle Stance\n/cast Rend",
		["'"]	= "s|Execute",
	},
}

local fury = {
}

local prot = {
}

draeBindings:RegisterKeyBindings("Arms", bindings.base, warriorBase, arms)
draeBindings:RegisterKeyBindings("Fury", bindings.base, warriorBase, fury)
draeBindings:RegisterKeyBindings("Protection", 	bindings.base, warriorBase, prot)
