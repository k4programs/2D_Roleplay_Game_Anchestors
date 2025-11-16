extends CanvasLayer

@onready var active_quests_container = $Panel/TabContainer/ActiveQuests/VBoxContainer
@onready var completed_quests_container = $Panel/TabContainer/CompletedQuests/VBoxContainer

var quest_entry_scene = preload("res://scenes/ui/quest_entry.tscn")

func _ready():
	hide()
	QuestManager.connect("quest_added", Callable(self, "_on_quest_added"))
	QuestManager.connect("quest_completed", Callable(self, "_on_quest_completed"))

func _input(event):
	if event.is_action_pressed("ui_quest_log"):
		if visible:
			hide()
		else:
			show()
			update_ui()

func update_ui():
	for child in active_quests_container.get_children():
		child.queue_free()
	for child in completed_quests_container.get_children():
		child.queue_free()
	
	for quest in QuestManager.active_quests:
		var quest_entry = quest_entry_scene.instantiate()
		quest_entry.set_quest(quest)
		active_quests_container.add_child(quest_entry)
	
	for quest in QuestManager.completed_quests:
		var quest_entry = quest_entry_scene.instantiate()
		quest_entry.set_quest(quest)
		completed_quests_container.add_child(quest_entry)

func _on_quest_added(quest: Quest):
	if visible:
		update_ui()

func _on_quest_completed(quest: Quest):
	if visible:
		update_ui()
