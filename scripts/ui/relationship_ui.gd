extends CanvasLayer

@onready var npc_list_container = $Panel/ScrollContainer/VBoxContainer

var relationship_entry_scene = preload("res://scenes/ui/relationship_entry.tscn")

func _ready():
	hide()
	RelationshipManager.connect("relationship_changed", Callable(self, "_on_relationship_changed"))
	update_ui()

func _input(event):
	if event.is_action_pressed("ui_relationship"):
		if visible:
			hide()
		else:
			show()
			update_ui()

func update_ui():
	for child in npc_list_container.get_children():
		child.queue_free()
	
	for npc_data in RelationshipManager.npcs:
		var entry = relationship_entry_scene.instantiate()
		entry.set_npc_data(npc_data)
		npc_list_container.add_child(entry)

func _on_relationship_changed(npc: NPCData, new_level: int):
	if visible:
		update_ui()
