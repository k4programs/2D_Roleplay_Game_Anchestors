extends Node

enum Season {
	SPRING,
	SUMMER,
	AUTUMN,
	WINTER
}

var current_time: float = 0.0 # 0.0 to 24.0 (hours)
var current_day: int = 1
var current_season: Season = Season.SPRING
var current_year: int = 1

@export var day_length_in_seconds: float = 60.0 # A day lasts 60 seconds

signal time_updated(hour: int)
signal day_updated(day: int)
signal season_updated(season: Season)
signal year_updated(year: int)

func _process(delta):
	current_time += delta * (24.0 / day_length_in_seconds)
	
	if current_time >= 24.0:
		current_time -= 24.0
		current_day += 1
		emit_signal("day_updated", current_day)
		
		if current_day > 28: # 28 days per season (Stardew Valley style)
			current_day = 1
			current_season = (current_season + 1) % Season.size()
			emit_signal("season_updated", current_season)
			
			if current_season == Season.SPRING: # New year starts with spring
				current_year += 1
				emit_signal("year_updated", current_year)
	
	emit_signal("time_updated", int(current_time))

func get_current_hour() -> int:
	return int(current_time)

func get_current_season_name() -> String:
	match current_season:
		Season.SPRING: return "Spring"
		Season.SUMMER: return "Summer"
		Season.AUTUMN: return "Autumn"
		Season.WINTER: return "Winter"
	return "Unknown"
