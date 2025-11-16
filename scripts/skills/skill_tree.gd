extends Resource
class_name SkillTree

@export var skills: Dictionary = {} # Dictionary of skill_name: Skill
@export var connections: Dictionary = {} # Dictionary of skill_name: Array[connected_skill_name]
