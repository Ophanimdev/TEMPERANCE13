/obj/item/gun/ballistic/pistol
	name = "\improper dogshit pistol"
	desc = "" //usually used by syndicates
	icon_state = "pistol"
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
	dry_fire_sound = 'sound/blank.ogg'
	slot_flags = ITEM_SLOT_HIP
	icon = 'icons/roguetown/weapons/32guns.dmi'
	possible_item_intents = list(
		/datum/intent/shoot/pistol,
		/datum/intent/arc/pistol,
		INTENT_GENERIC,
		)
/datum/intent/shoot/pistol
	chargedrain = 0
	no_early_release = TRUE

/datum/intent/shoot/pistol/get_chargetime()
	if(!mastermob || !chargetime)
		var/newtime = 0
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/pistols) * (4)))
		if(strength_check == TRUE)
			newtime = ((newtime + 10) - (mastermob.STASTR / 2))
		else
			newtime = newtime 
		newtime = ((newtime + 20) - (mastermob.STAPER))

/datum/intent/arc/pistol
	chargetime = 1
	chargedrain = 0
	no_early_release = TRUE

/datum/intent/arc/pistol/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/arc/pistol/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		newtime = ((newtime + 10) - (mastermob.get_skill_level(/datum/skill/combat/pistols) * (4)))
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

/////////////  ACTUAL OBJECTS


/obj/item/gun/ballistic/rifle/repeater/pistol 
	name = "SiR 'Harland'"
	desc = "A clip-loaded pistol. Mass produced, and issued to Risvon Soldats. Requires manual cocking."
	icon_state = "pocketpistol"
	item_state = "pocketpistol"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/boltaction/pistol
	slowdown = 0.15
	spread = 0.5
	pump_sound = 'sound/combat/ranged/hpistol_cock.ogg'
	fire_sound = PISTOLSHOT
	load_sound = 'sound/combat/ranged/clipload.ogg'
	recoil = 0.15
