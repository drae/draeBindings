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
	[6] 	= 's|Fortifying Brew',
	[9] 	= 's|Roll',
	['#']	= 'm|/cast !Spinning Crane Kick',

	-- Keyboard based
	C 		= 'm|/cast [@MOUSEOVER,help][@PLAYER][] Detox',
	E 		= 's|Provoke',
	R 		= 'm|/use 13', -- Trinket 1
	['\\'] 	= 'm|/cast [@MOUSEOVER,dead][@TARGET,dead][] Resuscitate',

	shift = {
		BUTTON5 = 's|Blackout Kick',
		-- Mouse based
		[6] 	= 'm|/cast [known:Dance of the Wind] Dance of the Wind; [known:Dampen Harm] Dampen Harm',
--		[8] 	= 'm|/cast [@MOUSEOVER,help][] Chi Wave\n/cast Chi Burst',

		-- Keyboard based
		[2] 	= "m|/cast [@MOUSEOVER,help][@PLAYER][] Tiger's Lust",
		R 		= 'm|/use 14' -- Trinket 2 on use,
	},

	alt = {
		-- Mouse based
		BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,harm,known:Paralysis][] Paralysis',
		[6] 	= 'm|/cast [known:Yu\'lon\'s Grace] Yu\'lon\'s Grace; [known:Diffuse Magic] Diffuse Magic',
		[9] 	= 's|Transcendence: Transfer',
		['#'] 	= 'm|/cast !Refreshing Jade Wind\n/cast !Rushing Jade Wind',

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based
		BUTTON3 = 'm|/cast [@CURSOR] Ring of Peace\n/cast Song of Chi-Ji',
		BUTTON4 = '',
		BUTTON5 = 's|Crackling Jade Lightning',
		[9] 	= 's|Transcendence',

		-- Keyboard based
	}
}

local mistweaver = {
	[7]		= 's|Thunder Focus Tea',

	-- Keyboard based
	['`'] 	= 'm|/cast [@CURSOR][@PLAYER][] Summon Jade Serpent Statue\n/cast Invoke Chi-Ji, the Red Crane\n/cast Invoke Yu\'lon, the Jade Serpent',

	shift = {
		[7] 	= 's|Mana Tea',
		['#'] 	= 's|Essence Font',
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

	-- Keyboard based
	['`'] 	= 's|Invoke Xuen, the White Tiger',

	shift = {
		-- Mouse based
		BUTTON3 = 's|Spear Hand Strike',
		BUTTON4 = '',
		['#'] 	= 'm|/cast !Fists of Fury',
		[9] 	= 's|Flying Serpent Kick',

		-- Keyboard based
	},
	alt = {
		-- Mouse based
		BUTTON4 = 'm|/cast [known:152173] Serenity; Storm, Earth, and Fire',
		BUTTON5 = 's|Rising Sun Kick',

		-- Keyboard based
	},
	ctrl = {
		["#"]	= "s|Whirling Dragon Punch",
		[6] 	= 's|Touch of Karma',
	}
}

local brewmaster = {
	-- Mouse based
		[6] = "s|Ironskin Brew",
	-- Keyboard based

	shift = {
		BUTTON3 = 's|Spear Hand Strike',
		[6] 	= "s|Purifying Brew",
	},

	alt = {
		BUTTON4 = 's|Breath of Fire',
		BUTTON5 = 's|Keg Smash',
	},

	ctrl = {}
}

draeBindings:RegisterKeyBindings('Brewmaster', bindings.base, monkBase, brewmaster)
draeBindings:RegisterKeyBindings('Mistweaver', bindings.base, monkBase,	mistweaver)
draeBindings:RegisterKeyBindings('Windwalker', bindings.base, monkBase, windwalker)
