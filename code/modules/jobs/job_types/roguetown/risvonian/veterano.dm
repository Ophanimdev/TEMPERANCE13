/datum/job/roguetown/veterano
	title = "Veterano"
	flag = VETERANO
	department_flag = RISVON
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT)

	tutorial = "You're Risvonian Squad Support. \
				You're supposed to obey the orders of the Oficiro and Commandant, while working with your squadron. \
				Ideally, you're supposed to keep your Soldatos alive, while whatever your higher-ups define as 'The Enemy'. \
				Veteranos are typically promoted from Soldatos, based off of their combat and leadership prowess." 

	outfit = /datum/outfit/job/roguetown/veterano
	display_order = JDO_VETERANO
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_veterano.ogg'

/datum/outfit/job/roguetown/veterano/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	shoes = /obj/item/clothing/shoes/roguetown/boots
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor
	cloak = /obj/item/clothing/cloak/templar/malumite
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	head = /obj/item/clothing/head/roguetown/helmet/kettle/iron/visored
	mask = /obj/item/clothing/mask/rogue/gasmask/risvonmask
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/storage/belt/rogue/pouch/ammobag
	gloves = /obj/item/clothing/gloves/roguetown/eastgloves1
	backl = /obj/item/gun/ballistic/shotgun/risvon
	backr = /obj/item/storage/backpack/rogue/backpack/risvon
	backpack_contents = list(
		/obj/item/ammo_box/handfuls/shotgun/buckshot = 4,
		/obj/item/rogueweapon/huntingknife/idagger/steel,
		/obj/item/storage/keyring/guardcastle,
	)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shotguns, 4, TRUE)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
