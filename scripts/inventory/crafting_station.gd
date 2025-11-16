extends Node2D

@onready var interactable = $Interactable
@onready var crafting_ui = $CraftingUI

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))

func _on_interacted():
	crafting_ui.show_crafting_menu()
