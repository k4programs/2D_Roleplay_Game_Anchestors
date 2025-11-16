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
	# Assuming Player is a global singleton or accessible
	SkillManager.learn_skill(Player, skill)
	update_button()

func update_button():
	# Assuming Player is a global singleton or accessible
	learn_button.disabled = Player.skill_points < skill.cost or Player.learned_skills.has(skill)
