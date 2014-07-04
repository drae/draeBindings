if (select(2, UnitClass"player") ~= "DRUID") then return end

local _, bindings = ...

--[[
		Clique setup:

		'		= Rejuv
		#		= Wildgrowth
		BUTTON5 = Lifebloom

		Shift-' = Swiftmend
		Shift-# =



--]]

local druidBase = {
	-- Mouse

	-- Keyboard
	["\\"]	= "m|/cast [@MOUSEOVER,help][] Revive",

	alt = {
		-- Mouse
		[6]		= "s|Innervate",

		-- Keyboard
	},

	ctrl = {
		["\\"]	= "m|/cast Nature's Swiftness\n/cast [@MOUSEOVER,help][] Rebirth",
	}
}

local balance = {
	-- Mouse
	["'"] 	= "s|Wrath",
}

local feral = {
}

local guardian = {
}

local restoration = {
	-- Mouse
	["'"] 	= "s|Wrath",

	-- Keyboard
	["`"] 	= "m|/use 12\n/use 13\n/cast Nature's Vigil\n/cast Incarnation",


	shift = {
		-- Mouse

		-- Keyboard
	},

	alt = {

	-- Keyboard
	},

	ctrl = {


	}
}

draeBindings:RegisterKeyBindings("Balance", bindings.base, druidBase, balance)
draeBindings:RegisterKeyBindings("Feral", bindings.base, druidBase, feral)
draeBindings:RegisterKeyBindings("Guardian", bindings.base, druidBase, guardian)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, druidBase, restoration)
