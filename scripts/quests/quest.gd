extends Resource
class_name Quest

enum QuestStatus {
	NOT_STARTED,
	ACTIVE,
	COMPLETED
}

@export var quest_name: String = ""
@export var description: String = ""
@export var objectives: Array[String] = []
@export var rewards: Array[Item] = []
@export var status: QuestStatus = QuestStatus.NOT_STARTED
