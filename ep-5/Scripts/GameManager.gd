extends Node

var score: int = 0
var hud: Node = null

func _ready() -> void:
	# Wait one frame so HUD is definitely in the scene tree
	await get_tree().process_frame
	hud = get_tree().get_first_node_in_group("hud")
	if hud == null:
		print("Warning: HUD not found in scene!")
	_update_hud()

func add_score(points: int) -> void:
	score += points
	_update_hud()
	print("Score Updated:", score)

func reset_score() -> void:
	score = 0
	_update_hud()

func _update_hud() -> void:
	# Only call set_score if HUD exists and method exists
	if hud != null and hud.has_method("set_score"):
		hud.set_score(score)
