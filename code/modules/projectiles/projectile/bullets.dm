/obj/projectile/bullet
	name = "bullet"
	icon_state = "bullet"
	damage = 60
	pass_flags = PASSTABLE | PASSGRILLE
	damage_type = BRUTE
	nodamage = FALSE
	flag = "piercing"
	hitsound_wall = "ricochet"
	impact_effect_type = /obj/effect/temp_visual/impact_effect
	hitscan = TRUE
	nodamage = FALSE
	range = 20
	woundclass = BCLASS_PIERCE
	speed = 1
	muzzle_type = /obj/effect/projectile/muzzle/bullet
	tracer_type = /obj/effect/projectile/tracer/bullet
