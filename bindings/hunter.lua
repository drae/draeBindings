if(select(2, UnitClass"player") ~= "HUNTER") then return end

local _, bindings = ...

--[[
		Clique setup
		------------

		Mirror setup here for mouseover abilities

		General setup
		-------------

		", # 					- primary rotation abilities
		BUTTON4					-
		BUTTON5					- Stings
		BUTTON3					- Interrupts/Stuns/CC

		5 						- all defensive cooldowns, camoflage
		6						- Misdirect
		7						- Revive Pet/Mend Pet

		8 		 				- All HoPo uses
		9						- Misc / Talents

		C						- Pet attack, follow, revive, etc.
		T						- Traps
		E						- Taunts
		F						- Get out of jail free -> Every man for himself, Healthstone
		R						- Trinkets
		G						- Cooldown
		`						- Avenging Wrath and anything that should be tied to its use
		\						- Redemption/Mass Ressurection
--]]

local hunterBase = {
	-- Mouse based
	BUTTON3	= "m|/stopcasting\n/cast Counter Shot", 					-- Talent
	BUTTON5 = "s|Serpent Sting",
	["'"] 	= "s|Arcane Shot",
	["#"] 	= "m|/cast [@target,exists] Cobra Shot",
	[5] 	= "m|/stopcasting\n/cast Feign Death",
	[6] 	= "m|/cast [@mouseover,exists,help] Misdirection;[@focus,exists,help] Misdirection;[@pet,exists,nodead] Misdirection",
	[7] 	= "m|/cast [modifier] Revive Pet; [@pet,dead] Revive Pet; [pet] Mend Pet",
	[9]		= "m|/cast Glaive Toss\n/cast Powershot\n/cast Barrage",

	-- Keyboard based
	C 		= "m|/cast Hunter's Mark\n/petattack [nomodifier,pet]",
	E 		= "s|Taunt",  -- Pet
	F 		= "m|/stopcasting\n/qc\n/cast Every Man for Himself",
	R 		= "m|/qc\n/use 13", -- Trinket Slot 1
	T 		= "m|/cast Freezing Trap",
	["`"] 	= "m|/stopcasting\n/use 10\n/cast Rapid Fire\n/cast Call of the Wild",

	shift = {
		BUTTON3	= "m|/cast Wyvern Sting\n/cast Binding Shot\n/cast Intimidation",
		BUTTON5	= "s|Widow Venom",
		["'"]	= "s|Multi-shot",
		["#"]	= "m|/stopcasting\n/cast Kill Shot",
		[5] 	= "m|/cancelaura Deterrence\n/stopcasting\n/cast Deterrence",
		[9] 	= "m|/cast Fervor\n/cast [@target,exists,harm] Dire Beast",

		C		= "m|/petfollow [pet]",
		T 		= "s|Explosive Trap",
		R 		= "m|/qc\n/use 14", -- Trinket Slot 2
	},
	alt = {
		BUTTON4	= "m|/stopcasting\n/cast [@target,exists] Tranquilizing Shot",
		["'"] 	= "s|Concussive Shot",
		["#"]	= "s|Distracting Shot",
		[5]		= "m|/stopcasting\n/cast Disengage",
		[8]		= "s|Stampede",
		[9]		= "m|/cast A Murder of Crows\n/cast Blink Strike\n/cast Lynx Rush",

		C		= "s|Hunter's Mark",
		T 		= "s|Ice Trap",
		E 		= "m|/cast [@mouseover,help][@target,help][] Intervene", 	-- Pet
	},

	ctrl = {
		BUTTON5	= "m|/cast [@mouseover,harm] Scatter Shot; [harm] Scatter Shot",
		[5] 	= "s|Camouflage",

		C		= "m|/stopcasting\n/cast [@mouseover,help] Master's Call; [@player] Master's Call",
		T 		= "s|Snake Trap",
	},
}

local beastmastery = {
	BUTTON4 = "m|/stopcasting\n/qc 1\n/use 10\n/cast Bestial Wrath\n/cast Kill Command",
	[8] 	= "s|Focus Fire",

	shift = {
		[4]	= "m|/cast [@mouseover,help][@target,help][@player][] Spirit Mend",
	},
	alt = {
		[8] = "s|Intimidation",
	},
}

local survival = {
	[8] 	= "m|/use 10\n/cast Explosive Shot",

	shift = {
		[8] = "m|/cast Black Arrow",
	},
}

draeBindings:RegisterKeyBindings("Beast Mastery", bindings.base, hunterBase, beastmastery)
draeBindings:RegisterKeyBindings("Survival", bindings.base, hunterBase, survival)
