if (select(2, UnitClass"player") ~= "WARLOCK") or draeBindings.isForever then return end

local _, bindings = ...

local warlockBase = {
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

local affliction = {
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

local demonology = {
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

local destruction = {
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

draeBindings:RegisterKeyBindings("Affliction", bindings.base, warlockBase, affliction)
draeBindings:RegisterKeyBindings("Demonology", bindings.base, warlockBase, demonology)
draeBindings:RegisterKeyBindings("Destruction", bindings.base, warlockBase, destruction)
