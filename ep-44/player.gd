extends CharacterBody3D

# Player movement variables
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAVITY = 9.8

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction (WASD or arrow keys)
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Apply horizontal movement
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		# Slow down when not moving
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	# Move the player and handle collisions
	move_and_slide()
