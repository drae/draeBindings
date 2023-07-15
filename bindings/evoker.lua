if (select(2, UnitClass"player") ~= "EVOKER") then return end

local _, bindings = ...

local evokerBase = {
}

local devastation = {
}


local preservation = {
}

draeBindings:RegisterKeyBindings("Devastation", bindings.base, evokerBase, devastation)
draeBindings:RegisterKeyBindings("Preservation", bindings.base, evokerBase, preservation)
--draeBindings:RegisterKeyBindings("Subtlety", bindings.base, rogueBase, subtlety)
