extends Node

var battle_scene = preload("res://scenes/battle.tscn")
var battle_instance

var player_companions: Array[Companion]
var enemy_companions: Array[Companion]

func start_battle(player_team: Array[Companion], enemy_team: Array[Companion]):
	player_companions = player_team
	enemy_companions = enemy_team
	
	battle_instance = battle_scene.instantiate()
	get_tree().get_root().add_child(battle_instance)
	
	battle_instance.setup_battle(player_companions, enemy_companions)

func end_battle():
	if battle_instance:
		battle_instance.queue_free()
		battle_instance = null
