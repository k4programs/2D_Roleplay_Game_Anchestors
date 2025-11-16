extends CanvasLayer

@onready var time_label = $Panel/TimeLabel
@onready var season_label = $Panel/SeasonLabel

func _ready():
	TimeManager.connect("time_updated", Callable(self, "_on_time_updated"))
	TimeManager.connect("season_updated", Callable(self, "_on_season_updated"))
	update_ui()

func _on_time_updated(hour: int):
	update_ui()

func _on_season_updated(season: TimeManager.Season):
	update_ui()

func update_ui():
	time_label.text = "Time: " + str(TimeManager.get_current_hour()).pad_zeros(2) + ":00"
	season_label.text = "Season: " + TimeManager.get_current_season_name()
