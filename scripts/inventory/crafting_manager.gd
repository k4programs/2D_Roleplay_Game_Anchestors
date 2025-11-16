extends Node

var recipes: Array[Recipe] = []

func _ready():
	# For testing purposes, create some items and a recipe
	var wood = Item.new()
	wood.name = "Wood"
	var stone = Item.new()
	stone.name = "Stone"
	
	var wooden_sword = Item.new()
	wooden_sword.name = "Wooden Sword"
	
	var recipe = Recipe.new()
	recipe.ingredients = [wood, wood, stone]
	recipe.result = wooden_sword
	
	add_recipe(recipe)
	
	# Add some items to the player's inventory for testing
	InventoryManager.add_item(wood)
	InventoryManager.add_item(wood)
	InventoryManager.add_item(stone)


func add_recipe(recipe: Recipe):
	recipes.append(recipe)

func can_craft(recipe: Recipe) -> bool:
	var inventory = InventoryManager.inventory
	for ingredient in recipe.ingredients:
		if not inventory.items.has(ingredient):
			return false
	return true

func craft(recipe: Recipe):
	if can_craft(recipe):
		for ingredient in recipe.ingredients:
			InventoryManager.remove_item(ingredient)
		InventoryManager.add_item(recipe.result)
		print("Crafted item: " + recipe.result.name)
	else:
		print("Cannot craft item: " + recipe.result.name)
