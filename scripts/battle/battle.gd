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
	# Player's turn
	if player_companions.size() > 0 and enemy_companions.size() > 0:
		var player_companion = player_companions[0]
		var enemy_companion = enemy_companions[0]
		
		enemy_companion.hp -= player_companion.attack
		print("Player attacks! Enemy HP: " + str(enemy_companion.hp))
		
		if enemy_companion.hp <= 0:
			enemy_companions.remove_at(0)
			print("Enemy companion defeated!")

	update_ui()
	
	if enemy_companions.size() == 0:
		print("You win!")
		BattleManager.end_battle()
		return

	# Enemy's turn
	if player_companions.size() > 0 and enemy_companions.size() > 0:
		var player_companion = player_companions[0]
		var enemy_companion = enemy_companions[0]

		player_companion.hp -= enemy_companion.attack
		print("Enemy attacks! Player HP: " + str(player_companion.hp))

		if player_companion.hp <= 0:
			player_companions.remove_at(0)
			print("Player companion defeated!")
	
	update_ui()

	if player_companions.size() == 0:
		print("You lose!")
		BattleManager.end_battle()

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
