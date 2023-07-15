if (select(2, UnitClass"player") ~= "SHAMAN") then return end

local _, bindings = ...

--[[
		-- In order -> nomod, shift, alt, ctrl

		BUTTON5 -> CORE [HEALING]
		Riptide
		Healing Wave
		Healing Surge

		BUTTON5 -> CORE [DPS]
		Lightning Bolt
		Flame Shock ?
		Lava Surge ?

		SIDE BUTTON [#] -> AoE
		Chain Heal
		Healing Rain (resto)

		BUTTON4 -> ROTATIONAL TALENTS
		- Row 1
		  Light's Hammer / Bestow Faith
		- Row 2
		  Holy Prism
-- ]]


local shamanBase = {
	-- Mouse based
    BUTTON3 = 'm|/stopcasting\n/cast Wind Shear',
	BUTTON5 = 's|Lightning Bolt', -- Main rotation
	[6]		= 's|Astral Shift',
	[8]		= 's|Primordial Wave', -- Covenant primary
	[9]		= 'm|/cast [known:Storm Elemental] Storm Elemental;Fire Elemental',
	['#']	= '',

	-- Keyboard based
	C 		= 'm|/stopcasting\n/cast [@TARGET,help] Cleanse Spirit;[@TARGET,harm] Purge;[@SELF][] Cleanse Spirit', -- Dispell
	E 		= '', -- Taunt
	F 		= 'm|/stopcasting\n/cast Stoneform', -- Racial
	R 		= 'm|/use 13',
	V		= 'm|/cast [@MOUSEOVER][] Lightning Shield',
	['\\'] 	= 'm|/use [@MOUSEOVER,help,dead,combat][@TARGET,help,dead,combat] Disposable Spectrophasic Reanimator; [@MOUSEOVER,dead][@TARGET,dead][] Ancestral Spirit', -- Redemption

	shift = {
		-- Mouse based
		BUTTON3 = 'm|/cast [@CURSOR][] Capacitor Totem',
		BUTTON5 = 'm|/startattack\n/cast Chain Lightning', -- Main rotation
		[6] 	= '',
		[9]		= 's|Earth Elemental',

		-- Keyboard based
		[1] 	= 'm|/cast [@CURSOR][] Earthbind Totem',
		[2] 	= 'm|/cast [@CURSOR][] Capacitor Totem',
		[3] 	= 's|Healing Stream Totem',
		[4] 	= 's|Tremor Totem',
		[5]		= 'm|/cast [@CURSOR][] Liquid Magma Totem',
		C		= '',
		F 		= 'm|/use Healthstone',
		R 		= 'm|/use  14',
		V		= 'm|/cast [@MOUSEOVER][@SELF][] Earth Shield',
	},

	alt = {
		-- Mouse based
		BUTTON3 = 'm|/cast [@FOCUS,exists,harm][] Hex',
		[6]		= 's|Ancestral Guidance',
		[8]		= '', -- Covenant tertiary
		[9] 	= 's|Ghost Wolf',

		-- Keyboard based
		['`'] 	= 's|Heroism', -- Major offensive cooldown
		C		= ''
	},

	ctrl = {
		-- Mouse based
		BUTTON3	= 's|Thunderstorm',
		BUTTON5 = 's|Frost Shock', -- Main rotation
		[6] 	= 'm|/use 6', -- Damage Reduction 4

		-- Keyboard based
		[1] 	= 'm|/cast Skyfury totem\n/cast Counterstrike Totem',
		[3] 	= '',
		[4] 	= '',
		[5]		= '',
	}
}

local elemental = {
	['#']	= 's|Earth Shock',
	['`']	= 'm|/use 14\n/cast Stormkeeper',

	shift = {
		-- Mouse based
		['#']	= 'm|/cast [@CURSOR][] Earthquake',
		[6]		= 's|Spiritwalker\'s Grace',

		-- Keyboard based
		['`'] 	= 'm|/castsequence reset=60 Fire Elemental, Meteor', -- Lvl 90 talent
	},

	alt = {
		BUTTON5 = 's|Flame Shock', -- Main rotation

		-- Keyboard based
	},

	ctrl = {
		BUTTON5 = 's|Frost Shock', -- Main rotation
	}
}

local restoration = {
	['`']	= 'm|/use 14\n/cast [talent:7/2] Wellspring; [talent:7/3] Ascendance',

	shift = {
		-- Mouse based
		[6]		= 's|Spiritwalker\'s Grace',
		[7]		= 's|Healing Tide Totem',
		["#"]	= 'm|/cast [@CURSOR][] Healing Rain',
	},

	alt = {
		-- Mouse based
		[7]		= 'm|/cast [@CURSOR][] Spirit Link Totem',

		-- Keyboard based
		[1] 	= 'm|/cast [@CURSOR][] Earthgrab Totem',
		[2] 	= 's|Mana Tide Totem',
		[3] 	= 'm|/cast [talent:4/2,@CURSOR][] Earthen Wall Totem; [talent:4/3,@CURSOR][] Ancestral Protection Totem',
		[5]		= '',
		['\\'] 	= 's|Ancestral Vision'

	},

	ctrl = {
	}
}

local enhancement = {
	alt = {
		-- Keyboard based
		[1] 	= 's|Windfury Totem',
	}
}

draeBindings:RegisterKeyBindings("Elemental", bindings.base, shamanBase, elemental)
draeBindings:RegisterKeyBindings("Enhancement", bindings.base, shamanBase, enhancement)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, shamanBase, restoration)
