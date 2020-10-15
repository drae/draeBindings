if (select(2, UnitClass 'player') ~= 'MONK') then return end

local _, bindings = ...

--[[
		MOUSE3 = mousewheel click
		MOUSE4 = rear left side button
		MOUSE5 = front left side button
		; = extra button on side
		6 = first button on left mouse button edge
		7 = second button on left mouse button edge
		8 = tilt mousewheel left
		9 = tilt mouseright right

		Clique setup
		------------

		BUTTON5			"Instant" heal
		shift-BUTTON5	Fast cast heal
		alt-BUTTON5 	Slow cast heal
		ctrl-BUTTON5	Heal improver

		BUTTON4			Channeled heal
		shift-BUTTON4
		alt-BUTTON4
		ctrl-BUTTON4

		C				Cleanse

		General setup
		-------------

		-- Mouse
		;, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Interrupts/Stuns/CC
		6                       Defensive cooldowns
		7                       Special cooldowns
		8                       Class specials, e.g. hopo uses, etc.
		9						Movement speed enhancers

		-- Keyboard
		E                       Taunts
		F                       Get out of jail free -> Every man for himself, Emancipate, Healthstone
		R                       Trinkets
		G
		`                       Major dmg/healing cooldown
		\                       Redemption/Mass Ressurection
--]]

local monkBase = {
	-- Mouse based
	BUTTON3 = 'm|/stopcasting\n/cast Leg Sweep',
	BUTTON5 = 's|Tiger Palm',
	[';'] 	= 'm|/cast !Spinning Crane Kick\n/cast !Rushing Jade Wind',
	[9] 	= 's|Roll',

	-- Keyboard based
--	C 		= 'm|/cast [@MOUSEOVER,help][@PLAYER][] Detox',
	E 		= 's|Provoke',
	R 		= 'm|/use 12', -- Trinket 1
	['\\'] 	= 'm|/cast [@MOUSEOVER,dead][@TARGET,dead][] Resuscitate',

	shift = {
		-- Mouse based
		[6] 	= 'm|/cast Dampen Harm\n/cast Diffuse Magic',
--		[8] 	= 'm|/cast [@MOUSEOVER,help][] Chi Wave\n/cast [@MOUSEOVER,help][] Zen Sphere\n/cast Chi Burst',

		-- Keyboard based
		[2] 	= "m|/cast [@MOUSEOVER,help][@PLAYER][] Tiger's Lust",
		R 		= 'm|/use 13' -- Trinket 2 on use,
	},

	alt = {
		-- Mouse based
		BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,harm][] Paralysis',
		[9] 	= 's|Transcendence: Transfer',

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based
		BUTTON3 = 'm|/cast [@CURSOR] Ring of Peace\n/cast Song of Chi-Ji',
		BUTTON4 = 'm|/use Heart Essence',
		BUTTON5 = 's|Crackling Jade Lightning',
		[9] 	= 's|Transcendence',

		-- Keyboard based
	}
}

local mistweaver = {
	[6] 	= 's|Fortifying Brew',
	[7]		= 's|Thunder Focus Tea',

	-- Keyboard based
	['`'] 	= 'm|/cast [@CURSOR][@PLAYER][] Summon Jade Serpent Statue\n/cast Invoke Chi-Ji, the Red Crane\n/cast Refreshing Jade Wind',

	shift = {
		BUTTON5 = 's|Blackout Kick',
		[7] 	= 's|Mana Tea',
		[';'] 	= 's|Essence Font',
	},

	alt = {
		-- Mouse based
		BUTTON5 = 's|Rising Sun Kick',
--		[6] = 'm|/cast [@MOUSEOVER,help][] Life Cocoon',

		-- Keyboard based
		['\\'] = 's|Reawaken',
	},

	ctrl = {
		[6] 	= 's|Revival',
	}
}

local windwalker = {
	BUTTON4 = 's|Touch of Death',
	[6] 	= 's|Touch of Karma',

	-- Keyboard based
	['`'] 	= 'm|/cast Tigereye Brew\n/cast Invoke Xuen, the White Tiger',

	shift = {
		-- Mouse based
		BUTTON3 = 's|Spear Hand Strike',
		BUTTON4 = 's|Fist of the White Tiger',
		BUTTON5 = 's|Blackout Kick',
		[';'] 	= 'm|/cast !Fists of Fury',
		[9] 	= 's|Flying Serpent Kick',

		-- Keyboard based
	},
	alt = {
		-- Mouse based
		BUTTON4 = 's|Storm, Earth, and Fire',
		BUTTON5 = 's|Rising Sun Kick',
		[';'] 	= 's|Chi Burst',

		-- Keyboard based
	},
	ctrl = {
		[";"]	= "s|Whirling Dragon Punch",
	}
}

local brewmaster = {
	-- Mouse based
		[6] = "s|Ironskin Brew",
	-- Keyboard based

	shift = {
		BUTTON3 = 's|Spear Hand Strike',
		BUTTON4 = 's|Expel Harm',
		BUTTON5 = 's|Blackout Strike',
		[6] = "s|Purifying Brew",
	},

	alt = {
		BUTTON4 = 's|Breath of Fire',
		BUTTON5 = 's|Keg Smash',
		[6]	= 's|Fortifying Brew',
	},

	ctrl = {}
}

draeBindings:RegisterKeyBindings('Brewmaster', bindings.base, monkBase, brewmaster)
draeBindings:RegisterKeyBindings('Mistweaver', bindings.base, monkBase,	mistweaver)
draeBindings:RegisterKeyBindings('Windwalker', bindings.base, monkBase, windwalker)
