class_name lutegame extends Node2D
@export var streak_label: Label
@export var percent_label: Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const PIP = preload("res://pip.tscn")

var hit = 0.0
var miss = 0.0
var percent = 0.5
var streak = 0


func _ready():
	animation_player.play('song_1')
	print(streak_label.text)
	var x = $song/pip.position
	var space = 94
	for i in range(0,40):
		var p = PIP.instantiate()
		$song.add_child(p)
		p.position = Vector2(x.x, x.y-space)
		x.y -= space
		

func register_hit():
	hit += 1.0
	streak += 1.0
	streak_label.text = "%s Note Streak" % streak
	percent = (hit / hit + miss)
	var p_string = round(percent * 100)
	percent_label.text = "%s %%" % p_string


func register_miss():
	miss += 1.0
	streak = 0.0
	streak_label.text = "%s Note Streak" % streak
	percent = hit / (hit + miss) 
	var p_string = round(percent * 100)
	percent_label.text = "%s %%" % p_string
