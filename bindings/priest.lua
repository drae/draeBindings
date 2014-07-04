if (select(2, UnitClass"player") ~= "PRIEST") then return end

local _, bindings = ...

local priestBase = {
}

local discipline = {
}

local holy = {
}

local shadow = {
}

draeBindings:RegisterKeyBindings("Discipline", bindings.base, priestBase, discipline)
draeBindings:RegisterKeyBindings("Holy", bindings.base, priestBase, holy)
draeBindings:RegisterKeyBindings("Shadow", bindings.base, priestBase, shadow)
