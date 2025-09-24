extends Area3D

@onready var mesh = $MeshInstance3D
var velocity = Vector3.ZERO

func _ready():
	# Assign random direction on start
	velocity = Vector3(randf() * 2 - 1, 0, randf() * 2 - 1).normalized() * 2
	connect("area_entered", Callable(self, "_on_area_entered"))
func _physics_process(delta):
	translate(velocity * delta)
	rotate_y(1.5 * delta)
	
	for other_area in get_overlapping_areas():
		if other_area != self:
			_on_area_entered(other_area)

	# Simple boundary check (bounce off walls)
	if abs(position.x) > 5:
		velocity.x *= -1
	if abs(position.z) > 5:
		velocity.z *= -1

func _on_area_entered(area: Area3D):
	# Change color of self
	mesh.material_override = StandardMaterial3D.new()
	mesh.material_override.albedo_color = Color.from_hsv(randf(), 1.0, 1.0)
	
	# Change color of collided sphere
	var other_mesh = area.get_node_or_null("MeshInstance3D")
	if other_mesh:
		other_mesh.material_override = StandardMaterial3D.new()
		other_mesh.material_override.albedo_color = Color.from_hsv(randf(), 1.0, 1.0)
