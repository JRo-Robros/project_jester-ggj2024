class_name pip extends AnimatableBody2D

enum ACTIONS {L_UP, L_LEFT, L_DOWN, L_RIGHT, R_LEFT, R_UP, R_DOWN, R_RIGHT}
const actions = ["l_up", "l_left", "l_down", "l_right", "r_left", "r_up", "r_down", "r_right"]

@export var action: ACTIONS = ACTIONS.L_UP:
	set(value):
		action_name = actions[value]
		action = value
var action_name: String

@onready var keys: Sprite2D = $Keys


func _ready():
	action_name = actions[action]
	keys.frame = action
	print(action_name)
	


