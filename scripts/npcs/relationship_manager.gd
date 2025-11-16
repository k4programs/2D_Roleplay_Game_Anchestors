extends Node

var npcs: Array[NPCData] = []

signal relationship_changed(npc: NPCData, new_level: int)
signal heart_event_triggered(npc: NPCData, event_id: String)

func add_npc(npc: NPCData):
	if not npcs.has(npc):
		npcs.append(npc)

func increase_relationship(npc: NPCData, amount: int):
	npc.relationship_level = clampi(npc.relationship_level + amount, 0, 10)
	emit_signal("relationship_changed", npc, npc.relationship_level)
	print("Relationship with " + npc.npc_name + " increased to " + str(npc.relationship_level))
	# TODO: Trigger heart events based on relationship level

func decrease_relationship(npc: NPCData, amount: int):
	npc.relationship_level = clampi(npc.relationship_level - amount, 0, 10)
	emit_signal("relationship_changed", npc, npc.relationship_level)
	print("Relationship with " + npc.npc_name + " decreased to " + str(npc.relationship_level))

func get_relationship_level(npc: NPCData) -> int:
	return npc.relationship_level
