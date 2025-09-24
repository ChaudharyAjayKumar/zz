extends PathFollow3D

@export var normal_speed: float = 2.0
@export var boost_speed: float = 8.0
@export var high_speed: float = 12.0

@onready var sphere = $Sphere
@onready var sound = $AudioStreamPlayer3D

var current_speed := normal_speed
var is_boosting := false
var is_high_speed := false
var is_stopped := false

func _input(event):
	# BOOST: Enter / ui_accept
	if event.is_action_pressed("ui_accept"):
		is_boosting = true
		is_high_speed = false
		is_stopped = false
		current_speed = boost_speed
		sound.play()
		_set_glow(1.5)

	elif event.is_action_released("ui_accept"):
		is_boosting = false
		current_speed = normal_speed
		_set_glow(0.0)

	# STOP: 'S' key or ui_down
	if event.is_action_pressed("ui_down"):
		is_stopped = true
		is_boosting = false
		is_high_speed = false
		current_speed = 0.0
		sound.stop()
		_set_glow(0.0)

	# HIGH SPEED: 'H' key
	if event.is_action_pressed("h"):
		is_high_speed = true
		is_boosting = false
		is_stopped = false
		current_speed = high_speed
		sound.play()
		_set_glow(2.5)

func _set_glow(energy: float):
	var mat = sphere.get_active_material()
	if mat and mat.has_parameter("emission_energy"):
		mat.set("emission_energy", energy)

func _process(delta):
	progress += current_speed * delta
	if progress_ratio >= 1.0:
		progress = 0.0
	look_at(transform.origin + -transform.basis.z, Vector3.UP)
