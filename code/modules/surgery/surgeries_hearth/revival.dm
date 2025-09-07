/datum/surgery/rogue_revival
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/saw,
		/datum/surgery_step/infuse_lux,
		/datum/surgery_step/cauterize
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery_step/infuse_lux
	name = "Apply REVIVER"
	implements = list(
		/obj/item/reagent_containers/lux = 80,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	time = 10 SECONDS
	surgery_flags = SURGERY_BLOODY | SURGERY_INCISED | SURGERY_CLAMPED | SURGERY_RETRACTED | SURGERY_BROKEN
	skill_min = SKILL_LEVEL_EXPERT
	preop_sound = 'sound/surgery/organ2.ogg'
	success_sound = 'sound/surgery/organ1.ogg'
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery_step/infuse_lux/validate_target(mob/user, mob/living/carbon/target, target_zone, datum/intent/intent)
	. = ..()
	if(target.stat < DEAD)
		to_chat(user, "They're not dead!")
		return FALSE
	var/obj/item/organ/heart/H = target.getorganslot(ORGAN_SLOT_HEART)
	if(!H)
		to_chat(user, "[target] is missing their heart!")
		return FALSE
	if(target.mind && !target.mind.active)
		to_chat(user, "The REVIVER isn't working. Maybe it will root, later.")
		return FALSE
	if(HAS_TRAIT(target, TRAIT_NECRAS_VOW))
		to_chat(user, "[target] has pledged a vow to Necra. This will not work.")
		return FALSE

/datum/surgery_step/infuse_lux/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("I begin to revive [target]... Let's hope the REVIVER takes root."),
		span_notice("[user] starts to root the REVIVER onto [target]'s heart."),
		span_notice("[user] starts to root the REVIVER onto [target]'s heart."))
	return TRUE

/datum/surgery_step/infuse_lux/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	var/revive_pq = PQ_GAIN_REVIVE
	if(target.mob_biotypes & MOB_UNDEAD)
		display_results(user, target, span_notice("You cannot infuse life into the undead! The rot must be cured first."),
			"[user] roots the REVIVER onto [target]'s heart.",
			"[user] roots the REVIVER onto [target]'s heart.")
		return FALSE
	if (target.mind)
		if(alert(target, "The REVIVER's sucking onto your heart. Live?", "Revival", "The REVIVER is my lifeblood.", "I shall die.") != "The REVIVER is my lifeblood.")
			display_results(user, target, span_notice("[target]'s heart refuses the lux. They're only in sweet dreams, now."),
				"[user] tries to root the REVIVER onto [target]'s heart, but the body rejects.",
				"[user] tries to root the REVIVEr onto [target]'s heart, but the body rejects.")
			return FALSE
	target.adjustOxyLoss(-target.getOxyLoss()) //Ye Olde CPR
	if(!target.revive(full_heal = FALSE))
		display_results(user, target, span_notice("The REVIVER refuses to latch with [target]'s heart. Their damage must be too severe still."),
			"[user] tries to root the REVIVER onto [target]'s heart, but it can't latch on.",
			"[user] tries to root the REVIVEr onto [target]'s heart, but it can't latch on.")
		return FALSE
	display_results(user, target, span_notice("You succeed in restarting [target]'s heart with the REVIVER."),
		"[user] roots the REVIVER onto [target]'s heart.",
		"[user] roots the REVIVER onto [target]'s heart.")
	var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
	if(underworld_spirit)
		var/mob/dead/observer/ghost = underworld_spirit.ghostize()
		qdel(underworld_spirit)
		ghost.mind.transfer_to(target, TRUE)
	target.grab_ghost(force = TRUE) // even suicides
	target.emote("breathgasp")
	target.Jitter(100)
	GLOB.azure_round_stats[STATS_LUX_REVIVALS]++
	target.update_body()
	target.visible_message(span_notice("[target] is dragged back from DEATH!"), span_green("I awake from the void."))
	qdel(tool)
	if(target.mind)
		if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
			adjust_playerquality(revive_pq, user.ckey)
			ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
	target.remove_status_effect(/datum/status_effect/debuff/rotted_zombie)	//Removes the rotted-zombie debuff if they have it - Failsafe for it.
	target.apply_status_effect(/datum/status_effect/debuff/revived)	//Temp debuff on revive, your stats get hit temporarily. Doubly so if having rotted.
	return TRUE

/datum/surgery_step/infuse_lux/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent, success_prob)
	display_results(user, target, span_warning("I screwed up!"),
		span_warning("[user] screws up!"),
		span_notice("[user] roots the REVIVER onto [target]'s heart."), TRUE)
	return TRUE
