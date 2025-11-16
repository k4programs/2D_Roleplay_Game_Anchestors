extends CanvasLayer

@onready var recipe_list = $Panel/ScrollContainer/VBoxContainer

var recipe_scene = preload("res://scenes/ui/recipe_entry.tscn")

func _ready():
	hide()

func show_crafting_menu():
	update_ui()
	show()

func _input(event):
	if visible and event.is_action_pressed("ui_cancel"):
		hide()

func update_ui():
	for child in recipe_list.get_children():
		child.queue_free()
	
	for recipe in CraftingManager.recipes:
		var recipe_instance = recipe_scene.instantiate()
		recipe_instance.set_recipe(recipe)
		recipe_list.add_child(recipe_instance)
