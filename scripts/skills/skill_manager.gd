extends Node

var player_skill_tree: SkillTree
var companion_skill_trees: Dictionary = {} # Dictionary of companion_name: SkillTree

func _ready():
	# TODO: Load skill trees from files
	pass

func learn_skill(target, skill: Skill):
	if target is Player:
		if target.skill_points >= skill.cost:
			target.skill_points -= skill.cost
			target.learned_skills.append(skill)
			print("Player learned skill: " + skill.skill_name)
		else:
			print("Not enough skill points to learn skill: " + skill.skill_name)
	elif target is Companion:
		if target.skill_points >= skill.cost:
			target.skill_points -= skill.cost
			target.learned_skills.append(skill)
			print("Companion learned skill: " + skill.skill_name)
		else:
			print("Not enough skill points to learn skill: " + skill.skill_name)
