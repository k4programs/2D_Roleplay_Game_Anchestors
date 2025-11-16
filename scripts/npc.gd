extends Node2D

@onready var interactable = $Interactable

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))

func _on_interacted():
	DialogManager.show_dialog("NPC", "Hallo! Ich bin ein NPC.")
