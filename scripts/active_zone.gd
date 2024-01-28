class_name active_zone extends Area2D


@export var is_active:bool = false
@export var score_tracker: Node


var active_pips: Dictionary = {}

func _ready():
	InputManager.action_pressed.connect(handle_press)
	InputManager.action_released.connect(handle_release)


func handle_press(action):
	if not is_active: return
	if active_pips.has(action):
		score_tracker.register_hit()
		active_pips[action].was_hit()
		InputManager.good_note.emit()
	else:
		score_tracker.register_miss()
		InputManager.bad_note.emit()
	

func handle_release(action):
	if not is_active: return


func _on_area_entered(area):
	if not area is pip: return
	active_pips[area.action_name] = area


func _on_area_exited(area):
	if not area is pip: return
	if not area.has_been_hit:
		score_tracker.register_miss()
		area.was_missed()
		InputManager.missed_note.emit()
	active_pips.erase(area.action_name)

