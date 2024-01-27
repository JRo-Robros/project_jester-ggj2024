class_name active_zone extends Area2D

@export var is_active:bool = false

var active_pips: Dictionary = {}

func _ready():
	InputManager.action_pressed.connect(handle_press)
	InputManager.action_released.connect(handle_release)


func handle_press(action):
	if not is_active: return
	print('Pressed ', action)
	print(active_pips)
	if active_pips.has(action):
		active_pips[action].queue_free()
	

func handle_release(action):
	if not is_active: return
	print('Released ', action)


func _on_body_entered(body):
	if not body is pip: return
	active_pips[body.action_name] = body
	

func _on_body_exited(body):
	if not body is pip: return
	active_pips.erase(body.action_name)
