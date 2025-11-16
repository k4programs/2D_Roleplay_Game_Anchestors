extends CanvasLayer

@onready var player_slots = [$Player1, $Player2, $Player3]
@onready var enemy_slots = [$Enemy1, $Enemy2, $Enemy3]

var player_companions: Array[Companion]
var enemy_companions: Array[Companion]

func setup_battle(player_team: Array[Companion], enemy_team: Array[Companion]):
	player_companions = player_team
	enemy_companions = enemy_team
	update_ui()

func _on_attack_button_pressed():
	if player_companions.size() > 0 and enemy_companions.size() > 0:
		var turn_order = get_turn_order()
		for companion in turn_order:
			if companion in player_companions:
				var target = get_random_enemy()
				if target:
					attack(companion, target)
			else:
				var target = get_random_player_companion()
				if target:
					attack(companion, target)
			
			if is_battle_over():
				return

func get_turn_order() -> Array[Companion]:
	var all_companions = player_companions + enemy_companions
	all_companions.sort_custom(func(a, b): return a.speed > b.speed)
	return all_companions

func get_random_enemy() -> Companion:
	if enemy_companions.size() > 0:
		return enemy_companions[randi() % enemy_companions.size()]
	return null

func get_random_player_companion() -> Companion:
	if player_companions.size() > 0:
		return player_companions[randi() % player_companions.size()]
	return null

func attack(attacker: Companion, defender: Companion):
	var damage = max(1, attacker.attack - defender.defense)
	defender.hp -= damage
	print(attacker.name + " attacks " + defender.name + " for " + str(damage) + " damage!")
	
	if defender.hp <= 0:
		if defender in player_companions:
			player_companions.erase(defender)
			print(defender.name + " was defeated!")
		else:
			enemy_companions.erase(defender)
			print(defender.name + " was defeated!")
	
	update_ui()

func is_battle_over() -> bool:
	if player_companions.size() == 0:
		print("You lose!")
		BattleManager.end_battle()
		return true
	elif enemy_companions.size() == 0:
		print("You win!")
		BattleManager.end_battle()
		return true
	return false

func update_ui():
	for i in range(player_slots.size()):
		if i < player_companions.size():
			var companion = player_companions[i]
			var slot = player_slots[i]
			slot.visible = true
			slot.get_node("HPLabel").text = "HP: " + str(companion.hp) + "/" + str(companion.max_hp)
			slot.get_node("Sprite").texture = companion.texture
		else:
			player_slots[i].visible = false

	for i in range(enemy_slots.size()):
		if i < enemy_companions.size():
			var companion = enemy_companions[i]
			var slot = enemy_slots[i]
			slot.visible = true
			slot.get_node("HPLabel").text = "HP: " + str(companion.hp) + "/" + str(companion.max_hp)
			slot.get_node("Sprite").texture = companion.texture
		else:
			enemy_slots[i].visible = false
