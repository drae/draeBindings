if (select(2, UnitClass 'player') ~= 'MONK') then
    return
end

local _, bindings = ...

--[[
		MOUSE3 = mousewheel click
		MOUSE4 = rear left side button
		MOUSE5 = front left side button
		# = extra button on side
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
		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
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
    BUTTON3 = 'm|/stopcasting\n/cast Spear Hand Strike',
    BUTTON4 = '',
    BUTTON5 = 's|Tiger Palm',
    [6] = 'm|/cast [known:Dance of the Wind] Dance of the Wind; [known:Dampen Harm] Dampen Harm',
    [7] = '',
    [8] = '',
    [9] = 's|Roll',
    ['#'] = 'm|/cast !Spinning Crane Kick',

    -- Keyboard based
    F = 'm|/use Healthstone\n/use Dreamwalker\'s Healing Potion',
    R = 'm|/use 13', -- Trinket 1
    ['\\'] = 'm|/cast [@MOUSEOVER,dead][@TARGET,dead][] Resuscitate',
    -- Clique bindings
    --	C 		= 'm|/cast [@MOUSEOVER,help][@PLAYER][] Detox',

    shift = {
        -- Mouse based
        BUTTON3 = 'm|/stopcasting\n/cast [known:Leg Sweep][@FOCUS,exists,harm][] Leg Sweep',
        BUTTON4 = '',
        BUTTON5 = 's|Blackout Kick',
        [6] = 's|Fortifying Brew',
        [7] = '',
        [8] = 's|Chi Burst',
        [9] = '',
        ['#'] = '',

        -- Keyboard based
        E = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Provoke',
        R = 'm|/use 14' -- Trinket 2
        -- Clique bindings
        --		[2] 	= "m|/cast [@MOUSEOVER,help][@PLAYER][] Tiger's Lust",
    },

    alt = {
        -- Mouse based
        BUTTON3 = 'm|/stopcasting\n/cast [known:Paralysis][@FOCUS,exists,harm][] Paralysis',
        BUTTON4 = '',
        BUTTON5 = 's|Rising Sun Kick',
        [6] = 'm|/cast [known:Diffuse Magic] Diffuse Magic',
        [7] = '',
        [8] = '',
        [9] = 's|Transcendence: Transfer'

        -- Keyboard based
    },

    ctrl = {
        -- Mouse based
        BUTTON3 = 'm|/cast [@CURSOR] Ring of Peace\n/cast Song of Chi-Ji',
        BUTTON4 = '',
        BUTTON5 = 's|Crackling Jade Lightning',
        [6] = '',
        [7] = '',
        [8] = '',
        [9] = 's|Transcendence',
        ['#'] = ''

        -- Keyboard based
    }
}

local mistweaver = {
    -- Mouse based
    BUTTON4 = 's|Jadefire Stomp',
    [7] = 's|Thunder Focus Tea',
    -- Clique bindings
    BUTTON4 = 'm|/target Treant Seedling\n/focus\n/targetlasttarget\n/cast [@FOCUS,exists][@MOUSEOVER,help][] Soothing Mist',
    --	BUTTON5 = 'm|/cast [@MOUSEOVER,help][] Renewing Mist',

    -- Keyboard based
    ['`'] = 'm|/cast [known:325197] Invoke Chi-Ji, the Red Crane; [known:322118] Invoke Yu\'lon, the Jade Serpent',

    shift = {
        -- Mouse based
        [7] = 's|Mana Tea',
        ['#'] = 's|Essence Font',
        -- Clique bindings
        --		BUTTON5 = 'm|/cast [@MOUSEOVER,help][] Vivify',

        -- Keyboard based
        F = 'm|/use Elemental Potion of Ultimate Power'
    },

    alt = {
        -- Mouse based
        -- Clique bindings
        --		BUTTON5 = 'm|/cast [@MOUSEOVER,help][] Enveloping Mist',
        --		[6] 	= 'm|/cast [@MOUSEOVER,help][] Life Cocoon',
        --		['#'] 	= 'm|/cast [@MOUSEOVER,help][] Sheilun\'s Gift',

        -- Keyboard based
        ['\\'] = 's|Reawaken'
    },

    ctrl = {
        -- Mouse based
        [6] = 's|Revival'

        -- Keyboard based
    }
}

local windwalker = {
    -- Mouse based
    BUTTON4 = 's|Jadefire Stomp',

    -- Keyboard based
    ['`'] = 's|Invoke Xuen, the White Tiger',

    shift = {
        -- Mouse based
        BUTTON4 = 's|Touch of Death',
        [9] = 's|Flying Serpent Kick',
        ['#'] = 'm|/cast !Fists of Fury',

        -- Keyboard based
        F = 'm|/use Elemental Potion of Ultimate Power'
    },
    alt = {
        -- Mouse based
        BUTTON4 = 'm|/cast [known:Serenity] Serenity; [known:137639] Storm, Earth, and Fire'

        -- Keyboard based
    },
    ctrl = {
        -- Mouse based
        ["#"] = "s|Whirling Dragon Punch",
        [6] = 's|Touch of Karma'

        -- Keyboard based
    }
}

local brewmaster = {
    -- Mouse based

    -- Keyboard based

    shift = {
        -- Mouse based

        -- Keyboard based
    },

    alt = {
        -- Mouse based

        -- Keyboard based
    },

    ctrl = {
        -- Mouse based

        -- Keyboard based
    }
}

draeBindings:RegisterKeyBindings('Brewmaster', bindings.base, monkBase, brewmaster)
draeBindings:RegisterKeyBindings('Mistweaver', bindings.base, monkBase, mistweaver)
draeBindings:RegisterKeyBindings('Windwalker', bindings.base, monkBase, windwalker)
