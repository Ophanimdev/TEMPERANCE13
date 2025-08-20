//rifles

/obj/item/ammo_casing/a762
	name = "7.62 FMJ bullet casing"
	desc = "A 7.62 FMJ bullet."
	icon_state = "spent-casing_QT_rifle"
	caliber = "a762"
	projectile_type = /obj/projectile/bullet/a762
	bullet_type = RIFLECASING
// handguns

/obj/item/ammo_casing/a9mm
	name = "9mm bullet casing"
	desc = "A 9mm lead ball, stuffed into a bullet case."
	icon_state = "spent-casing_QT_pistol"
	caliber = "a9mm"
	projectile_type = /obj/projectile/bullet/a9mm

/obj/item/ammo_casing/a44
	name = ".44 bullet casing"
	desc = "A freakishly lethal .44 bullet-piece."
	icon_state = "spent-casing_QT_pistol"
	caliber = "a44"
	projectile_type = /obj/projectile/bullet/a44
	bullet_type = RIFLECASING
//shotguns

/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "An evil slug."
	icon_state = "spent-casing_QT_shotgun"
	caliber = "shotgun"
	projectile_type = /obj/projectile/bullet/shotgun_slug
	bullet_type = SHOTGUNCASING

/obj/item/ammo_casing/shotgun/buckshot
	name = "buckshot shell"
	desc = "A plastic piece that shoots buckshot."
	icon_state = "spent-casing_shotgun"
	icon_state = "gshell"
	caliber = "shotgun"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot
	pellets = 6
	variance = 18
	bullet_type = SHOTGUNCASING
