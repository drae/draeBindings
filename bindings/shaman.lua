if (select(2, UnitClass "player") ~= "SHAMAN") then
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

		BUTTON4
		shift-BUTTON4
		alt-BUTTON4
		ctrl-BUTTON4

		C				Cleanse

		General setup
		-------------

		-- Mouse
		#, 						Earth spells
		BUTTON4					Fire spells
		BUTTON5					Nature spells
		BUTTON3                 Interrupts/Stuns/CC
		6                       Defensive cooldowns
		7                       Party/Raid defensives
		8                       Class specials, e.g. hopo uses, etc.
		9						Movement speed enhancers

		-- Keyboard
		E                       Taunts
		F                       Healthstone/Pots
		R                       Trinkets
		G
		`                       Major dmg/healing cooldown
		\                       Redemption/Mass Ressurection
--]]

local shamanBase = {
    -- Mouse based
    BUTTON3 = 'm|/stopcasting\n/cast Wind Shear',
    BUTTON4 = 's|Flame Shock',
    BUTTON5 = 's|Lightning Bolt',
    [6] = 's|Astral Shift', -- Damage Reduction 1
    [7] = 's|Ancestral Guidance',
    [8] = '',
    [9] = 's|Ghost Wolf',
    ['#'] = '',

    -- Keyboard based
    C = 'm|/stopcasting\n/cast [@TARGET,help] Cleanse Spirit;[@TARGET,harm] Purge;[@SELF][] Cleanse Spirit', -- Dispell
    E = '', -- Taunt
    F = 'm|/use Healthstone\n/use Algari Healing Potion',
    R = 'm|/use 13',
    ['\\'] = 'm|/cast [@MOUSEOVER,dead][@TARGET,dead][] Ancestral Spirit', -- Redemption

    shift = {
        -- Mouse based
        BUTTON3 = 'm|/cast [@CURSOR][] Capacitor Totem',
        BUTTON4 = 's|Lava Burst',
        BUTTON5 = 'm|/startattack\n/cast Chain Lightning',
        [6] = 's|Stone Bulwark Totem', -- Damage Reduction 2
        [7] = '', -- Party damage reduction
        [9] = 's|Gust of Wind',

        -- Keyboard based
        [1] = '',
        [2] = '',
        [3] = '',
        [4] = 's|Tremor Totem',
        [5] = '',
        C = '',
        F = 's|Stoneform',
        R = 'm|/use  14'
    },

    alt = {
        -- Mouse based
        BUTTON3 = 'm|/cast [@FOCUS,exists,harm][] Hex',
        BUTTON4 = '',
        BUTTON5 = 's|Lightning Lasso',
        [6] = 's|Earth Elemental', -- Damage Reduction 4
        [7] = '', -- Party damage reduction
        [8] = '', -- Covenant tertiary
        [9] = 's|Spiritwalker\'s Grace',

        -- Keyboard based
        C = 'm|/cast [@FOCUS,harm,nodead][@TARGET,harm,nodead][@MOUSEOVER,harm][] Purge'
    },

    ctrl = {
        -- Mouse based
        BUTTON3 = 's|Thunderstorm',
        BUTTON4 = '',
        BUTTON5 = '',

        -- Keyboard based
        ['`'] = 's|Heroism', -- Major offensive cooldown
        [1] = '',
        [3] = '',
        [4] = '',
        [5] = '',
        [6] = 'm|/cast [@CURSOR][] Earthbind Totem'
    }
}

local elemental = {
    -- Mouse based
    ['#'] = 's|Earth Shock',

    -- Keyboard based
    ['`'] = 'm|/cast Stormkeeper',

    shift = {
        -- Mouse based
        ['#'] = 'm|/cast [@CURSOR][] Earthquake',

        -- Keyboard based
        ['`'] = 'm|/cast [known:Storm Elemental] Storm Elemental; [known:Fire Elemental] Fire Elemental'
    },

    alt = {
        -- Mouse based
        BUTTON4 = 'm|/castsequence reset=30 Primordial Wave, Nature\'s Swiftness', -- Main rotation

        -- Keyboard based
        ['`'] = 's|Ascendance'
    },

    ctrl = {
        BUTTON4 = 'm|/cast [@CURSOR][] Liquid Magma Totem' -- Main rotation
    }
}

local restoration = {
    -- Mouse based
    BUTTON4 = 's|Flame Shock', -- Main rotation
    ["#"] = 'm|/cast [@CURSOR][] Healing Rain',

    -- Keyboard based
    ['`'] = 'm|/cast [known:Ancestral Guidance] Ancestral Guidance',
    V = 'm|/cast [@MOUSEOVER][@SELF][] Earth Shield',

    shift = {
        -- Mouse based
        BUTTON4 = 's|Lava Burst', -- Main rotation
        [7] = 's|Cloudburst Totem',
        ["#"] = 's|Healing Stream Totem',

        -- Keyboard based
        C = 'm|/cast [known:Poison Cleansing Totem] Poison Cleansing Totem'
    },

    alt = {
        -- Mouse based
        [7] = 's|Healing Tide Totem',

        -- Keyboard based
        ['`'] = 's|Ascendance',
        [1] = '',
        [2] = '',
        [3] = '',
        [5] = '',
        ['\\'] = 's|Ancestral Vision',
        F = 'm|/use Algari Mana Potion'

    },

    ctrl = {
        -- Mouse based
        [7] = 'm|/cast [@CURSOR][] Spirit Link Totem'
    }
}

local enhancement = {}

draeBindings:RegisterKeyBindings("Elemental", bindings.base, shamanBase, elemental)
draeBindings:RegisterKeyBindings("Enhancement", bindings.base, shamanBase, enhancement)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, shamanBase, restoration)
