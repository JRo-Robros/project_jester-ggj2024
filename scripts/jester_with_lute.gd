class_name lutegame extends Node2D

@export var streak_label: Label
@export var percent_label: Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var active_zone = $active_zone

var hit = 0.0
var miss = 0.0
var percent = 0.5
var streak = 0


func start():
	visible = true
	animation_player.play('song_1')
	await get_tree().create_timer(0.5).timeout
	active_zone.is_active = true

func stop():
	visible = false
	active_zone.is_active = false

func register_hit():
	hit += 1.0
	streak += 1.0
	streak_label.text = "%s Note Streak" % streak
	percent = hit / (hit + miss)
	var p_string = round(percent * 100)
	percent_label.text = "%s %%" % p_string


func register_miss():
	miss += 1.0
	streak = 0.0
	streak_label.text = "%s Note Streak" % streak
	percent = hit / (hit + miss)
	var p_string = round(percent * 100)
	percent_label.text = "%s %%" % p_string
