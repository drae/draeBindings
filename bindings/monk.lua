if (select(2, UnitClass"player") ~= "MONK") then return end

local _, bindings = ...

--[[
		Clique setup
		------------

		Mouseover healing (BUTTON4 at rear)

		BUTTON4			Renewing Mist
		shift-BUTTON4	Surging Mist
		alt-BUTTON4
		ctrl-BUTTON4

		BUTTON5			Soothing Mist
		shift-BUTTON5	Enveloping Mist
		alt-BUTTON5		Uplift
		ctrl-BUTTON5

		C				Cleanse

		General setup
		-------------

		-- Mouse
		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Interrupts/Stuns/CC
		6                       Defensive cooldowns
		7                       Misc / Sacred Shield / Divine Shield / Divine Plea
		8                       All HoPo uses
		9                       Misc / Talents

		-- Keyboard
		E                       Taunts
		F                       Get out of jail free -> Every man for himself, Emancipate, Healthstone
		R                       Trinkets
		G                       Cooldown
		`                       Avenging Wrath and anything that should be tied to its use
		\                       Redemption/Mass Ressurection
--]]

local monkBase = {
	-- Mouse based
	BUTTON3	= "m|/stopcasting\n/cast Leg Sweep",				-- Interrupt
	BUTTON4 = "s|Blackout Kick", 										-- Main Rotation
	["#"] 	= "m|/cast !Spinning Crane Kick\n/cast !Rushing Jade Wind",	-- Main rotation - AoE
	[6]		= "m|/cast Dampen Harm\n/cast Diffuse Magic", 				-- Damage reduction (<3 min)
	[7]		= "",
	[8]		= "s|Uplift",
	[9]		= "s|Roll",

	-- Keyboard based
	C		= "m|/cast [@MOUSEOVER][] Detox", 								-- Dispell
	E 		= "s|Provoke",													-- Taunt
	R		= "m|/use 12",													-- Trinket 1
	["\\"] 	= "m|/cast [@MOUSEOVER,dead][@TARGET,dead][] Resuscitate",		-- Res
	["`"] 	= "m|/cast Tigereye Brew\n/cast Invoke Xuen, the White Tiger",	-- "Major" cooldown

	shift 	= {
		-- Mouse based
		BUTTON3	= "m|/cast [@MOUSEOVER,help][] Ring of Peace\n/cast Leg Sweep",
		[6]		= "s|Fortifying Brew", 							-- Damage Reduction (>= 3min)
		[7]		= "s|Zen Meditation",							-- Kinda like bubble ... but not really ...
		[8]		= "m|/cast [@MOUSEOVER,help][] Chi Wave\n/cast [@MOUSEOVER,help][] Zen Sphere\n/cast Chi Burst",
		[9] 	= "s|Flying Serpent Kick",

		-- Keyboard based
		R		= "m|/use 13",		-- Trinket 2 on use,
		G		= "s|Chi Brew",
	},

	alt 	= {
		-- Mouse based
		BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,harm][] Paralysis", 	-- Long term CC
		BUTTON4 = "s|Expel Harm",
		BUTTON5 = "s|Crackling Jade Lightning",
		["#"]	= "s|Touch of Death",
		[6] 	= "m|/cast Fortifying Brew\n/cast Touch of Karma", -- Damage Reduction (Other)
		[7]		= "",
		[8]		= "",
		[9]		= "m|/cast [@MOUSEROVER,help][] Tiger's Lust",	-- Speed increase

		-- Keyboard based
	},

	ctrl 	= {
		-- Mouse based
		BUTTON3	= "s|Grapple Weapon",
		BUTTON4 = "",
		BUTTON5 = "",
		["#"] 	= "s|Healing Sphere",
		[6]		= "",
		[7]		= "s|Revival",
		[8]		= "",
		[9]		= "",

		-- Keyboard based
	},
}

local mistweaver = {
	-- Keyboard based
	G	= "s|Thunder Focus Tea",

	shift 	= {
		-- Mouse based

		-- Keyboard based
	},

	alt = {
		-- Mouse based
		[7]		= "s|Mana Tea",

		-- Keyboard based
	},

	ctrl 	= {
		-- Mouse based

		-- Keyboard based
	},
}

local windwalker = {
	BUTTON4 = "s|Rising Sun Kick", 										-- Main Rotation
	BUTTON5 = "s|Tiger Palm",													-- Main Rotation

	-- Keyboard based
	G		= "s|Tigereye Brew",

	shift 	= {
		-- Mouse based
		BUTTON4 = "s|Blackout Kick", 										-- Main Rotation
		BUTTON5 = "s|Strike of the Windlord",													-- Main Rotation
		["#"]	= "s|Fists of Fury",

		-- Keyboard based
	},

	alt 	= {
		-- Mouse based
		BUTTON4 = "s|Tiger Palm", 										-- Main Rotation
		BUTTON5 = "s|Rising Sun Kick",													-- Main Rotation

		-- Keyboard based
	},

	ctrl 	= {
		-- Mouse based

		-- Keyboard based
	},
}

local brewmaster = {
	-- Mouse based

	-- Keyboard based

	shift 	= {
		-- Mouse based

		-- Keyboard based
	},

	alt		= {
		-- Mouse based

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
