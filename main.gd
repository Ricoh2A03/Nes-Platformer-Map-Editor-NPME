extends Node

@onready var tile_map_layer: TileMapLayer = $MapEditor/TileMapLayer
@onready var map_editor = $MapEditor

var mouse_pos: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: mouse_pos = event.position

func _process(delta: float) -> void:
	if (mouse_pos.x > map_editor.position.x):
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			tile_map_layer.set_cell(tile_map_layer.local_to_map(mouse_pos - map_editor.global_position), 0, Vector2(6, 1), 0)
		elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			tile_map_layer.erase_cell(tile_map_layer.local_to_map(mouse_pos - map_editor.global_position))
