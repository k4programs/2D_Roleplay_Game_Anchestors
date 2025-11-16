extends Area2D

signal interacted

@export var prompt_message = "Interact"

var player_in_area = false
var prompt_label

func _ready():
	prompt_label = Label.new()
	prompt_label.text = prompt_message
	prompt_label.visible = false
	add_child(prompt_label)
	
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _input(event):
	if player_in_area and event.is_action_pressed("ui_accept"):
		emit_signal("interacted")

func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		prompt_label.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		prompt_label.visible = false
