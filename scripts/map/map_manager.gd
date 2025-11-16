extends Node

var current_map: Map

func change_map(new_map: Map, entry_point_name: String = ""):
	if current_map:
		get_tree().current_scene.queue_free()
	
	current_map = new_map
	var new_scene = load(new_map.scene_path).instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
	
	if entry_point_name != "" and new_map.entry_points.has(entry_point_name):
		var player = get_tree().current_scene.find_child("Player")
		if player:
			player.position = new_map.entry_points[entry_point_name]
