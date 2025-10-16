/datum/job/roguetown/pilgrim
	title = "Pioneer"
	flag = PIONEER
	department_flag = UNAFFILIATED
	faction = "Station"
	total_positions = 20
	spawn_positions = 20
	allowed_races = RACES_ALL_KINDS
	tutorial = "Maybe you're a victim of war - having your town ripped apart by artillery shells and guns. Maybe you're just some random bum, with skills. Either way, you're here! The possibilities are endless."
	display_order = JDO_PIONEER

	outfit = null
	outfit_female = null
	bypass_lastclass = TRUE
	bypass_jobban = FALSE
	

	advclass_cat_rolls = list(CTAG_PILGRIM = 20)
	PQ_boost_divider = 10

	announce_latejoin = FALSE
	min_pq = -20
	max_pq = null
	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = FALSE
	same_job_respawn_delay = 0

/datum/job/roguetown/pilgrim/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

		if(GLOB.adventurer_hugbox_duration)
			///FOR SOME SILLY FUCKING REASON THIS REFUSED TO WORK WITHOUT A FUCKING TIMER IT JUST FUCKED SHIT UP
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_start)), 1)
