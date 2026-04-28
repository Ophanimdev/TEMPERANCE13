// Honestly I'm not even gonna give this an icon other than onmobs
/obj/item/rogueweapon/zealot_chainsaw
	name = "rabbite's saw"
	desc = "a twisted amalgamation of metal fused with flesh. "
	force = 25


/obj/item/rogueweapon/zealot_chainsaw/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOEMBED, TRAIT_GENERIC)

/datum/intent/zealot_cut // I want it so that you can hold this down and just keep cutting 
	name = "cut"
	attack_verb = list("slices through", "saws through", "obliterates")
	chargetime = 0
	chargedrain = 0
	chargedloop = /datum/looping_sound/chainsaw_idle
	hitsound = list('sound/combat/hits/bladed/sawhit1.ogg', 'sound/combat/hits/bladed/sawhit2.ogg', 'sound/combat/hits/bladed/sawhit3.ogg')
	var/mousedown_delay = 1 // Holding the mouse down doesn't spam people

/datum/intent/on_mouse_down()
