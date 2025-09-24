extends CanvasLayer

@onready var score_label: Label = $"MarginContainer/ScoreLabel"

func _ready() -> void:
	add_to_group("hud")  # This is critical
	set_score(0)

func set_score(value: int) -> void:
	if score_label != null:
		score_label.text = "Score: %d" % value
