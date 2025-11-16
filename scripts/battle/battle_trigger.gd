extends Node2D

@onready var interactable = $Interactable

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))

func _on_interacted():
	var player_team = []
	for i in range(3):
		var companion = Companion.new()
		companion.name = "Player Companion " + str(i + 1)
		companion.texture = preload("res://assets/art/ui/icon.svg")
		companion.max_hp = 20 + i * 5
		companion.hp = companion.max_hp
		companion.attack = 5 + i * 2
		player_team.append(companion)

	var enemy_team = []
	for i in range(3):
		var companion = Companion.new()
		companion.name = "Enemy Companion " + str(i + 1)
		companion.texture = preload("res://assets/art/ui/icon.svg")
		companion.max_hp = 15 + i * 5
		companion.hp = companion.max_hp
		companion.attack = 3 + i * 2
		enemy_team.append(companion)
	
	BattleManager.start_battle(player_team, enemy_team)
