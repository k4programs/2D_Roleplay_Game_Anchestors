extends CanvasLayer

signal choice_selected(choice_index: int)

@onready var text_label = $Panel/TextLabel
@onready var name_label = $Panel/NameLabel
@onready var choice_container = $Panel/ChoiceContainer

func _ready():
	hide()

func show_dialog(character_name: String, text: String, choices: Array[DialogChoice] = []):
	name_label.text = character_name
	text_label.text = text
	
	# Clear previous choices
	for child in choice_container.get_children():
		child.queue_free()
	
	# Add new choices
	if choices.size() > 0:
		for i in range(choices.size()):
			var choice = choices[i]
			var button = Button.new()
			button.text = choice.text
			button.pressed.connect(Callable(self, "_on_choice_button_pressed").bind(i))
			choice_container.add_child(button)
		choice_container.visible = true
	else:
		choice_container.visible = false
	
	show()

func _input(event):
	if visible and event.is_action_pressed("ui_accept") and choice_container.get_children().size() == 0:
		hide()

func _on_choice_button_pressed(choice_index: int):
	emit_signal("choice_selected", choice_index)
	hide()
