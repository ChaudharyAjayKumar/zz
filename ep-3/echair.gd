extends Node3D

@export var rotation_speed: float = 30.0  # degrees/sec

func _process(delta):
	rotate_y(deg_to_rad(rotation_speed * delta))
