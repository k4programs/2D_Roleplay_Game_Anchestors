extends Node

var dialog_box_scene = preload("res://scenes/ui/dialog_box.tscn")
var dialog_box_instance

var current_dialog: Dialog

func _ready():
	dialog_box_instance = dialog_box_scene.instantiate()
	get_tree().get_root().call_deferred("add_child", dialog_box_instance)
	dialog_box_instance.connect("choice_selected", Callable(self, "_on_choice_selected"))

func show_dialog(dialog: Dialog):
	current_dialog = dialog
	dialog_box_instance.show_dialog(dialog.character_name, dialog.text, dialog.choices)

func _on_choice_selected(choice_index: int):
	if current_dialog and choice_index < current_dialog.choices.size():
		var selected_choice = current_dialog.choices[choice_index]
		if selected_choice.next_dialog:
			show_dialog(selected_choice.next_dialog)
		else:
			dialog_box_instance.hide()
	else:
		dialog_box_instance.hide()
