extends Node2D

signal finished

@export var hud: Hud
var is_active = false:
	set(value):
		$HandL.monitoring = value
		$HandR.monitoring = value
		visible = value
		is_active = value
var r_or_l = true
@onready var dish_bounce = $"../DishBounce"
@onready var right = $RtoL
@onready var left = $LtoR
@onready var ball_spawner = $Timer
@onready var hand_r = $HandR
@onready var hand_l = $HandL
@onready var round_timer = $RoundTimer
const JUGGLE_JOY = preload("res://assets/juggle-inst-joy.png")
const JUGGLE_KEY = preload("res://assets/juggle-instruct.png")

func _ready():
	InputManager.action_pressed.connect(handle_press)
	InputManager.input_type_changed.connect(input_type_change)
	round_timer.timeout.connect(stop)
	

func start():
	InputManager.juggle_intro.emit()
	$CanvasLayer.visible = true
	await get_tree().create_timer(2.0).timeout
	await get_tree().create_timer(3.0).timeout
	InputManager.juggle_music.emit()
	$CanvasLayer.visible = false
	round_timer.start(31)
	ball_spawner.start()
	is_active = true
	


func stop():
	ball_spawner.stop()
	is_active = false
	finished.emit()
	dish_bounce.start()

func throw():
	InputManager.throw.emit()
	r_or_l = not r_or_l
	var type = [0,1,2,3].pick_random() if r_or_l else [4,5,6,7].pick_random()
	var b = Ball.new(type, r_or_l)
	if r_or_l:
		right.add_child(b)
		return
	left.add_child(b)
	

func handle_press(action: String):
	if not is_active: return
	if action.begins_with('l_'):
		var pips = hand_l.get_overlapping_areas()
		for i in pips:
			if i.action < 4:
				if action == i.action_name:
					i.was_hit()
					hud.register_hit()
					InputManager.catch.emit()
					InputManager.good_note.emit()
				else:
					hud.register_miss()
					InputManager.bad_note.emit()
	if action.begins_with("r_"):
		var pips = hand_r.get_overlapping_areas()
		for i in pips:
			if i.action > 3:
				if action == i.action_name:
					i.was_hit()
					hud.register_hit()
					InputManager.catch.emit()					
					InputManager.good_note.emit()
				else:
					hud.register_miss()
					InputManager.bad_note.emit()


func _on_hand_r_area_exited(area):
	if area.has_been_hit: return
	if area.action > 3:
		area.was_missed()
		hud.register_miss()
		InputManager.missed_note.emit()


func _on_hand_l_area_exited(area: pip):
	if area.has_been_hit: return
	if area.action < 4:
		area.was_missed()
		hud.register_miss()
		InputManager.missed_note.emit()
		
func input_type_change(v):
	$keys.visible = v == "keyboard"
	$CanvasLayer/Control/MarginContainer/PanelContainer/VBoxContainer/TextureRect.texture = JUGGLE_KEY if v == 'keyboard' else JUGGLE_JOY
