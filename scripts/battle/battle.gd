extends CanvasLayer

@onready var player_hp_label = $Player/HPLabel
@onready var enemy_hp_label = $Enemy/HPLabel
@onready var player_sprite = $Player/Sprite
@onready var enemy_sprite = $Enemy/Sprite

var player_companions: Array[Companion]
var enemy_companions: Array[Companion]

func setup_battle(player_team: Array[Companion], enemy_team: Array[Companion]):
	player_companions = player_team
	enemy_companions = enemy_team
	update_ui()

func _on_attack_button_pressed():
	# Player attacks enemy
	var player_companion = player_companions[0]
	var enemy_companion = enemy_companions[0]
	enemy_companion.hp -= player_companion.attack
	print("Player attacks! Enemy HP: " + str(enemy_companion.hp))
	update_ui()
	
	if enemy_companion.hp <= 0:
		print("You win!")
		BattleManager.end_battle()
		return

	# Enemy attacks player
	player_companion.hp -= enemy_companion.attack
	print("Enemy attacks! Player HP: " + str(player_companion.hp))
	update_ui()

	if player_companion.hp <= 0:
		print("You lose!")
		BattleManager.end_battle()

func update_ui():
	var player_companion = player_companions[0]
	var enemy_companion = enemy_companions[0]
	
	player_hp_label.text = "HP: " + str(player_companion.hp) + "/" + str(player_companion.max_hp)
	enemy_hp_label.text = "HP: " + str(enemy_companion.hp) + "/" + str(enemy_companion.max_hp)
	
	player_sprite.texture = player_companion.texture
	enemy_sprite.texture = enemy_companion.texture
