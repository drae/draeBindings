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

		-- Keyboard
	},

	ctrl = {
		["\\"]	= "m|/cast [@MOUSEOVER,help,dead][] Rebirth",
	}
}

local balance = {
	-- Mouse

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

local feral = {
	-- Mouse

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

local guardian = {
	-- Mouse

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

local restoration = {
	-- Mouse

	shift = {
		-- Mouse
		[";"]	= "m|/cast [@CURSOR] Effloresence",

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
