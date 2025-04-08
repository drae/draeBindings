if (select(2, UnitClass"player") ~= "PRIEST") then return end

local _, bindings = ...

local priestBase = {
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

local discipline = {
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

local holy = {
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

local shadow = {
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

draeBindings:RegisterKeyBindings("Discipline", bindings.base, priestBase, discipline)
draeBindings:RegisterKeyBindings("Holy", bindings.base, priestBase, holy)
draeBindings:RegisterKeyBindings("Shadow", bindings.base, priestBase, shadow)
