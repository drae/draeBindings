if (select(2, UnitClass 'player') ~= 'PALADIN') then
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
		F                       Heal pot/healthstone, dps pot, mana pot
		R                       Trinkets
		G
		`                       Major dmg/healing cooldown
		\                       Redemption/Mass Ressurection
--]]

local palaBase = {
    -- Mouse based
    BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke',
    BUTTON5 = 's|Crusader Strike',
    --	['#']	= 'm|/cast [@PLAYER] Word of Glory',
    [9] = 's|Divine Steed',

    -- Keyboard based
    ['`'] = 'm|/use 14\n/use 13\n/cast Avenging Wrath',
    E = 'm|/stopcasting\n/cast [@FOCUS,known:Turn Evil][known:Turn Evil] Turn Evil',
    F = 'm|/use Healthstone\n/use Algari Healing Potion',
    R = 'm|/use 13',
    ['\\'] = 'm|/cast [@MOUSEOVER,dead,help][] Redemption',

    shift = {
        -- Mouse based
        BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Hammer of Justice',
        BUTTON5 = 's|Judgment',
        [6] = 'm|/stopcasting\n/cast Divine Shield',
        [8] = '',
        [9] = '',

        -- Keyboard based
        --		[1] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Protection',
        --		[2] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Freedom',
        --		[3] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Sacrifice',
        --		[4] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Sanctuary',

        C = "s|Arcane Torrent",
        E = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Hand of Reckoning',
        R = 'm|/use 14'
    },

    alt = {
        -- Mouse based
        BUTTON3 = 'm|/cast [@FOCUS,known:Repentance][known:Repentance] Repentance; [known:Blinding Light] Blinding Light',
        BUTTON4 = 'm|/cast [known:Divine Toll] Divine Toll',
        BUTTON5 = 's|Consecration'
    },

    ctrl = {
        -- Mouse based
        BUTTON5 = 's|Hammer of Wrath'
        --		[6] 	= 'm|/stopmacro\n/cast [@MOUSEOVER,help][@TARGET,help][@PLAYER] Lay on Hands',

        -- Keyboard based
        --		['\\'] = 'm|/cast [@MOUSEOVER,help,dead][] Intercesson'
    }
}

local prot = {
    BUTTON4 = "s|Avenger's Shield", -- Main rotation
    [6] = 's|Guardian of Ancient Kings',

    shift = {
        -- Mouse based
    },

    alt = {
        -- Mouse based
        ['#'] = "m|/cast [@TARGET,harm] Shield of the Righteous"
    },

    ctrl = {
        [6] = 's|Ardent Defender' -- Damage Reduction 3
    }
}

--[[
		(Row 1 = unmod, Row 2 = shift, Row 3 = alt, Row 4 = ctrl)

		BUTTON5 -> CORE [HEALING]
		Flash of Light

		BUTTON5 -> CORE [DPS]
		Crusader Strike
		Judgment
		Consecrate
		Hammer of Wrath

		SIDE BUTTON [;] -> HOPO SPENDERS
		Word of Glory
		Templar's Verdict
		Divine Storm

		BUTTON4 -> ROTATIONAL TALENTS
		Blade of justice
		Wake of Ashes

		KEYBOARD [`]-> PERSONAL COOLDOWNS
		Avenging Wrath

		TOP FIRST BUTTON [6] -> DEFENSIVE COOLDOWNS
		Shield of Vengeance
		Divine Shield
		Lay on Hands
]]
local ret = {
    -- Mouse based
    BUTTON4 = 's|Blade of Justice',
    [6] = 's|Divine Protection',

    shift = {
        -- Mouse based
        BUTTON4 = 'm|/use 13\n/cast Wake of Ashes',
        ['#'] = "s|Templar's Verdict", -- HoPo spender (3*)

        -- Keyboard based
        F = 'm|/use Tempered Potion'
    },

    alt = {
        -- Mouse based
        ['#'] = 's|Divine Storm', -- HoPo spender (3*)
        [6] = 's|Shield of Vengeance'

        -- Keyboard
    },

    ctrl = {
        ['#'] = 'm|/cast [@CURSOR,known:Final Reckoning][known:Final Reckoning] Final Reckoning; [known:Execution Sentence] Execution Sentence'
    }
}

--[[
		(Row 1 = unmod, Row 2 = shift, Row 3 = alt, Row 4 = ctrl)

		BUTTON5 -> CORE [HEALING]
		Holy Shock
		Flash of Light
		Holy Light
		Light of the Martyr

		BUTTON5 -> CORE [DPS]
		Crusader Strike
		Judgment
		Consecrate
		Hammer of Wrath

		SIDE BUTTON [;] -> HOPO SPENDERS
		Word of Glory
		Light of Dawn
		Shield of the Righteous

		BUTTON4 -> ROTATIONAL TALENTS
		Light's Hammer / Holy Prism

		KEYBOARD [`]-> OFFENSIVE COOLDOWNS
		Avenging Wrath

		TOP FIRST BUTTON [6] -> SELF DEFENCE COOLDOWNS
		Divine Protection
		Divine Shield
		-
		Lay on Hands

		TOP SECOND BUTTON [7] -> DEFENSIVE COOLDOWNS
		Divine Favor / Hand of Divinity
		Tyr's Deliverance
		Daybreak
		Aura Mastery
]]
local holy = {
    -- Mouse based
    BUTTON4 = "m|/cast [known:Holy Prism,@TARGET,harm] Holy Prism",
    [6] = 's|Divine Protection',
    [7] = 's|Tyr\'s Deliverance',
    [8] = 'm|/cast [@mouseover,help,nodead][@player][] Blessing of Summer',

    -- Keyboard based
    C = 's|Cleanse',

    shift = {
        -- Mouse based
        ['#'] = 's|Light of Dawn',
        [7] = 's|Aura Mastery',

        -- Keyboard based
        F = 'm|/use Tempered Potion'
    },

    alt = {
        -- Mouse based
        ['#'] = "m|/cast [@TARGET,harm] Shield of the Righteous",

        -- Keyboard based
        ['\\'] = 's|Absolution',
        F = 'm|/use Algari Mana Potion'
    },

    ctrl = {
        -- Mouse based

        -- Keyboard based
    }
}

draeBindings:RegisterKeyBindings('Protection', bindings.base, palaBase, prot)
draeBindings:RegisterKeyBindings('Retribution', bindings.base, palaBase, ret)
draeBindings:RegisterKeyBindings('Holy', bindings.base, palaBase, holy)
