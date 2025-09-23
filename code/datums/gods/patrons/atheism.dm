/datum/patron/godless
	name = "NONE"
	domain = "You do not follow a god."
	desc = "Other faiths may exist, but they're largely shadowed by the ever-encroaching arms race."
	worshippers = "You."
	associated_faith = /datum/faith/godless
	preference_accessible = FALSE
	undead_hater = FALSE
	confess_lines = list(
		"Gods are WORTHLESS!",
		"I DON'T NEED GODS!",
		"I AM MY OWN GOD!",
		"NO GODS, NO MASTERS!",
	)

/datum/patron/godless/can_pray(mob/living/follower)
	to_chat(follower, span_danger("You cannot pray to nothing."))
	return FALSE	//heathen

