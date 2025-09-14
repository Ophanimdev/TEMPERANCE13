
//heavy armor


/obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor
	name = "manufactured armor plate"
	desc = "A standard, manufactured armor plate produced by the local WAR MACHINE."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	icon_state = "EB_armor"
	item_state = "EB_armor"
	armor = ARMOR_GRUDGEBEARER
	allowed_race = ALL_RACES_TYPES
	prevent_crits = list(BCLASS_TWIST)
	body_parts_covered = CHEST|GROIN|VITALS
	equip_delay_self = 5 SECONDS
	unequip_delay_self = 5 SECONDS
	equip_delay_other = 1 SECONDS
	strip_delay = 2 SECONDS
	smelt_bar_num = 4
	max_integrity = 1000
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/layeredarmor/ebarmor)

/datum/component/layeredarmor/ebarmor/
	hits_to_shred = list(
		"blunt" = 10,
		"slash" = 10,
		"stab" = 10,
		"piercing" = 10,
	)

	layer_max = list(
		"blunt" = 40,
		"slash" = 100,
		"stab" = 100,
		"piercing" = 90,
	)

	hits_per_layer = list(
		"100"	= 10,
		"70" 	= 10,
		"40" 	= 10,
		"10" 	= 10,
	)

	damtype_shred_ratio = list(
		"blunt" = 5,
		"slash" = 1,
		"stab" = 1,
		"piercing" = 5,
	)

	shred_amt = 30
	layer_repair = 3
	shred_sound = 'sound/combat/armorblock.ogg'

/obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor/pauldrons
	name = "pauldroned armor plate"
	desc = "A humen-modified, manufactured armor plate. Once produced by the local WAR MACHINE, with pauldrons slapped on."
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	icon_state = "EB_armor_pauldrons"
	item_state = "EB_armor_pauldrons"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = null

/obj/item/clothing/suit/roguetown/armor/plate/full/ebarmor/pauldrons/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/layeredarmor/ebarmor)


/obj/item/clothing/suit/roguetown/armor/plate/full/iron //moved from plate.dm
	name = "iron plate armor"
	icon_state = "iplate"
	desc = "Full iron plate armor. Slow to don and doff without the aid of an Armsman."
	smeltresult = /obj/item/ingot/iron
	max_integrity = ARMOR_INT_CHEST_PLATE_IRON
	armor = ARMOR_GRUDGEBEARER
	allowed_race = ALL_RACES_TYPES
	prevent_crits = list(BCLASS_TWIST)
	equip_delay_self = 5 SECONDS
	unequip_delay_self = 5 SECONDS
	equip_delay_other = 1 SECONDS
	strip_delay = 2 SECONDS
	smelt_bar_num = 4
	max_integrity = 1000

/obj/item/clothing/suit/roguetown/armor/plate/full/iron/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/layeredarmor/grandknight)

/datum/component/layeredarmor/grandknight/
	hits_to_shred = list(
		"blunt" = 10,
		"slash" = 10,
		"stab" = 10,
		"piercing" = 10,
	)

	layer_max = list(
		"blunt" = 40,
		"slash" = 100,
		"stab" = 100,
		"piercing" = 90,
	)

	hits_per_layer = list(
		"100"	= 10,
		"70" 	= 10,
		"40" 	= 10,
		"10" 	= 10,
	)

	shred_amt = 30

	damtype_shred_ratio = list(
		"blunt" = 1,
		"slash" = 1,
		"stab" = 1,
		"piercing" = 3,
	)


//light armor

/obj/item/clothing/suit/roguetown/armor/leather/grandmaster
	name = "master's cloak"
	desc = "A full-body suit, stolen from a WAR MACHINE. Rather expensive. Comes with a decorative tin shoulder."
	icon_state = "grandmaster"
	item_state = "grandmaster"
	body_parts_covered = COVERAGE_FULL
	sleeved = 'icons/roguetown/clothing/onmob/armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/consulo
	name = "consulo's coat"
	desc = "One of the few trench coats you'll actually see. Very, very expensive."
	icon_state = "consulo"
	item_state = "consulo"
	body_parts_covered = COVERAGE_FULL
	sellprice = 800 //kill the enemy's diplomat for insane amounts of money

/obj/item/clothing/suit/roguetown/armor/leather/envoy
	name = "envoy's coat"
	desc = "A stylish piece, meant to showcase Perserdun's strong economy."
	icon_state = "envoy"
	item_state = "envoy"
	body_parts_covered = COVERAGE_FULL
	sellprice = 400

/obj/item/clothing/suit/roguetown/armor/leather/mortician
	name = "mortici's robes"
	desc = "A set of clothing that's meant to protect from scalpel nicks."
	icon_state = "mortician"
	item_state = "mortician"
	body_parts_covered = COVERAGE_FULL
