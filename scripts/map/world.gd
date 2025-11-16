extends Node2D

func _ready():
	var world_map = Map.new()
	world_map.scene_path = "res://scenes/world.tscn"
	world_map.entry_points["start"] = Vector2(100, 80)
	MapManager.add_map("World", world_map)
	
	var fluesterwald_map = Map.new()
	fluesterwald_map.scene_path = "res://scenes/world/fluesterwald.tscn"
	fluesterwald_map.entry_points["entrance"] = Vector2(50, 50)
	MapManager.add_map("Fluesterwald", fluesterwald_map)
	
	# Set the current map to World
	MapManager.current_map = world_map
