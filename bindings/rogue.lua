if (select(2, UnitClass"player") ~= "ROGUE") then return end

local _, bindings = ...

local rogueBase = {
}

local assassination = {
}

local combat = {
}

local subtlety = {
}

draeBindings:RegisterKeyBindings("Assassination", bindings.base, rogueBase, assassination)
draeBindings:RegisterKeyBindings("Combat", bindings.base, rogueBase, combat)
draeBindings:RegisterKeyBindings("Subtlety", bindings.base, rogueBase, subtlety)
