extends CanvasLayer
signal game_started

var is_active = true

func _input(event):
	if not is_active: return
	if not ( event is InputEventKey or event is InputEventJoypadButton): return
	if event is InputEventKey:
		InputManager.input_type = "keyboard"
	if event is InputEventJoypadButton:
		InputManager.input_type = "joypad"
	game_started.emit()
	is_active = false
	visible = false
