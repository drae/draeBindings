if (select(2, UnitClass"player") ~= "PALADIN") then return end

local _, bindings = ...

--[[
		Clique setup
		------------

		Mouseover healing (BUTTON4 at rear)

		BUTTON4			Divine Light
		shift-BUTTON4	Flash of Light
		alt-BUTTON4
		ctrl-BUTTON4

		BUTTON5			Holy Light
		shift-BUTTON5	Holy Shock
		alt-BUTTON5		Holy Radiance
		ctrl-BUTTON5

		C				Cleanse

		General setup
		-------------

		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Interrupts/Stuns/CC

		5                       Defensive cooldowns
		6                       Misc / Sacred Shield / Divine Shield / Divine Plea

		8                       All HoPo uses
		9                       Misc / Talents

		E                       Taunts
		F                       Get out of jail free -> Every man for himself, Emancipate, Healthstone
		R                       Trinkets
		G                       Cooldown
		`                       Avenging Wrath and anything that should be tied to its use
		\                       Redemption/Mass Ressurection
--]]

local palaBase = {
	-- Mouse based
	BUTTON3 = "m|/stopcasting\n/cast [@FOCUS,harm][] Rebuke",     -- Interrupt
	BUTTON4 = "m|/cast [@FOCUS,harm][] Judgment",   -- Main rotation
	BUTTON5 = "s|Crusader Strike",         			-- Main rotation
	["#"]	= "s|Hammer of Wrath",                 	-- Main rotation
	[6]     = "s|Divine Protection",     			-- Damage Reduction 1
	[7]		= "m|/cast [@PLAYER][] Sacred Shield",
	[8]		= "m|/cast [@TARGET,help][@PLAYER][] Word of Glory", -- HoPo user
	[9]		= "m|/cast Light's Hammer\n/cast [@target,nodead][] Holy Prism\n/cast [@target,nodead][] Execution Sentence", -- Lvl 90 talent

	-- Keyboard based
	C		= "m|/cast [@MOUSEROVER,help][] Cleanse",                     -- Dispell
	E		= "s|Reckoning",                                             -- Taunt
	F		= "m|/stopcasting\n/cast Every man for himself",            -- Out of jail free card
	R		= "m|/use 13",                                                 -- Trinket Slot 1
	G		= "m|/cast Divine Favor\n/cast Holy Avenger",                                         -- Cooldown (MODIFIED FOR T16 4-SET!)
	["`"]	= "m|/use 12\n/use 13\n/use Potion of Mogu Power\n/cast Avenging Wrath",                 -- Avenging Wrath
	["\\"]	= "m|/cast [@MOUSEOVER,dead][@TARGET,dead][] Redemption",    -- Redemption

	shift = {
		-- Mouse based
		BUTTON3	= "s|Hammer of Justice",              -- Stun
		[6]		= "s|Guardian of Ancient Kings",     -- Damage Reduction 2/Damage Increase/Healing Increase
		[7]		= "m|/cast Divine Shield",             --/cancelaura Divine Shield\n

		-- Keyboard based
		[1]		= "m|/cast [@MOUSEOVER,help][] Hand of Protection",
		[2]		= "m|/cast [@MOUSEOVER,help][] Hand of Freedom",
		[3]		= "m|/cast [@MOUSEOVER,help][] Hand of Salvation",
		[4]		= "m|/cast [@MOUSEOVER,help][] Hand of Sacrifice",
		E		= "m|/stopcasting\n/cast [@FOCUS,exists,harm][] Hand of Reckoning", -- Focus taunt
		F		= "m|/use Healthstone",
		R		= "m|/use 14", -- Trinket Slot 2
	},

	alt = {
		-- Mouse based
		BUTTON3    = "m|/stopcasting\n/cast Repentance [@FOCUS,harm][]",
		[9]        = "s|Speed of Light",
	},

	ctrl = {
		-- Mouse based
		BUTTON3    = "s|Blinding Light",
		[6]        = "m|/stopcasting\n/cast [@MOUSEOVER,help][@TARGET,help][@PLAYER] Lay on Hands",  -- Damage Reduction 4
	},

}

local prot = {
	-- Mouse based

	shift = {
		-- Mouse based
		BUTTON4	= "s|Avenger's Shield",             -- Main rotation
		BUTTON5 = "s|Hammer of the Righteous",     -- Main rotation
		["#"]   = "s|Holy Wrath",     -- Main rotation
		[8]     = "s|Shield of the Righteous",     -- HoPo user
	},

	alt = {
		-- Mouse based
		BUTTON4	= "s|Consecration",             -- Main rotation
		[6]     = "s|Ardent Defender",  -- Damage Reduction 3
	},
}

local retri = {
	-- Mouse based

	-- Keyboard based
	F = "m|/stopcasting\n/cast Emancipate\n/cast Every man for himself", -- Overwrite Every man for himself

	shift = {
		-- Mouse based
		BUTTON4	= "s|Exorcism",             -- Main rotation
		BUTTON5 = "s|Hammer of the Righteous",     -- Main rotation
		["#"]  	= "s|Wrath",            -- Symbiosis spell
		[8]     = "s|Templar's Verdict",         -- HoPo user
	},

	alt = {
		-- Mouse based
		BUTTON4	= "s|Divine Storm",             -- Main rotation
		[8]     = "s|Inquisition",         -- HoPo user
	},
}

local holy = {
	shift = {
		-- Mouse based
		BUTTON5    = "m|/cast [@TARGET,harm][] Holy Shock",
		["#"]    = "s|Denounce",
		[8]        = "s|Light of Dawn", -- HoPo user
		[9]        = "m|/cast [@FOCUS,exists,help][] Beacon of Light",

		-- Keyboard based
		G        = "m|/cast Divine Favor",
	},

	alt = {
		-- Mouse based
		[7]        = "s|Divine Plea",
	},
}

draeBindings:RegisterKeyBindings("Protection",     bindings.base, palaBase, prot)
draeBindings:RegisterKeyBindings("Retribution", bindings.base, palaBase, retri)
draeBindings:RegisterKeyBindings("Holy",         bindings.base, palaBase, holy)
