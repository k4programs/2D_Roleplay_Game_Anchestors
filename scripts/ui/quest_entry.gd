extends VBoxContainer

@onready var name_label = $NameLabel
@onready var description_label = $DescriptionLabel
@onready var objectives_label = $ObjectivesLabel

func set_quest(quest: Quest):
	name_label.text = quest.quest_name
	description_label.text = quest.description
	objectives_label.text = "Objectives:\n" + "\n".join(quest.objectives)
