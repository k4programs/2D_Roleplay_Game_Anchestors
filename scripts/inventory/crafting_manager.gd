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
	var ingredients: Array[Item] = [wood, wood, stone]
	recipe.ingredients = ingredients
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
	var inventory_counts = {}
	for item in inventory.items:
		if not inventory_counts.has(item.name):
			inventory_counts[item.name] = 0
		inventory_counts[item.name] += 1
		
	var recipe_counts = {}
	for item in recipe.ingredients:
		if not recipe_counts.has(item.name):
			recipe_counts[item.name] = 0
		recipe_counts[item.name] += 1
	
	for item_name in recipe_counts:
		if not inventory_counts.has(item_name) or inventory_counts[item_name] < recipe_counts[item_name]:
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
