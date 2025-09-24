extends MeshInstance3D
# Movement speed
var speed := 5.0
# To store input direction
var direction := Vector3.ZERO

func _physics_process(delta):
	handle_input()
	move_player(delta)

# Function to check key inputs
func handle_input():
	direction = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_left"):   # ← your text had a line break here
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

# Function to move player
func move_player(delta):
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		translate(direction * speed * delta)
