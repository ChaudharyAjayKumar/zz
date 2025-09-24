extends XRCamera3D

@export var speed := 2.0
@export var rotation_speed := 0.02

func _process(delta):
	# Forward/Backward movement
	if Input.is_action_pressed("ui_up"):
		translate(Vector3(0, 0, -speed * delta))
	if Input.is_action_pressed("ui_down"):
		translate(Vector3(0, 0, speed * delta))

	# Rotation with left/right arrows
	if Input.is_action_pressed("ui_left"):
		rotate_y(rotation_speed)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-rotation_speed)
