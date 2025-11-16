extends Node

var available_maps: Dictionary = {} # Dictionary of map_name: Map
var current_map: Map

signal map_changed(new_map: Map)

func _ready():
	# TODO: Load maps from files
	pass

func add_map(map_name: String, map_resource: Map):
	available_maps[map_name] = map_resource

func get_map(map_name: String) -> Map:
	return available_maps.get(map_name)

func change_map(new_map_name: String, entry_point_name: String = ""):
	var new_map = get_map(new_map_name)
	if not new_map:
		print("Error: Map not found: " + new_map_name)
		return
	
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
	
	emit_signal("map_changed", current_map)
