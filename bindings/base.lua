local _, bindings = ...

bindings.base = {
	W = "MOVEFORWARD",
	A = "STRAFELEFT",
	S = "MOVEBACKWARD",
	D = "STRAFERIGHT",

	B = "OPENALLBAGS",

	F8 = "m|/run ReloadUI()",

	shift = {
		["\\"]	= "m|/clearfocus [@mouseover,noexists][noexists]\n/focus [@mouseover,exists][exists]",
		M		= "m|/run if (not IsMounted()) then C_MountJournal.SummonByID(0) else Dismount() end",
	},

	alt = {
		["\\"]  = "s|Mass Resurrection",
		Z 		= "m|/hideui",
	},

	ctrl = {
		["\\"] = "m|/assist [@mouseover,help]",
	},
}
