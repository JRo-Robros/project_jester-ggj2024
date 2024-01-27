extends Node2D

@export var chuckle_mood: float
@export var laugh_mood: float
@export var guffaw_mood: float

@onready var animation_player = $AnimationPlayer

var _mood: float = 0.7

func set_mood(m: float):
	if m > guffaw_mood:
		guffaw()
	elif m > laugh_mood:
		laugh()
	elif m > chuckle_mood:
		chuckle()
	else:
		frown()

func frown():
	animation_player.play("frown")

func chuckle():
	animation_player.play("chuckle")

func laugh():
	animation_player.play("laugh")

func guffaw():
	animation_player.play("guffaw")
