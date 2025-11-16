extends Node2D

@export var npc_data: NPCData

@onready var interactable = $Interactable

func _ready():
	interactable.connect("interacted", Callable(self, "_on_interacted"))

func _on_interacted():
	var quest = Quest.new()
	quest.quest_name = "Finde den verlorenen Gegenstand"
	quest.description = "Jemand hat einen wichtigen Gegenstand verloren. Finde ihn!"
	quest.objectives = ["Finde den Gegenstand", "Bringe den Gegenstand zurück zum NPC"]
	
	QuestManager.add_quest(quest)

	var dialog_end = Dialog.new()
	dialog_end.character_name = "NPC"
	dialog_end.text = "Auf Wiedersehen!"

	var choice2 = DialogChoice.new()
	choice2.text = "Ich muss gehen."
	choice2.next_dialog = dialog_end

	var choice1 = DialogChoice.new()
	choice1.text = "Wie geht es dir?"
	choice1.next_dialog = dialog_end # For simplicity, both choices lead to the same end for now

	var dialog_start = Dialog.new()
	dialog_start.character_name = "NPC"
	dialog_start.text = "Hallo! Was kann ich für dich tun? Ich habe eine Quest für dich!"
	dialog_start.choices = [choice1, choice2]
	
	DialogManager.show_dialog(dialog_start)
