if (select(2, UnitClass 'player') ~= 'PALADIN') then return end

local _, bindings =	...

--[[
		(Row 1 = unmod, Row 2 = shift, Row 3 = alt, Row 4 = ctrl)

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
		V				Beacon of Light
						Beacon of Faith

		General setup
		-------------

		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Interrupts/Stuns/CC

		E                       Taunts
		F                       Potion
								Health Potion/Healthstone
								-
								Mana Pot
		R                       Trinkets
		G                       Cooldown
		`                       Avenging Wrath and anything that should be tied to its use
		\                       Redemption/Mass Ressurection
--]]

local palaBase = {
	-- Mouse based
	BUTTON3 = 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Rebuke',
	BUTTON5 = 'm|/cast [harm] Crusader Strike',
	[8]		= 'm|/cast [known:Divine Toll] Divine Toll',
--	['#']	= 'm|/cast [@PLAYER] Word of Glory',

	-- Keyboard based
	['`'] 	= 'm|/use 13\n/cast Avenging Wrath',
	E 		= 'm|/stopcasting\n/cast [@TARGET,exists,harm][] Turn Evil',
	R 		= 'm|/use 13',
	['\\'] 	= 'm|/cast [@MOUSEOVER,dead,help][] Redemption',

	shift = {
		-- Mouse based
		BUTTON3 = 's|Hammer of Justice',
		BUTTON5 = 's|Judgment',
		[6] 	= 'm|/stopcasting\n/cast Divine Shield',
		[8]		= '',
		[9]		= '',

		-- Keyboard based
--		[1] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Protection',
--		[2] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Freedom',
--		[3] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Sacrifice',
--		[4] 	= 'm|/cast [@MOUSEOVER,help][] Blessing of Sanctuary',
--		[5] 	= 'm|/cast [@MOUSEOVER,help][] Hand of Hindrance',

		C		= "s|Arcane Torrent",
		E 		= 'm|/stopcasting\n/cast [@FOCUS,exists,harm][] Hand of Reckoning',
		F 		= 'm|/use Healthstone\n/use Refreshing Healing Potion',
		R 		= 'm|/use 14'
	},

	alt = {
		-- Mouse based
		BUTTON3 = 'm|/cast [known:Repentance] Repentance\n/cast [known:Blinding Light] Blinding Light',
		BUTTON5 = 's|Consecration',
		[9] 	= 's|Divine Steed'
	},

	ctrl = {
		-- Mouse based
		BUTTON5 = 's|Hammer of Wrath',
--		[6] 	= 'm|/stopmacro\n/cast [@MOUSEOVER,help][@TARGET,help][@PLAYER] Lay on Hands',

		-- Keyboard based
--		['\\'] = 'm|/cast [@MOUSEOVER,help,dead][] Intercesson'
	}
}

local prot = {
	BUTTON4 = "s|Avenger's Shield", -- Main rotation
	[6] 	= 's|Guardian of Ancient Kings',

	shift = {
		-- Mouse based
	},

	alt = {
		-- Mouse based
		['#']	= "m|/cast [@TARGET,harm] Shield of the Righteous",
	},

	ctrl = {
		[6] 	= 's|Ardent Defender', -- Damage Reduction 3
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
	[6] 	= 's|Divine Protection',

	-- Keyboard based
	F 		= 'm|/use Elemental Potion of Ultimate Power',


	shift = {
		-- Mouse based
		BUTTON4 = 's|Wake of Ashes',
		['#'] 	= "s|Templar's Verdict", -- HoPo spender (3*)

		-- Keyboard based
	},

	alt = {
		-- Mouse based
		['#'] 	= 's|Divine Storm', -- HoPo spender (3*)
		[6] 	= 's|Shield of Vengeance',

		-- Keyboard
	},

	ctrl = {
		['#'] = 'm|/cast [@CURSOR,known:Final Reckoning][known:Final Reckoning] Final Reckoning\n/cast [known:Execution Sentence] Execution Sentence',
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
	BUTTON4 = "m|/cast [known:Light's Hammer,@CURSOR] Light's Hammer; [known:Holy Prism,@TARGET,harm] Holy Prism",
	[6] 	= 's|Divine Protection',
	[7]     = "m|/cast [known:Hand of Divinity] Hand of Divinity; [known:Divine Favor] Divine Favor",

	-- Keyboard based
	F 		= 'm|/use Elemental Potion of Ultimate Power',
	C		= 's|Cleanse',

	shift = {
		-- Mouse based
		['#'] 	= 's|Light of Dawn',
		[7] 	= 's|Tyr\'s Deliverance',

		-- Keyboard based
	},

	alt = {
		-- Mouse based
		['#']	= "m|/cast [@TARGET,harm] Shield of the Righteous",
		[7] 	= 's|Daybreak',

		-- Keyboard
		['\\'] 	= 's|Absolution'
	},

	ctrl = {
		-- Mouse based
		[7] 	= 's|Aura Mastery',
		-- Keyboard based
		F 		= 'm|/use Aerated Mana Potion',
	}
}

draeBindings:RegisterKeyBindings('Protection', bindings.base, palaBase, prot)
draeBindings:RegisterKeyBindings('Retribution', bindings.base, palaBase, ret)
draeBindings:RegisterKeyBindings('Holy', bindings.base, palaBase, holy)
