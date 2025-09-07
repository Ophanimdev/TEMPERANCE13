/datum/ai_controller/stranger
	movement_delay = SKELETON_MOVEMENT_SPEED * 1.2 //ranged malus

	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	planning_subtrees = list(
		/datum/ai_planning_subtree/being_a_minion,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree,
		/datum/ai_planning_subtree/simple_find_target/closest,
	)

	idle_behavior = /datum/idle_behavior/idle_random_walk
