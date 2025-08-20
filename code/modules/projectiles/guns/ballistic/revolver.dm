/obj/item/gun/ballistic/revolver
	name = "\improper .357 revolver"
	desc = "" //usually used by syndicates
	icon_state = "revolver"
	fire_sound = 'sound/blank.ogg'
	load_sound = 'sound/blank.ogg'
	eject_sound = 'sound/blank.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/blank.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	var/spin_delay = 10
	var/recent_spin = 0
	bolt_wording = "primer"
	dry_fire_sound = 'sound/combat/ranged/revolver_dryfire.ogg'
	slot_flags = ITEM_SLOT_HIP
	icon = 'icons/roguetown/weapons/32guns.dmi'
	possible_item_intents = list(
		/datum/intent/shoot/revolver,
		/datum/intent/arc/revolver,
		INTENT_GENERIC,
		)

/obj/item/gun/ballistic/revolver/chamber_round(spin_cylinder = TRUE)
	if(spin_cylinder)
		chambered = magazine.get_round(TRUE)
	else
		chambered = magazine.stored_ammo[1]

/obj/item/gun/ballistic/revolver/shoot_with_empty_chamber(mob/living/user as mob|obj)
	to_chat(user, "<span class='danger'>*CLICK.*</span>")
	playsound(src, dry_fire_sound, 30, TRUE)
	chamber_round(TRUE)

/obj/item/gun/ballistic/revolver/get_ammo(countchambered = FALSE, countempties = TRUE)
	var/boolets = 0 
	if (chambered && countchambered)
		boolets++
	if (magazine)
		boolets += magazine.ammo_count(countempties)
	return boolets

/datum/intent/shoot/revolver
	chargedrain = 0
	no_early_release = TRUE

/datum/intent/shoot/revolver/get_chargetime()
	if(!mastermob || !chargetime)
		var/newtime = 0
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/revolvers) * (4)))
		if(strength_check == TRUE)
			newtime = ((newtime + 10) - (mastermob.STASTR / 2))
		else
			newtime = newtime 
		newtime = ((newtime + 20) - (mastermob.STAPER))

/datum/intent/arc/revolver
	chargetime = 1
	chargedrain = 0
	no_early_release = TRUE

/datum/intent/arc/revolver/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/arc/revolver/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/revolvers) * (4)))
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

///////////////////
//REVOLVERS//
///////////////////

/obj/item/gun/ballistic/revolver/grandmaster
	name = "'Grace' Service Revolver"
	desc = "A very, very expensive revolver used by the Grandmaster."
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/revolver
	force = 10
	spread = 4
	icon_state = "revolver"
	item_state = "revolver"
	slowdown = 0.15
	spread = 0.5
	empty_indicator = TRUE
	fire_sound = REVOLVERSHOT
	load_sound = REVOLVERINSERT
	recoil = 0.15
	experimental_inhand = FALSE
