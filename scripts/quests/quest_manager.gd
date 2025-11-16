extends Node

var active_quests: Array[Quest] = []
var completed_quests: Array[Quest] = []

signal quest_added(quest: Quest)
signal quest_completed(quest: Quest)

func add_quest(quest: Quest):
	if not active_quests.has(quest) and not completed_quests.has(quest):
		quest.status = Quest.QuestStatus.ACTIVE
		active_quests.append(quest)
		emit_signal("quest_added", quest)
		print("Quest added: " + quest.quest_name)

func complete_quest(quest: Quest):
	if active_quests.has(quest):
		active_quests.erase(quest)
		quest.status = Quest.QuestStatus.COMPLETED
		completed_quests.append(quest)
		emit_signal("quest_completed", quest)
		print("Quest completed: " + quest.quest_name)
		# TODO: Add rewards to player inventory
