if (select(2, UnitClass"player") ~= "WARLOCK") then return end

local _, bindings = ...

local warlockBase = {
}

local affliction = {
}

local demonology = {
}

local destruction = {
}

draeBindings:RegisterKeyBindings("Affliction", bindings.base, warlockBase, affliction)
draeBindings:RegisterKeyBindings("Demonology", bindings.base, warlockBase, demonology)
draeBindings:RegisterKeyBindings("Destruction", bindings.base, warlockBase, destruction)
