extends CanvasLayer

@onready var grid_container = $Panel/GridContainer

var inventory_manager = InventoryManager
var item_scene = preload("res://scenes/ui/inventory_item.tscn")

func _ready():
	hide()
	inventory_manager.inventory.connect("changed", Callable(self, "update_ui"))

func _input(event):
	if event.is_action_pressed("ui_inventory"):
		if visible:
			hide()
		else:
			show()
			update_ui()

func update_ui():
	for child in grid_container.get_children():
		child.queue_free()
	
	for item in inventory_manager.inventory.items:
		var item_instance = item_scene.instantiate()
		item_instance.get_node("TextureRect").texture = item.texture
		grid_container.add_child(item_instance)
