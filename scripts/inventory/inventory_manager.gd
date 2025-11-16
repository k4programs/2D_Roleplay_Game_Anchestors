extends Node

var inventory: Inventory

func _ready():
	inventory = Inventory.new()

func add_item(item: Item):
	inventory.items.append(item)
	print("Added item: " + item.name)

func remove_item(item: Item):
	inventory.items.erase(item)
	print("Removed item: " + item.name)
