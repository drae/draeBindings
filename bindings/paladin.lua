if (select(2, UnitClass 'player') ~= 'PALADIN') then return end

local _, bindings =	...

--[[
		Clique setup
		------------

		Mouseover healing (BUTTON4 at rear)

		BUTTON4			
		shift-BUTTON4	
		alt-BUTTON4
		ctrl-BUTTON4

		BUTTON5			
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
	BUTTON5 = 'm|/cast [harm] Crusader Strike', -- Main rotation (\n/stopmacro [harm]\n/targetenemy\n/cast Crusader Strike\n/targetlasttarget)
	[8]		= 's|Divine Toll',
	['#']	= 'm|/cast [@PLAYER][] Word of Glory',

	-- Keyboard based
	['`'] 	= 's|Avenging Wrath', -- Avenging Wrath
	C 		= 'm|/cqs\n/stopcasting\n/cast [@MOUSEOVER,help][@PLAYER][] Cleanse\n/cast [@MOUSEOVER,help][@PLAYER][] Cleanse Toxins', -- Dispell
	E 		= 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Hand of Reckoning',
	F 		= 'm|/cqs\n/stopcasting\n/cast Will to Survive', -- Racial
	R 		= 'm|/use 13',
	['\\'] 	= 'm|/cast [@MOUSEOVER,dead,help][] Redemption', -- Redemption

	shift = {
		-- Mouse based
		BUTTON3 = 's|Hammer of Justice',
		BUTTON5 = 's|Judgment', -- Main rotation
		[6] 	= 'm|/cqs\n/stopcasting\n/cast Divine Shield',
		[8]		= 'm|/cqs\n/use Phial of Serenity',
		[9]		= 's|Summon Steward',

		-- Keyboard based
		['`'] 	= 'm|/cast [talent:5/2] Holy Avenger', -- Lvl 90 talent
		[1] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Protection',
		[2] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Freedom',
		[3] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Sacrifice',
		F 		= 'm|/use Healthstone',
		R 		= 'm|/use 14'
	},

	alt = {
		-- Mouse based
		BUTTON3 = 'm|/cast [talent:3/2] Repentance; [talent:3/3] Blinding Light',
		BUTTON5 = 's|Consecration', -- Main rotation
		[9] 	= 's|Divine Steed'
	},

	ctrl = {
		BUTTON5 = 's|Hammer of Wrath', -- Main rotation

		-- Mouse based
		[6] 	= 'm|/stopcasting\n/cast [@MOUSEOVER,help][@TARGET,help][@PLAYER] Lay on Hands', -- Damage Reduction 4
	}
}

local prot = {
	BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke',

	shift = {
		-- Mouse based
		BUTTON5 = "s|Avenger's Shield", -- Main rotation
		[6] 	= 's|Guardian of Ancient Kings'
	},

	alt = {
		-- Mouse based
		[6] 	= 's|Ardent Defender', -- Damage Reduction 3
	},

	ctrl = {
	}
}

--[[
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
		- Row 1
		  Blade of justice
		  ??
		- Row 2
		  Wake of Ashes

		KEYBOARD [`]-> PERSONAL COOLDOWNS
		Avenging Wrath
		Holy Avenger [talent]

		TOP FIRST BUTTON [6] -> DEFENSIVE COOLDOWNS
		Shield of Vengeance
		Divine Shield
		Lay on Hands
]]
local retri = {
	-- Mouse based
	BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke',
	BUTTON4 = 's|Blade of Justice',
	[6] 	= 's|Shield of Vengeance',

	-- Keyboard based

	shift = {
		-- Mouse based
		BUTTON4 = 's|Wake of Ashes',
		['#'] 	= "s|Templar's Verdict", -- HoPo spender (3*)
	},

	alt = {
		-- Mouse based
		BUTTON4 = 's|',
		['#'] 	= 's|Divine Storm', -- HoPo spender (3*)
	}
}

--[[
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

		BUTTON4 -> ROTATIONAL TALENTS (Row 1 = unmod, Row 2 = shift, Row 3 = alt, Row 4 = ctrl)
		- Row 1
		  Light's Hammer
		  Bestow Faith
		- Row 2
		  Holy Prism

		KEYBOARD [`]-> OFFENSIVE COOLDOWNS
		Avenging Wrath
		Holy Avenger [talent]

		TOP FIRST BUTTON [6] -> SELF DEFENCE qqqCOOLDOWNS
		Divine Protection / Shield of Vengeance
		Divine Shield
		Lay on Hands

		TOP SECOND BUTTON [7] -> DEFENSIVE COOLDOWNS
		Rule of Law [talent]
		Aura Mastery
]]
local holy = {
	-- Mouse based
	[6] 	= 's|Divine Protection',
	[7]		= 's|Rule of Law',
	[8]		= 'm|/cast Rule of Law\n/cast [@mouseover, help, nodead][] Divine Toll', --/use 14

	shift = {
		-- Mouse based
		['#'] 	= 's|Light of Dawn',
		[7] 	= 's|Aura Mastery',

		-- Keyboard based
	},

	alt = {
		-- Mouse based
		['#']	= "m|/cast [@TARGET,harm] Shield of the Righteous",
		[7] = "s|Divine Favor",

		-- Keyboard
		['\\'] 	= 's|Absolution'
	},
}

draeBindings:RegisterKeyBindings('Protection', bindings.base, palaBase, prot)
draeBindings:RegisterKeyBindings('Retribution', bindings.base, palaBase, retri)
draeBindings:RegisterKeyBindings('Holy', bindings.base, palaBase, holy)
