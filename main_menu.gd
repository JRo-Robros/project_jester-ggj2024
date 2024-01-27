extends CanvasLayer
signal game_started

var is_active = true

func _input(event):
	if not is_active: return
	if event is InputEventKey:
		InputManager.input_type = "keyboard"
		game_started.emit()
		is_active = false
		visible = false
	if event is InputEventJoypadButton:
		InputManager.input_type = "joypad"
		is_active = false
		visible = false
