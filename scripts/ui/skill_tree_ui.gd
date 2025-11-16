extends CanvasLayer

@onready var skill_points_label = $Panel/SkillPointsLabel
@onready var skill_tree_container = $Panel/ScrollContainer/VBoxContainer

var skill_entry_scene = preload("res://scenes/ui/skill_entry.tscn")

func _ready():
	hide()
	# TODO: Connect to player's skill_points changed signal
	update_ui()

func _input(event):
	if event.is_action_pressed("ui_skill_tree"):
		if visible:
			hide()
		else:
			show()
			update_ui()

func update_ui():
	var player = get_tree().get_root().find_child("Player", true, false)
	if player:
		skill_points_label.text = "Skill Points: " + str(player.skill_points)
	
	for child in skill_tree_container.get_children():
		child.queue_free()
	
	# For now, just display some placeholder skills
	var skill1 = Skill.new()
	skill1.skill_name = "Strong Attack"
	skill1.description = "Increases attack power."
	skill1.cost = 1
	
	var skill2 = Skill.new()
	skill2.skill_name = "Fast Movement"
	skill2.description = "Increases movement speed."
	skill2.cost = 1
	
	var skill_entry1 = skill_entry_scene.instantiate()
	skill_tree_container.add_child(skill_entry1)
	skill_entry1.call_deferred("set_skill", skill1)
	
	var skill_entry2 = skill_entry_scene.instantiate()
	skill_tree_container.add_child(skill_entry2)
	skill_entry2.call_deferred("set_skill", skill2)
