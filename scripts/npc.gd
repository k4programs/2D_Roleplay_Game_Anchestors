extends Node2D

@export var npc_data: NPCData

@onready var interactable = $Interactable

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))
	if npc_data:
		RelationshipManager.add_npc(npc_data)

func _on_interacted():
	if npc_data and npc_data.dialog_tree:
		DialogManager.show_dialog(npc_data.dialog_tree)
	else:
		print("No dialog tree found for this NPC.")
