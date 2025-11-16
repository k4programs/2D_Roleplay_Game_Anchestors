extends CanvasLayer

@onready var text_label = $Panel/TextLabel
@onready var name_label = $Panel/NameLabel

func _ready():
	hide()

func show_dialog(character_name, text):
	name_label.text = character_name
	text_label.text = text
	show()

func _input(event):
	if visible and event.is_action_pressed("ui_accept"):
		hide()
