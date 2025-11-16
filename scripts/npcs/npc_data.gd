extends Resource
class_name NPCData

@export var npc_name: String = ""
@export var relationship_level: int = 0 # 0-10 hearts
@export var preferences: Array[Item] = [] # Items the NPC likes
