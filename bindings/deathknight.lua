if (select(2, UnitClass"player") ~= "DEATHKNIGHT") then return end

local _, bindings = ...

local deathknightBase = {
}

local blood = {
}

local frost = {
}

local unholy = {
}

draeBindings:RegisterKeyBindings("Blood", 	bindings.base, deathknightBase, blood)
draeBindings:RegisterKeyBindings("Frost", bindings.base, deathknightBase, frost)
draeBindings:RegisterKeyBindings("Unholy", bindings.base, deathknightBase, unholy)
