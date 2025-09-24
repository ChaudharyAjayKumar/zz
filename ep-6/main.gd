extends Node3D

var time := 0.0

# Make sure node names match your scene tree
@onready var left_hand = $XROrigin3D/lefthand
@onready var right_hand = $XROrigin3D/righthand

func _ready():
	print("Left Hand Node:", left_hand)
	print("Right Hand Node:", right_hand)

func _process(delta):
	time += delta
	var move_amplitude = 1.5
	var float_amplitude = 0.2

	# Horizontal hand motion
	left_hand.position.x = -move_amplitude * cos(time)
	right_hand.position.x = move_amplitude * cos(time)

	# Vertical float (up-down)
	left_hand.position.y = 1.0 + sin(time * 2.0) * float_amplitude
	right_hand.position.y = 1.0 + cos(time * 2.0) * float_amplitude

	# Forward/back z-motion (optional)
	left_hand.position.z = -1.0 + sin(time * 1.5) * 0.3
	right_hand.position.z = -1.0 + cos(time * 1.5) * 0.3
