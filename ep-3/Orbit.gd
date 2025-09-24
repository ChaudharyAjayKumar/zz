extends Camera3D

@export var target: Node3D
@export var orbit_speed: float = 1.0
var angle: float = 0.0
var radius: float = 20.0
var height: float = 10.0

func _process(delta):
	if target:
		angle += orbit_speed * delta
		var x = target.global_position.x + radius * cos(angle)
		var z = target.global_position.z + radius * sin(angle)
		global_position = Vector3(x, height, z)
		look_at(target.global_position, Vector3.UP)
