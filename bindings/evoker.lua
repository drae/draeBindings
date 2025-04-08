if (select(2, UnitClass"player") ~= "EVOKER") then return end

local _, bindings = ...

local evokerBase = {
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

local devastation = {
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

local preservation = {
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

local augmentation = {
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

draeBindings:RegisterKeyBindings("Devastation", bindings.base, evokerBase, devastation)
draeBindings:RegisterKeyBindings("Preservation", bindings.base, evokerBase, preservation)
draeBindings:RegisterKeyBindings("Augmentation", bindings.base, evokerBase, augmentation)
