extends Area3D

@export var rotate_speed_deg: float = 90.0

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	rotate_y(deg_to_rad(rotate_speed_deg) * delta)
func _on_body_entered(body: Node) -> void:
	if body is CharacterBody3D:
		if Game != null:
			Game.add_score(1)
		if has_node("PickupSFX") and $PickupSFX.stream != null:
			$PickupSFX.play()
		hide()
		await get_tree().create_timer(0.3).timeout
		queue_free()
