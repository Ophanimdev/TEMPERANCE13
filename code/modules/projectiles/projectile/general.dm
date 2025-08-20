/obj/projectile/bullet/a762
	name = "7.62 bullet"
	icon_state = "bullet_proj"
	damage = 70

/obj/projectile/bullet/a9mm
	name = "9mm bullet"
	icon_state = "bullet_proj"
	damage = 50

/obj/projectile/bullet/a44
	name = ".44 bullet"
	icon_state = "bullet_proj"
	damage = 60

// shotgun

/obj/projectile/bullet/shotgun_slug
	name = "12g shotgun slug"
	damage = 70
	spread = 2

/obj/projectile/bullet/pellet/shotgun_buckshot
	name = "buckshot pellet"
	damage = 13.5

// shotgun falloff
/obj/projectile/bullet/pellet
	var/tile_dropoff = 0.45
	var/tile_dropoff_s = 1.25

/obj/projectile/bullet/pellet/Range()
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(damage < 0)
		qdel(src)
