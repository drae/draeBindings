if (select(2, UnitClass"player") ~= "SHAMAN") then return end

local _, bindings = ...

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

		TOP FIRST BUTTON [6] -> SELF DEFENCE COOLDOWNS
		Divine Protection / Shield of Vengeance
		Divine Shield
		Lay on Hands

		TOP SECOND BUTTON [7] -> DEFENSIVE COOLDOWNS
		Rule of Law [talent]
		Aura Mastery
]]


local shamanBase = {
	-- Mouse based
    BUTTON3 = 'm|/stopcasting\n/cast Wind Shear',
	BUTTON5 = 'm|/startattack\n/cast Lightning Bolt', -- Main rotation
	[6]		= 's|Astral Shift',
	[8]		= 's|Primordial Wave', -- Covenant primary
	[9]		= '',
	['#']	= '',

	-- Keyboard based
	['`'] 	= 'm|/castsequence reset=15 Fire Elemental, Meteor', -- Lvl 90 talent
	C 		= 'm|/stopcasting\n/cast [@TARGET,help] Cleanse Spirit;[@TARGET,harm] Purge;[@PLAYER]  Cleanse Spirit', -- Dispell
	E 		= '', -- Taunt
	F 		= 'm|/stopcasting\n/cast Stoneform', -- Racial
	R 		= 'm|/use [@CURSOR][] 13',
	V		= 'm|/cast [@MOUSEOVER][] Lightning Shield',
	['\\'] 	= 'm|/use [@MOUSEOVER,help,dead,combat][@TARGET,help,dead,combat] Disposable Spectrophasic Reanimator; [@MOUSEOVER,dead][@TARGET,dead][] Ancestral Spirit', -- Redemption

	shift = {
		-- Mouse based
		BUTTON3 = 'm|/cast [@CURSOR][] Capacitor Totem',
		BUTTON5 = 'm|/startattack\n/cast Chain Lightning', -- Main rotation
		[6] 	= 's|Healing Stream Totem',
		[8]		= 'm|/cast Fleshcraft', -- Covenant secondary
		[9]		= '',

		-- Keyboard based
		[1] 	= '',
		[2] 	= '',
		[3] 	= '',
		[4] 	= '',
		C		= 'm|/cast [@CURSOR][] Tremor Totem',
		F 		= 'm|/use Healthstone',
		R 		= 'm|/use [@CURSOR][] 14',
		V		= 'm|/cast [@MOUSEOVER][] Earth Shield',

	},

	alt = {
		-- Mouse based
		BUTTON3 = 'm|/cast [@FOCUS,exists,harm][] Hex',
		[6]		= 's|Earth Elemental',
		[8]		= '', -- Covenant tertiary
		[9] 	= 's|Ghost Wolf',

		-- Keyboard based
		[1] 	= '',
		[2] 	= '',
		[3] 	= '',
		[4] 	= '',
		C		= 'm|/cast [@CURSOR][] Earthbind Totem'
	},

	ctrl = {
		-- Mouse based
		BUTTON3	= 's|Thunderstorm',
		BUTTON5 = 's|Frost Shock', -- Main rotation
		[6] 	= '', -- Damage Reduction 4

		-- Keyboard based
		['`'] 	= 's|Heroism', -- Major offensive cooldown
	}
}

local elemental = {
	[7]		= 's|Spiritwalker\'s Grace',
	['#']	= 's|Earth Shock',

	shift = {
		['#']	= 'm|/cast [@CURSOR][] Earthquake',
		['`']	= 'm|/use 14\n/cast [talent:7/2] Stormkeeper; [talent:7/3] Ascendance',
	},

	alt = {
		BUTTON5 = 's|Flame Shock', -- Main rotation
	},

	ctrl = {
		BUTTON5 = 's|Frost Shock', -- Main rotation
	}
}

--[[
]]
local restoration = {
    alt = {
		-- Keyboard
		['\\'] 	= 's|Ancestral Vision'
    },

	alt = {
	},

	ctrl = {
	}
}

local enhancement = {
}

draeBindings:RegisterKeyBindings("Elemental", bindings.base, shamanBase, elemental)
draeBindings:RegisterKeyBindings("Enhancement", bindings.base, shamanBase, enhancement)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, shamanBase, restoration)
