/obj/item/gun/ballistic/rifle

	name = "rifle template"
	desc = "Should not exist"
	icon = 'icons/roguetown/weapons/32guns.dmi'
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	slowdown = 0.5
	spread = 0
	force = 15 //Decent clubs generally speaking
	flags_1 =  CONDUCT_1
	casing_ejector = FALSE
	var/recentpump = 0 // to prevent spammage
	spawnwithmagazine = TRUE
	var/pump_sound = 'sound/blank.ogg'
	fire_sound = RIFLESHOT
	var/pump_stam_cost = 2
	experimental_onhip = FALSE
	experimental_onback = FALSE
	possible_item_intents = list(
		/datum/intent/shoot/,
		/datum/intent/arc/,
		INTENT_GENERIC,
		)
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/
	var/needs_pump = FALSE
	can_parry = TRUE
	verbage = "load"
	cartridge_wording = "bullet"
	load_sound = 'sound/foley/nockarrow.ogg'
	obj_flags = UNIQUE_RENAME
	experimental_inhand = FALSE
	internal_magazine = TRUE 
	semi_auto = FALSE
	dry_fire_sound = 'sound/combat/ranged/gun_empty.ogg'

/obj/item/gun/ballistic/rifle/process_chamber(mob/living/user, empty_chamber = 0)
	return ..() //changed argument value

/obj/item/gun/ballistic/rifle/can_shoot()
	if(needs_pump)
		return FALSE
	return !!chambered?.BB

/obj/item/gun/ballistic/process_chamber(empty_chamber = TRUE, from_firing = TRUE, chamber_next_round = TRUE)
	if(!semi_auto && from_firing)
		return

/obj/item/gun/ballistic/rifle/attack_self(mob/living/user)
	if(recentpump > world.time)
		return
	pump(user, TRUE)
	if(HAS_TRAIT(user, TRAIT_FIREARMS_EXPERT)) //unused as of rn
		recentpump = world.time + 2
	else
		recentpump = world.time + 10

/obj/item/gun/ballistic/rifle/proc/pump(mob/M, visible = TRUE)
	if(visible)
		M.visible_message("<span class='warning'>[M] racks [src].</span>", "<span class='warning'>You rack [src].</span>")
	playsound(M, pump_sound, 60, 1)
	pump_unload(M)
	pump_reload(M)
	update_icon()	//I.E. fix the desc
	return 1

/obj/item/gun/ballistic/rifle/proc/pump_unload(mob/M)
	if(chambered)//We have a shell in the chamber
		chambered.forceMove(drop_location())//Eject casing
		chambered.bounce_away()
		chambered = null

/obj/item/gun/ballistic/rifle/proc/pump_reload(mob/M)
	if(!magazine.ammo_count())
		return 0
	var/obj/item/ammo_casing/AC = magazine.get_round() //load next casing.
	needs_pump = FALSE
	chambered = AC

/obj/item/gun/ballistic/rifle/examine(mob/user)
	. = ..()
	if (chambered)
		. += "A [chambered.BB ? "live" : "spent"] one is in the chamber."

/datum/intent/shoot/rifle
	chargedrain = 0
	no_early_release = TRUE

/datum/intent/shoot/rifle/get_chargetime() 
	if(mastermob && chargetime)
		var/newtime = 0
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/rifles) * (2.3)))
		if(strength_check == TRUE)
			newtime = ((newtime + 10) - (mastermob.STASTR / 2))
		else
			newtime = newtime 
		newtime = ((newtime + 20) - (mastermob.STAPER))
		if(newtime > 1)
			return newtime 
		else
			return 1 
	else
		return chargetime 

/datum/intent/arc/rifle
	chargetime = 1
	chargedrain = 0
	no_early_release = TRUE

/datum/intent/arc/rifle/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/arc/rifle/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/rifles) * (2)))
		if(strength_check == TRUE)
			newtime = ((newtime + 10) - (mastermob.STASTR / 2))
		else
			newtime = newtime 
		newtime = ((newtime + 20) - (mastermob.STAPER))
		if(newtime > 3)
			return newtime
		else
			return 3
	else
		return chargetime

/obj/item/gun/ballistic/rifle/postfire_empty_checks(last_shot_succeeded)
    if(last_shot_succeeded && !semi_auto)
        needs_pump = TRUE
    ..()
///////////////////
//BOLT ACTION RIFLES//
///////////////////


/obj/item/gun/ballistic/rifle/repeater
	name = "repeater template"
	desc = "should not exist"
	slowdown = 0.2
	pump_sound = 'sound/combat/ranged/riflecock.ogg'
	bolt_type = BOLT_TYPE_LOCKING
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/back_l.dmi'
	experimental_inhand = FALSE
	empty_indicator = TRUE

/obj/item/gun/ballistic/rifle/repeater/perserdun
	name = "SKT 'Order'"
	desc = "A piece of shit reproduction rifle, trying to replicate those spat out by the WAR MACHINE. Used by Perserdunian forces."
	icon_state = "karabiner"
	item_state = "karabiner"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/perserdun
	slowdown = 0.15
	spread = 0.5
	pump_sound = 'sound/combat/ranged/riflecock.ogg'
	fire_sound = RIFLESHOT
	load_sound = 'sound/combat/ranged/rifleload.ogg'
	recoil = 0.15

/obj/item/gun/ballistic/rifle/repeater/leveraction
	name = "WTK 'Legionaire'"
	desc = "A genuine lever action, produced by a WAR MACHINE's outlet. Fires pistol rounds."
	icon_state = "leverchester"
	item_state = "leverchester"
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/leverchester
	slowdown = 0.15
	spread = 0.5
	pump_sound = 'sound/combat/ranged/leveractioncock.ogg'
	fire_sound = PISTOLSHOT
	load_sound = 'sound/combat/ranged/leveractioninsert.ogg'
	recoil = 0.15

