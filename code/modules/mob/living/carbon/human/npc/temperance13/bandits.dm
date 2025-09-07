/mob/living/carbon/human/species/human/northern/bandit
	aggressive=1
	rude = TRUE
	mode = NPC_AI_IDLE
	faction = list("viking", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()
	var/is_silent = FALSE /// Determines whether or not we will scream our funny lines at people.


/mob/living/carbon/human/species/human/northern/high/bandit/ambush
	aggressive=1

	wander = TRUE

/mob/living/carbon/human/species/human/northern/bandit/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(!is_silent && target != newtarg)
			say(pick(GLOB.highwayman_aggro))
			linepoint(target)

/mob/living/carbon/human/species/human/northern/bandit/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/bandit/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	is_silent = TRUE


/mob/living/carbon/human/species/human/northern/bandit/after_creation()
	..()
	job = "Raider"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/northern/bandit)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")
	update_hair()
	update_body()
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = 30 // 50% More than goblin

/mob/living/carbon/human/species/human/northern/bandit/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))

/mob/living/carbon/human/species/human/northern/bandit/handle_combat()
	if(mode == NPC_AI_HUNT)
		if(prob(2)) // do not make this big or else they NEVER SHUT UP
			emote("laugh")
	. = ..()

/datum/outfit/job/roguetown/human/species/human/northern/bandit/pre_equip(mob/living/carbon/human/H)
	mask = /obj/item/clothing/mask/rogue/gasmask/eb_gasmask
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/heavy/ebhelmet
	if(prob(30))
		head = /obj/item/clothing/head/roguetown/helmet/heavy/ebhelmet/visored
	if(prob(50))
		neck = /obj/item/clothing/neck/roguetown/coif
	gloves = /obj/item/clothing/gloves/roguetown/leather/ebgloves
	if(prob(50))
		gloves = /obj/item/clothing/gloves/roguetown/angle
	H.STASTR = rand(12,14) //GENDER EQUALITY!!
	H.STASPD = 11
	H.STACON = rand(10,12) //so their limbs no longer pop off like a skeleton
	H.STAEND = 13
	H.STAPER = 10
	H.STAINT = 10
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/iron/short
	else
		r_hand = /obj/item/rogueweapon/mace/cudgel
	if(prob(20))
		r_hand = /obj/item/rogueweapon/sword/falchion/militia
	if(prob(20))
		r_hand = /obj/item/rogueweapon/pick/militia
	if(prob(25))	
		l_hand = /obj/item/rogueweapon/shield/wood
	if(prob(10))
		l_hand = /obj/item/rogueweapon/shield/buckler/palloy
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	if(prob(30))
		neck = /obj/item/clothing/neck/roguetown/leather
	H.eye_color = "27becc"
	H.hair_color = "61310f"
	H.facial_hair_color = H.hair_color
	if(H.gender == FEMALE)
		H.hairstyle =  "Messy (Rogue)"
	else
		H.hairstyle = "Messy"
		H.facial_hairstyle = "Beard (Manly)"
	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE) // Trash mobs, untrained.
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
