extends Node2D

@onready var interactable = $Interactable

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))

func _on_interacted():
	var dialog_end = Dialog.new()
	dialog_end.character_name = "NPC"
	dialog_end.text = "Auf Wiedersehen!"

	var choice2 = DialogChoice.new()
	choice2.text = "Ich muss gehen."
	choice2.next_dialog = dialog_end

	var choice1 = DialogChoice.new()
	choice1.text = "Wie geht es dir?"
	choice1.next_dialog = dialog_end # For simplicity, both choices lead to the same end for now

	var dialog_start = Dialog.new()
	dialog_start.character_name = "NPC"
	dialog_start.text = "Hallo! Was kann ich für dich tun?"
	dialog_start.choices = [choice1, choice2]
	
	DialogManager.show_dialog(dialog_start)
