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
	-- Mouse based

	-- Keyboard based

	shift = {
		-- Mouse based

		-- Keyboard based
	},

	alt = {
		-- Mouse based

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based

		-- Keyboard based
	}
}

local balance = {
	-- Mouse based

	-- Keyboard based

	shift = {
		-- Mouse based

		-- Keyboard based
	},

	alt = {
		-- Mouse based

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based

		-- Keyboard based
	}
}

local feral = {
	-- Mouse based

	-- Keyboard based

	shift = {
		-- Mouse based

		-- Keyboard based
	},

	alt = {
		-- Mouse based

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based

		-- Keyboard based
	}
}

local guardian = {
	-- Mouse based

	-- Keyboard based

	shift = {
		-- Mouse based

		-- Keyboard based
	},

	alt = {
		-- Mouse based

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based

		-- Keyboard based
	}
}

local restoration = {
	-- Mouse based

	-- Keyboard based

	shift = {
		-- Mouse based

		-- Keyboard based
	},

	alt = {
		-- Mouse based

		-- Keyboard based
	},

	ctrl = {
		-- Mouse based

		-- Keyboard based
	}
}

draeBindings:RegisterKeyBindings("Balance", bindings.base, druidBase, balance)
draeBindings:RegisterKeyBindings("Feral", bindings.base, druidBase, feral)
draeBindings:RegisterKeyBindings("Guardian", bindings.base, druidBase, guardian)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, druidBase, restoration)
