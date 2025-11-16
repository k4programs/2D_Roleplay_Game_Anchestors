extends HBoxContainer

var skill: Skill

@onready var name_label = $NameLabel
@onready var description_label = $DescriptionLabel
@onready var learn_button = $LearnButton

func set_skill(new_skill: Skill):
	skill = new_skill
	name_label.text = skill.skill_name
	description_label.text = skill.description
	learn_button.text = "Learn (" + str(skill.cost) + " SP)"
	update_button()

func _on_learn_button_pressed():
	var player = get_tree().get_root().find_child("Player", true, false)
	if player:
		SkillManager.learn_skill(player, skill)
	update_button()

func update_button():
	var player = get_tree().get_root().find_child("Player", true, false)
	if player:
		learn_button.disabled = player.skill_points < skill.cost or player.learned_skills.has(skill)
	else:
		learn_button.disabled = true
