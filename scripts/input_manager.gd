extends Node
signal good_note
signal bad_note
signal missed_note
signal action_pressed
signal action_released

var input_type = "keyboard"

func _process(delta):
	if Input.is_action_just_pressed("l_up"):
		action_pressed.emit('l_up')
		
	if Input.is_action_just_pressed("l_down"):
		action_pressed.emit('l_down')
	
	if Input.is_action_just_pressed("l_left"):
		action_pressed.emit('l_left')
		
	if Input.is_action_just_pressed("l_right"):
		action_pressed.emit('l_right')
		
	if Input.is_action_just_pressed("r_up"):
		action_pressed.emit('r_up')
	
	if Input.is_action_just_pressed("r_down"):
		action_pressed.emit('r_down')

	if Input.is_action_just_pressed("r_left"):
		action_pressed.emit('r_left')
	
	if Input.is_action_just_pressed("r_right"):
		action_pressed.emit('r_right')

	if Input.is_action_just_released("l_up"):
		action_released.emit('l_up')
		
	if Input.is_action_just_released("l_down"):
		action_released.emit('l_down')
	
	if Input.is_action_just_released("l_left"):
		action_released.emit('l_left')
		
	if Input.is_action_just_released("l_right"):
		action_released.emit('l_right')
		
	if Input.is_action_just_released("r_up"):
		action_released.emit('r_up')
	
	if Input.is_action_just_released("r_down"):
		action_released.emit('r_down')

	if Input.is_action_just_released("r_left"):
		action_released.emit('r_left')
	
	if Input.is_action_just_released("r_right"):
		action_released.emit('r_right')
