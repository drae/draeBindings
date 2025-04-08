if (select(2, UnitClass "player") ~= "HUNTER") then
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

local hunterBase = {
    -- Mouse based
    BUTTON3 = "m|/stopcasting\n/cast Counter Shot", -- Talent
    [6] = "m|/stopcasting\n/cast Feign Death",
    [7] = "m|/cast [modifier] Revive Pet; [@pet,dead] Revive Pet; [pet] Mend Pet",
    ["#"] = "m|/cast [talent:1/3] A Murder of Crows; [talent:6/2] Barrage",

    -- Keyboard based
    C = "m|/petattack [nomodifier,pet]",
    R = "m|/q 0\n/use 13\n/q 1", -- Trinket Slot 1
    T = "m|/cast Freezing Trap",

    shift = {
        -- Mouse based
        [6] = "m|/cancelaura Aspect of the Turtle\n/stopcasting\n/cast Aspect of the Turtle",
        [9] = "s|Aspect of the Cheetah",
        ["#"] = "m|/cast [@focus,exists,help] Misdirection;[@pet,exists,nodead] Misdirection",

        -- Keyboard based
        C = "m|/petfollow [pet]",
        T = "s|Tar Trap",
        R = "m|/q 0\n/use 14\n/q 1" -- Trinket Slot 2
    },

    alt = {
        -- Mouse based
        ["#"] = "m|/cast [@FOCUS,exists,harm][] Concussive Shot",
        [6] = "m|/stopcasting\n/cast Disengage",

        -- Keyboard
        ["\\"] = "s|Heart of the Phoenix"
    },

    ctrl = {
        -- Mouse based
        [6] = "s|Exhilaration"

        -- Keyboard
    }
}

local survival = {
    -- Mouse based

    -- Keyboard based
    C = "m|/stopcasting\n/cast [@mouseover,help] Master's Call; [@player] Master's Call",

    alt = {
        -- Mouse based

        -- Keyboard based
        T = "s|Explosive Trap"
    },

    ctrl = {
        -- Mouse based

        -- Keyboard based
    }
}

local beastmastery = {
    -- Mouse based
    BUTTON4 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Barbed Shot",
    BUTTON5 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Cobra Shot",

    -- Keyboard based
    ["`"] = "m|/castsequence reset=2 Bestial Wrath, Aspect of the Wild",

    shift = {
        -- Mouse based
        BUTTON3 = "m|/cast [talent:5/1,@CURSOR] Binding Shot\n/cast [talent:5/2] Wyvern Sting\n/cast [talent:5/3] Intimidation",
        BUTTON4 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Multi-Shot",
        BUTTON5 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Kill Command",

        -- Keyboard based
        ["`"] = "s|Stampede"
    },

    alt = {
        -- Mouse based
        BUTTON5 = "m|/q 3\n/cast Claw(Basic Attack)\n/cast Bite(Basic Attack)\n/cast Smack(Basic Attack)\n/cast Chimaera Shot"

        -- Keyboard based
    },

    ctrl = {
        -- Mouse based

        -- Keyboard based
    }
}

local marksmanship = {
    -- Mouse based
    BUTTON5 = "s|Steady Shot",
    BUTTON4 = "s|Aimed Shot",
    [8] = "s|Rapid Fire",

    -- Keyboard based
    ["`"] = "m|/q 0\n/use 13\n/q 1\n/cast Trueshot",

    shift = {
        -- Mouse based
        BUTTON3 = "m|/cast [talent:5/3,@CURSOR] Binding Shot\n/cast [talent:3/3] Camouflage",
        BUTTON4 = "s|Multi-Shot",
        BUTTON5 = "s|Arcane Shot",
        [8] = "m|/cast [talent:7/3] Piercing Shot"

        -- Keyboard based
    },

    alt = {
        -- Mouse based
        BUTTON3 = "s|Bursting Shot",
        ["#"] = "m|/cast [talent:4/1,@CURSOR] Explosive Shot",

        -- Keyboard based
        ["C"] = "s|Hunter's Mark"
    },

    ctrl = {
        -- Mouse based

        -- Keyboard based
    }
}

draeBindings:RegisterKeyBindings("Beast Mastery", bindings.base, hunterBase, beastmastery)
draeBindings:RegisterKeyBindings("Survival", bindings.base, hunterBase, survival)
draeBindings:RegisterKeyBindings("Marksmanship", bindings.base, hunterBase, marksmanship)
