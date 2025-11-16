extends Node

var dialog_box_scene = preload("res://scenes/ui/dialog_box.tscn")
var dialog_box_instance

func _ready():
	dialog_box_instance = dialog_box_scene.instantiate()
	get_tree().get_root().call_deferred("add_child", dialog_box_instance)

func show_dialog(character_name, text):
	dialog_box_instance.show_dialog(character_name, text)
