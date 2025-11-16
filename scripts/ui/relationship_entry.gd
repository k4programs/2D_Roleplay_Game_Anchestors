extends HBoxContainer

@onready var name_label = $NameLabel
@onready var heart_texture = $HeartTexture

func set_npc_data(npc_data: NPCData):
	name_label.text = npc_data.npc_name
	# TODO: Update heart_texture based on npc_data.relationship_level
