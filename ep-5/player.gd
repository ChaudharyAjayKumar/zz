extends CharacterBody3D

@export var speed: float = 6.0
@export var jump_strength: float = 9.0
@export var gravity: float = 24.0

func _physics_process(delta: float) -> void:
	var dir := Vector3.ZERO
	# WASD input
	if Input.is_action_pressed("move_forward"): dir.z -= 1
	if Input.is_action_pressed("move_back"): dir.z += 1
	if Input.is_action_pressed("move_left"): dir.x -= 1
	if Input.is_action_pressed("move_right"): dir.x += 1
	# Arrow keys fallback
	if Input.is_action_pressed("ui_up"): dir.z -= 1
	if Input.is_action_pressed("ui_down"): dir.z += 1
	if Input.is_action_pressed("ui_left"): dir.x -= 1
	if Input.is_action_pressed("ui_right"): dir.x += 1

	dir = dir.normalized()
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed

	# Gravity + Jump
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("ui_accept"):
		velocity.y = jump_strength

	move_and_slide()
