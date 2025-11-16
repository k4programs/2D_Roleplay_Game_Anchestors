extends Area2D

@export var target_map: Map
@export var target_entry_point: String = ""

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":
		MapManager.change_map(target_map, target_entry_point)
