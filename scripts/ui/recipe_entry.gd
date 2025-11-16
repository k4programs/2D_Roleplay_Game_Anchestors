extends HBoxContainer

var recipe: Recipe

@onready var ingredients_label = $IngredientsLabel
@onready var result_label = $ResultLabel
@onready var craft_button = $CraftButton

func set_recipe(new_recipe: Recipe):
	recipe = new_recipe
	
	var ingredients_text = "Ingredients: "
	for ingredient in recipe.ingredients:
		ingredients_text += ingredient.name + " "
	ingredients_label.text = ingredients_text
	
	result_label.text = "Result: " + recipe.result.name
	
	update_button()

func _on_craft_button_pressed():
	CraftingManager.craft(recipe)
	update_button()

func update_button():
	craft_button.disabled = not CraftingManager.can_craft(recipe)
