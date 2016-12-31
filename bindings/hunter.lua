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
        7						- Revive Pet/Mend Pet

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

    [6] 	= "m|/stopcasting\n/cast Feign Death",
    [7] 	= "m|/cast [modifier] Revive Pet; [@pet,dead] Revive Pet; [pet] Mend Pet",

    -- Keyboard based
    C 		= "m|/petattack [nomodifier,pet]",
    E 		= "s|Taunt",  -- Pet
    R 		= "m|/qc\n/use 13", -- Trinket Slot 1
    T 		= "m|/cast Freezing Trap",

    shift = {
        BUTTON3	= "m|/cast Wyvern Sting\n/cast Binding Shot\n/cast Intimidation",
        ["#"]	= "m|/cast [@mouseover,exists,help] Misdirection;[@focus,exists,help] Misdirection;[@pet,exists,nodead] Misdirection",
        [6] 	= "m|/cancelaura Deterrence\n/stopcasting\n/cast Deterrence",

        C		= "m|/petfollow [pet]",
        T 		= "s|Explosive Trap",
        R 		= "m|/qc\n/use 14", -- Trinket Slot 2
    },

    alt = {
        BUTTON5 = "s|Concussive Shot",
        [6]		= "m|/stopcasting\n/cast Disengage",

        T 		= "s|Ice Trap",
        E 		= "m|/cast [@mouseover,help][@target,help][] Intervene", 	-- Pet
    },

    ctrl = {
        [6] 	= "s|Camouflage",

        C		= "m|/stopcasting\n/cast [@mouseover,help] Master's Call; [@player] Master's Call",
    },
}

local survival = {
}

local beastmastery = {
    ["#"]	= "m|/stopcasting\n/cast Kill Shot",

    ctrl = {
        C		= "m|/stopcasting\n/cast [@mouseover,help] Master's Call; [@player] Master's Call",
    },
}

local marksmanship = {
    BUTTON4 = "s|Sidewinders",
    BUTTON5 = "s|Aimed Shot",
    ["#"]   = "m|/cast [talent:6/1]A Murder of Crows; [talent:6/2] Barrage; [talent:6/3] Volley",

    shift = {
        BUTTON4 = "s|Marked Shot",
        BUTTON5 = "s|Black Arrow",
    },

    alt = {
        BUTTON5 = "s|Windburst",
    },
}

draeBindings:RegisterKeyBindings("Beast Mastery", bindings.base, hunterBase, beastmastery)
draeBindings:RegisterKeyBindings("Survival", bindings.base, hunterBase, survival)
draeBindings:RegisterKeyBindings("Marksmanship", bindings.base, hunterBase, marksmanship)
