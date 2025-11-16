extends Node2D

@onready var interactable = $Interactable

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))

func _on_interacted():
	var player_companion = Companion.new()
	player_companion.name = "Player Companion"
	player_companion.texture = preload("res://assets/art/ui/icon.svg")
	player_companion.max_hp = 20
	player_companion.hp = 20
	player_companion.attack = 5

	var enemy_companion = Companion.new()
	enemy_companion.name = "Enemy Companion"
	enemy_companion.texture = preload("res://assets/art/ui/icon.svg")
	enemy_companion.max_hp = 15
	enemy_companion.hp = 15
	enemy_companion.attack = 3
	
	BattleManager.start_battle([player_companion], [enemy_companion])
