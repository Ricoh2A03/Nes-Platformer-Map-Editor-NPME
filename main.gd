extends Node

@onready var tile_map_layer: TileMapLayer = $MapEditor/TileMapLayer
@onready var map_editor = $MapEditor

var mouse_pos: Vector2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: mouse_pos = event.position

func _process(delta: float) -> void:
	if (mouse_pos.x > map_editor.position.x) and (mouse_pos.y > map_editor.position.y):
		if Input.is_action_just_pressed("mouse_wheel_up"):
			tile_map_layer.scale += Vector2(0.1, 0.1)
		elif Input.is_action_just_pressed("mouse_wheel_down"):
			tile_map_layer.scale -= Vector2(0.1, 0.1)

		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			tile_map_layer.set_cell(tile_map_layer.local_to_map((mouse_pos - map_editor.global_position) - tile_map_layer.scale), 0, Vector2(6, 1), 0)
		elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			tile_map_layer.erase_cell(tile_map_layer.local_to_map((mouse_pos - map_editor.global_position) - tile_map_layer.scale))
