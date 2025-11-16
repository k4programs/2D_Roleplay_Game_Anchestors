extends CanvasLayer

@onready var minimap_texture = $Panel/MinimapTexture

func _ready():
	MapManager.connect("map_changed", Callable(self, "_on_map_changed"))
	update_minimap()

func _on_map_changed(new_map: Map):
	update_minimap()

func update_minimap():
	if MapManager.current_map and MapManager.current_map.minimap_texture:
		minimap_texture.texture = MapManager.current_map.minimap_texture
	else:
		minimap_texture.texture = null
