if (select(2, UnitClass"player") ~= "PALADIN") then return end

local _, bindings = ...

--[[
		Clique setup
		------------

		Mouseover healing (BUTTON4 at rear)

		BUTTON4			
		shift-BUTTON4	Flash of Light
		alt-BUTTON4
		ctrl-BUTTON4

		BUTTON5			Holy Shock
		shift-BUTTON5	Holy Light
		alt-BUTTON5
		ctrl-BUTTON5

		C				Cleanse
		V				Beacon of Light/Faith

		General setup
		-------------

		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Interrupts/Stuns/CC

		E                       Taunts
		F                       Get out of jail free -> Every man for himself, Emancipate, Healthstone
		R                       Trinkets
		G                       Cooldown
		`                       Avenging Wrath and anything that should be tied to its use
		\                       Redemption/Mass Ressurection
--]]

local palaBase = {
	-- Mouse based
	BUTTON4 = "s|Judgment",                                                                                     -- Main rotation
	BUTTON5 = "s|Crusader Strike",																				-- Main rotation
    [7]     = "s|Divine Shield",
    
	-- Keyboard based
	["`"]   = "s|Avenging Wrath",  -- Avenging Wrath
	C		= "m|/cast [@MOUSEOVER,help][] Cleanse\n/cast [@MOUSEOVER,help][] Cleanse Toxins",                   -- Dispell
	E		= "m|/stopcasting\n/cast Hand of Reckoning",                       -- Taunt
	F		= "m|/stopcasting\n/cast Every Man for Himself",           -- Out of jail free card
	R		= "m|/use 13",
	["\\"]	= "m|/cast [@MOUSEOVER,dead][@TARGET,dead][] Redemption",  -- Redemption

	shift = {
		-- Mouse based
		BUTTON3	= "s|Hammer of Justice",
	
		-- Keyboard based
		[1]		= "m|/cast [@MOUSEOVER,help][] Blessing of Protection",
		[2]		= "m|/cast [@MOUSEOVER,help][] Blessing of Freedom",
		[3]		= "m|/cast [@MOUSEOVER,help][] Blessing of Salvation",
		[4]		= "m|/cast [@MOUSEOVER,help][] Blessing of Sacrifice",
		E		= "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Hand of Reckoning",  -- Focus taunt
		F		= "m|/use Healthstone",
		R		= "m|/use 14",
	},

	alt = {
		-- Mouse based
		BUTTON3	= "m|/cast [talent:3/2] Repentance; [talent:3/3] Blinding Light",
		[9]		= "s|Divine Steed",
	},

	ctrl = {
		-- Mouse based
		[6]     = "m|/stopcasting\n/cast [@MOUSEOVER,help][@TARGET,help][@PLAYER] Lay on Hands",  -- Damage Reduction 4
	},

}

local prot = {
   	BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke", 
	["#"]   = "s|Shield of the Righteous",  

	[1]		= "m|/cast [talent:4/3, @PLAYER] Blessing of Spellwarding",

	shift = {
		-- Mouse based
		BUTTON4 = "s|Consecration",       		-- Main rotation
		BUTTON5 = "s|Avenger's Shield",         -- Main rotation
        ["#"]   = "s|Light of the Protector", 
    	[6]     = "s|Guardian of Ancient Kings",
	},

	alt = {
		-- Mouse based
		[6]     = "s|Ardent Defender",  -- Damage Reduction 3
		["#"] 	= "m|/cast [talent:7/3] Seraphim",
	},

	ctrl = {
		["#"]	= "m|/cast [talent:2/3] Bastion of Light",
	}

}

local retri = {
	-- Mouse based
	BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke", 
	[6]     = "s|Shield of Vengeance",
    [8]		= "s|Templar's Verdict",	-- HoPo spender (3*)
	[9]		= "m|/cast [talent:1/3][] Execution Sentence",  -- Lvl 90 talent
    ["#"]   = "s|Wake of Ashes",

	-- Keyboard based
	["`"] = "m|/cast Avenging Wrath",

	shift = {
		-- Mouse based
		BUTTON4	= "s|Consecration",
        BUTTON5 = "s|Blade of Justice",
	    [8]		= "m|/cast [talent:6/2] Justicar's Vengeance; [talent:5/3] Eye for an Eye; [talent:6/3, @PLAYER] Word of Glory",	-- HoPo spender (5*)
	},

	alt = {
		-- Mouse based
	    [8]		= "s|Divine Storm",	-- HoPo spender (3*)
	},
}

local holy = {
	-- Mouse based
	["#"]   = "s|Light of Dawn",                      
	[6]     = "s|Divine Protection",
    [9]     = "m|/cast [talent:5/3] Holy Avenger; [talent:5/2] Holy Prism",  -- Lvl 90 talent

	["`"] 	= "m|/cast Avenging Wrath",

	shift = {
		-- Mouse based
		BUTTON4	= "s|Consecration",
		BUTTON5	= "m|/cast [@TARGET,harm][] Holy Shock",
        ["#"]   = "m|/cast [talent:1/3, @CURSOR] Light's Hammer", -- Talent row 1
        [7]     = "s|Aura Mastery",

		-- Keyboard based
	},

	alt = {
		-- Mouse based

        -- Keyboard        
		["\\"]  = "s|Absolution",
	},

	ctrl = {
		["#"] = "s|Rule of Law"
	}
}

draeBindings:RegisterKeyBindings("Protection", bindings.base, palaBase, prot)
draeBindings:RegisterKeyBindings("Retribution", bindings.base, palaBase, retri)
draeBindings:RegisterKeyBindings("Holy", bindings.base, palaBase, holy)
