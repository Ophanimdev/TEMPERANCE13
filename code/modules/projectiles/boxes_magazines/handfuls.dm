/obj/item/ammo_box/handfuls
	multiple_sprites = AMMO_BOX_PER_BULLET
	icon = 'icons/roguetown/weapons/gunammo.dmi'
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 5
	multiload = 0

/obj/item/ammo_box/handfuls/get_round(keep = FALSE)
    var/obj/item/ammo_casing/R = ..(keep)
    if(!stored_ammo.len)
        qdel(src)
    return R

//rifle handfuls
/obj/item/ammo_box/handfuls/rifle
	name = "handful of rifle bullets"
	desc = "A handful of rifle bullets."
	ammo_type = /obj/item/ammo_casing/a762
	caliber = "a762"
	max_ammo = 5
	multiload = 0
	icon_state = "rifle-handful_QT"

/obj/item/ammo_box/handfuls/leveraction
	name = "handful of custom bullets"
	desc = "A handful of modified pistol bullets, made in Perserdun."
	icon_state = "rifle-handful_QT"
	ammo_type = /obj/item/ammo_casing/a9mm
	caliber = "a9mm"
	max_ammo = 7
	multiload = 0
	icon_state = "pistol-handful"

//shotgun handfuls
/obj/item/ammo_box/handfuls/shotgun
	name = "handful of shotgun slugs"
	desc = "A handful of yummy slugs."
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = "shotgun"
	max_ammo = 5
	multiload = 0
	icon_state = "shotgun-handful_QT"

/obj/item/ammo_box/handfuls/shotgun/buckshot
	name = "handful of shotgun slugs"
	desc = "A handful of evil buckshot."
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 5
	multiload = 0
	icon_state = "shotgun-handful"
