if (select(2, UnitClass"player") ~= "DEMONHUNTER") then return end

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

local demonhunterBase = {
	-- Mouse based
	BUTTON4 = "s|Judgment",                                                                                     -- Main rotation
	BUTTON5 = "s|Crusader Strike",																				-- Main rotation
    [7]     = "s|Divine Shield",
    
	-- Keyboard based
	["`"]   = "s|Avenging Wrath",  -- Avenging Wrath
	C		= "m|/cast [@MOUSEOVER,help][] Cleanse",                   -- Dispell
	E		= "m|/stopcasting\n/cast Hand of Reckoning",                       -- Taunt
	F		= "m|/stopcasting\n/cast Every Man for Himself",           -- Out of jail free card
	R		= "m|/use 13",                                             -- Trinket Slot 1
	["\\"]	= "m|/cast [@MOUSEOVER,dead][@TARGET,dead][] Redemption",  -- Redemption

	shift = {
		-- Mouse based
		BUTTON3	= "s|Hammer of Justice",
	
		-- Keyboard based
		[1]		= "m|/cast [@MOUSEOVER,help][] Blessing of Protection",
		[2]		= "m|/cast [@MOUSEOVER,help][] Blessing of Freedom",
		[3]		= "m|/cast [@MOUSEOVER,help][] Blessing of Salvation",
		[4]		= "m|/cast [@MOUSEOVER,help][] Blessing of Sacrifice",
		[5]		= "m|/cast [@MOUSEOVER,help][] Blessing of Spellwarding",
		E		= "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Hand of Reckoning",  -- Focus taunt
		F		= "m|/use Healthstone",
		R		= "m|/use 14",  -- Trinket Slot 2
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

local vengeance = {
   	BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke", 
	[";"]   = "s|Shield of the Righteous",  
    [6]     = "s|Bastion of Light",

	shift = {
		-- Mouse based
		BUTTON4 = "s|Consecration",       -- Main rotation
		BUTTON5 = "s|Avenger's Shield",         -- Main rotation
        [";"]   = "s|Light of the Protector", 
    	[6]     = "s|Guardian of Ancient Kings",
	},

	alt = {
		-- Mouse based
		[6]     = "s|Ardent Defender",  -- Damage Reduction 3
	},
}

local havoc = {
	-- Mouse based
	BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke", 
	[6]     = "s|Divine Protection",
	[9]		= "m|/cast [talent:1/2][@PLAYER] Execution Sentence",  -- Lvl 90 talent
    
	-- Keyboard based

	shift = {
		-- Mouse based
		BUTTON4	= "s|Consecration",
		[8]     = "s|Templar's Verdict",         
	},

	alt = {
		-- Mouse based
		BUTTON4	= "s|Divine Storm",  -- Main rotation
	},
}

draeBindings:RegisterKeyBindings("Vengeance", bindings.base, demonhunterBase, vengeance)
draeBindings:RegisterKeyBindings("Havoc", bindings.base, demonhunterBase, havoc)
