if (select(2, UnitClass"player") ~= "DEMONHUNTER") then return end

local _, bindings = ...

--[[
		MOUSE3 = mousewheel click
		MOUSE4 = rear left side button
		MOUSE5 = front left side button
		# = extra button on side
		6 = first button on left mouse button edge
		7 = second button on left mouse button edge
		8 = tilt mousewheel left
		9 = tilt mouseright right

		Clique setup
		------------

		BUTTON5			"Instant" heal
		shift-BUTTON5	Fast cast heal
		alt-BUTTON5 	Slow cast heal
		ctrl-BUTTON5	Heal improver

		BUTTON4			Channeled heal
		shift-BUTTON4
		alt-BUTTON4
		ctrl-BUTTON4

		C				Cleanse

		General setup
		-------------

		-- Mouse
		#, BUTTON4, BUTTON5		Primary rotation abilities / heals
		BUTTON3                 Interrupts/Stuns/CC
		6                       Defensive cooldowns
		7                       Special cooldowns
		8                       Class specials, e.g. hopo uses, etc.
		9						Movement speed enhancers

		-- Keyboard
		E                       Taunts
		F                       Get out of jail free -> Every man for himself, Emancipate, Healthstone
		R                       Trinkets
		G
		`                       Major dmg/healing cooldown
		\                       Redemption/Mass Ressurection
--]]

local demonhunterBase = {
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

local vengeance = {
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

local havoc = {
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

draeBindings:RegisterKeyBindings("Vengeance", bindings.base, demonhunterBase, vengeance)
draeBindings:RegisterKeyBindings("Havoc", bindings.base, demonhunterBase, havoc)
