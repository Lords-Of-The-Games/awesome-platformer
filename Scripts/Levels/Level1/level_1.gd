extends Node2D

@onready var player_camera := get_node("Player/Camera")
@onready var camera_bounds := get_node("CameraBounds/CameraBoundsCollision")

func _ready():
	var shape = camera_bounds.shape
	var rect = Rect2(camera_bounds.global_position - shape.extents, shape.extents * 2)

	player_camera.limit_left = rect.position.x
	player_camera.limit_top = rect.position.y
	player_camera.limit_right = rect.position.x + rect.size.x
	player_camera.limit_bottom = rect.position.y + rect.size.y
