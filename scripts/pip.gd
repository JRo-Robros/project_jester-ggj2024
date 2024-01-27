@tool
class_name pip extends Area2D
@onready var particles = $CPUParticles2D
@onready var keys = $Keys

enum ACTIONS {L_UP, L_LEFT, L_DOWN, L_RIGHT, R_LEFT, R_UP, R_DOWN, R_RIGHT}
const actions = ["l_up", "l_left", "l_down", "l_right", "r_left", "r_up", "r_down", "r_right"]

var has_been_hit = false

@export var action: ACTIONS = ACTIONS.L_UP:
	set(value):
		action_name = actions[value]
		action = value
		$Keys.frame = action
var action_name: String = "l_up"


func was_missed():
	keys.modulate = Color(1, 0.2, 0.2, 1)


func was_hit():
	keys.modulate = Color(0.2, 1, 0.2, 1)
	has_been_hit = true
	particles.emitting = true
	


