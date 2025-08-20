/datum/job/roguetown/grandknight
	title = "Grand Knight"
	flag = GRANDKNIGHT
	department_flag = PERSERDUN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)

	tutorial = "You're the right hand man of the Grandmaster. Essentially a drugged up, combative Lieutenant. \
				Your main goal is to draw the most attention onto yourself, while soaking up the most damage. \
				Typically, Grand Knights are hand selected by their Grandmaster. You might also be assigned to one. \
				Also, most Grand Knights lack fine-motor skills, due to the increased intake of stimulants. They aren't trained in guns." 

	outfit = /datum/outfit/job/roguetown/grandknight
	display_order = JDO_GRANDKNIGHT
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_grandknight.ogg'

/datum/outfit/job/roguetown/grandknight/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/flashlight/flare/torch/lantern
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/iron
	cloak = /obj/item/clothing/cloak/perserduntabard
	pants = /obj/item/clothing/under/roguetown/trou/artipants
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/iron
	mask = /obj/item/clothing/mask/rogue/gasmask/perserdunmask
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/ammobag
	backl = /obj/item/rogueweapon/stoneaxe/oath
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron
	backr = /obj/item/storage/backpack/rogue/backpack/perserdun
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel,
		/obj/item/storage/keyring/guardcastle, //temp
	)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE) //test 2 see if it's broken
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 2)
	H.change_stat("perception", 2)
	H.change_stat("speed", 3)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
