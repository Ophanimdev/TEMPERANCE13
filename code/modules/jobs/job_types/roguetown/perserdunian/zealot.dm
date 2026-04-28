/datum/job/roguetown/zealot
	title = "Zealot"
	flag = ZEALOT
	department_flag = PERSERDUN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_races = RACES_CONSCRIPT
	allowed_sexes = list(FEMALE) // I only have a sprite for females
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)

	tutorial = "Since birth you have been put through the ringer for RAB, time and time again. \
				Twin saws connect to your mechanical wrists, like a soldier ant, you are sustained by the labours of others.\
				You do not know the origin of your Blessings, nor do you care. What matters is that Rab's will is upheld.\ "

	outfit = /datum/outfit/job/roguetown/zealot
	display_order = JDO_ZEALOT
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_zealot.ogg'

/datum/job/roguetown/zealot/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.set_patron(/datum/patron/godless/perserdun) // I'm kinda evil so I'm just gonna force people to be this faith rather than have it as a req
		if(istype(H.wear_ring, /obj/item/roguekey/perserdun))
			var/obj/item/clothing/S = H.wear_ring
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = " [index]'s dogtag"


// They don't really have to wear much at all.
/datum/outfit/job/roguetown/zealot/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/boots
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine
	cloak = /obj/item/clothing/cloak/perserduntrenchcoat
	pants = /obj/item/clothing/under/roguetown/trou/artipants
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored/gilded
	mask = /obj/item/clothing/mask/rogue/gasmask/perserdunmask
	belt = /obj/item/storage/belt/rogue/leather/black/soldier
	backl = // A-Grav Wings go here
	wrists = /obj/item/scomstone/garrison
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	id = /obj/item/roguekey/perserdun
	// Chop their arms off and replace them with something better
	var/obj/item/bodypart/left_arm = H.get_bodypart(BODY_ZONE_L_ARM)
	if(left_arm)
		left_arm.drop_limb()
		qdel(left_arm)
		var/obj/item/bodypart/l_arm/prosthetic/bronzeleft/zealot/L = new()
		L.attach_limb(H)
	var/obj/item/bodypart/right_arm = H.get_bodypart(BODY_ZONE_R_ARM)
	if(right_arm)
		right_arm.drop_limb()
		qdel(right_arm)
		var/obj/item/bodypart/r_arm/prosthetic/bronzeright/R = new()
		R.attach_limb(H)

	l_hand = // Chainsaw
	r_hand = // Chainsaw



	// They literally aren't going to be able to do anything but chew through people
	H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 5)
	H.change_stat("constitution", 5)
	H.change_stat("intelligence", -5)
	H.change_stat("endurance", 5)
	H.change_stat("speed", 6)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC) // They are ZEALOUS
