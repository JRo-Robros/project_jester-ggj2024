extends Node2D

## To animate the jester, first set the mood between 0 and 1 with set_mood(),
## then call one of the lute methods.
## Shocked face shows when lute_fail is called, then switches back to mood
## Face while playing normally

@onready var animation_player := $AnimationPlayer as AnimationPlayer
@onready var faces := $Body/Head/Faces as Sprite2D

#@export var debug_mood: float

@export var okay_mood: float = 0.5
@export var good_mood: float = 0.7

@export var fail_face: int
@export var oof_face: int
@export var okay_face: int
@export var good_face: int

# changes from 0 to 1 for 0 to 100% accuracy
var _mood: float = 1

func set_mood(m: float):
	_mood = m
	update_face()

func update_face():
	if _mood > good_mood:
		faces.frame = good_face
	elif _mood > okay_mood:
		faces.frame = okay_face
	else:
		faces.frame = oof_face

func lute_left():
	animation_player.play("Lute_left")
	update_face()

func lute_right():
	animation_player.play("Lute_right")
	update_face()

func lute_up():
	animation_player.play("Lute_up")
	update_face()

func lute_down():
	animation_player.play("Lute_down")
	update_face()

func lute_fail():
	animation_player.play("Lute_fail")
	faces.frame = fail_face

## Called when the node enters the scene tree for the first time.
#func _ready():
	#set_mood(debug_mood)
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if Input.is_action_just_pressed("ui_up"):
		#lute_up()
	#elif Input.is_action_just_pressed("ui_down"):
		#lute_down()
	#elif Input.is_action_just_pressed("ui_left"):
		#lute_left()
	#elif Input.is_action_just_pressed("ui_right"):
		#lute_right()
	#elif Input.is_action_just_pressed("ui_accept"):
		#lute_fail()

