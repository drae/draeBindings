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

        --Widow Venom
--	[6] 	= "m|/cast [@mouseover,exists,help] Misdirection;[@focus,exists,help] Misdirection;[@pet,exists,nodead] Misdirection",


local hunterBase = {
    -- Mouse based
    BUTTON3	= "m|/stopcasting\n/cast Counter Shot", 					-- Talent
    ["#"]	= "m|/stopcasting\n/cast Kill Shot",

    [6] 	= "m|/stopcasting\n/cast Feign Death",
    [7] 	= "m|/cast [modifier] Revive Pet; [@pet,dead] Revive Pet; [pet] Mend Pet",
    [8]		= "s|Dire Beast",
    [9]		= "m|/cast Glaive Toss\n/cast Powershot\n/cast Barrage",

    -- Keyboard based
    C 		= "m|/petattack [nomodifier,pet]",
    E 		= "s|Taunt",  -- Pet
    R 		= "m|/qc\n/use 13", -- Trinket Slot 1
    T 		= "m|/cast Freezing Trap",

    shift = {
        BUTTON3	= "m|/cast Wyvern Sting\n/cast Binding Shot\n/cast Intimidation",
        BUTTON5	= "s|Multi-shot",
        ["#"]	= "m|/cast [@mouseover,exists,help] Misdirection;[@focus,exists,help] Misdirection;[@pet,exists,nodead] Misdirection",
        [6] 	= "m|/cancelaura Deterrence\n/stopcasting\n/cast Deterrence",
        [8]		= "m|/cast A Murder of Crows\n/cast Stampede",

        C		= "m|/petfollow [pet]",
        T 		= "s|Explosive Trap",
        R 		= "m|/qc\n/use 14", -- Trinket Slot 2
    },

    alt = {
        BUTTON4	= "m|/stopcasting\n/cast [@target,exists] Tranquilizing Shot",
        BUTTON5 = "s|Concussive Shot",
        ["#"]	= "s|Distracting Shot",
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
}

local marksmanship = {
    BUTTON5 = "s|Steady Shot",
    BUTTON4 = "s|Aimed Shot",

    shift = {
        BUTTON4 = "m|/use 14\n/cast Chimaera Shot",
    },

    alt = {

    },
}

draeBindings:RegisterKeyBindings("Beast Mastery", bindings.base, hunterBase, beastmastery)
draeBindings:RegisterKeyBindings("Survival", bindings.base, hunterBase, survival)
draeBindings:RegisterKeyBindings("Marksmanship", bindings.base, hunterBase, marksmanship)
