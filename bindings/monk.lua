if (select(2, UnitClass"player") ~= "MONK") then return end

local _, bindings = ...

--[[
--]]

local monkBase = {
	-- Mouse based
	BUTTON3	= "m|/stopcasting\n/cast Spear Hand Strike",	-- Interrupt
	BUTTON4 = "m|/cast !Spinning Crane Kick\n/cast !Rushing Jade Wind", -- Main Rotation - AoE
	["'"]	= "s|Jab", 					-- Main rotation
	["#"] 	= "s|Blackout Kick",  		-- Main rotation
	[5]		= "m|/cast Dampen Harm\n/cast Diffuse Magic", -- Damage reduction (<3 min)
	[9]		= "s|Roll", 				-- Escape/CC

	-- Keyboard based
	C		= "m|/cast [@MOUSEOVER][] Detox", -- Dispell
	E 		= "s|Provoke",			-- Taunt
	R		= "m|/qc\n/use 12",		-- Trinket 1
	F		= "s|Nimble Brew",	-- Get out of jail free card
	["\\"] 	= "m|/cast [@MOUSEOVER,dead][@TARGET,dead][] Resuscitate",	-- Res
	["`"] 	= "m|/use 12\n/use 13\n/cast Tigereye Brew\n/cast Invoke Xuen, the White Tiger",	-- "Major" cooldown

	shift 	= {
		-- Mouse based
		BUTTON3	= "s|Grapple Weapon",
		["'"] 	= "s|Tiger Palm",								-- Main rotation
		[5]		= "s|Fortifying Brew", 							-- Damage Reduction (>= 3min)
		[6]		= "s|Zen Meditation",							-- Kinda like bubble ... but not really ...
		[9] 	= "s|Flying Serpent Kick",

		-- Keyboard based
		F		= "m|/use 13",			-- Trinket (pvp)
		R		= "m|/qc\n/use 13",		-- Trinket 2 on use,
		G		= "s|Chi Brew",
	},

	alt 	= {
		-- Mouse based
		BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,harm][] Paralysis", 	-- Long term CC
		BUTTON4 = "m|/cast [@MOUSEROVER,help][] Chi Wave\n/cast [@MOUSEOVER,help][] Zen Sphere\n/cast Chi Burst",
		["'"]	= "m|/cast [@MOUSEOVER,help][] Expel Harm", 			-- "Main" rotation

		[5] 	= "s|Touch of Karma", 									-- Damage Reduction (Other)
		[9]		= "m|/cast [@MOUSEROVER,help][] Tiger's Lust",	-- Speed increase

		-- Keyboard based
	},

	ctrl 	= {
		-- Mouse based
		BUTTON3	= "m|/cast [@MOUSEOVER,help][] Ring of Peace\n/cast Leg Sweep",
		["'"]	= "s|Crackling Jade Lightning",
		["#"] 	= "s|Touch of Death", -- Main rotation

		-- Keyboard based
	},
}

local brewmaster = {
	-- Mouse based
	BUTTON4	= "s|Dizzying Haze",
	["#"] 	= "s|Blackout Kick",  	-- Main rotation
	[8]		= "s|Guard",

	-- Keyboard based
	G		= "s|Elusive Brew",

	shift 	= {
		-- Mouse based
		E = "m|/target Black Ox Statue\n/cast Provoke\n/targetlasttarget",	-- aoe taunt

		-- Keyboard based
	},

	alt		= {
		-- Mouse based
		["'"]	= "s|Keg Smash",

		-- Keyboard based
	},
}

local mistweaver = {
	-- Mouse based
	[7]		= "s|Revival",	-- Raid cooldown

	-- Keyboard based
	G	= "s|Thunder Focus Tea",

	shift 	= {
		-- Mouse based
		BUTTON5 = "m|/cast [@MOUSEOVER,help][] Surging Mist",
		BUTTON4 = "s|Uplift",

		-- Keyboard based

	},

	alt = {
		-- Mouse based
		[6]		= "s|Mana Tea",
	},
}

local windwalker = {

	-- Keyboard based
	G		= "s|Tigereye Brew",

	shift 	= {
		-- Mouse based
		["#"] = "s|Fists of Fury",	 -- Main rotation

		-- Keyboard based
	},

	alt 	= {
		-- Mouse based
		["#"] 	= "s|Rising Sun Kick", 		-- Main rotation
		[6]		= "s|Energizing Brew", 		-- Mana/Energy/Rage return

		-- Keyboard based
	},

	ctrl 	= {
		-- Mouse based

		-- Keyboard based
	},
}

draeBindings:RegisterKeyBindings("Brewmaster", bindings.base, monkBase, brewmaster)
draeBindings:RegisterKeyBindings("Mistweaver", bindings.base, monkBase, mistweaver)
draeBindings:RegisterKeyBindings("Windwalker", bindings.base, monkBase, windwalker)
