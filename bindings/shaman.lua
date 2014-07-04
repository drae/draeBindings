if (select(2, UnitClass"player") ~= "SHAMAN") then return end

local _, bindings = ...

local shamanBase = {
}

local elemental = {
}

local enhancement = {
}

local restoration = {
}

draeBindings:RegisterKeyBindings("Elemental", bindings.base, shamanBase, elemental)
draeBindings:RegisterKeyBindings("Enhancement", bindings.base, shamanBase, enhancement)
draeBindings:RegisterKeyBindings("Restoration", bindings.base, shamanBase, restoration)
