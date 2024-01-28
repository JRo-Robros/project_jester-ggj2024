class_name lutegame extends Node2D

@export var hud: Hud

@onready var juggle = $"../juggle"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var active_zone = $active_zone
@onready var luteshake = $luteshake
var is_active = false:
	set(value):
		if(value):
			start()
		else:
			stop()
		is_active = value

const PIP = preload("res://pip.tscn")


func _ready():
	active_zone.score_tracker = hud

func start():
	InputManager.lute_intro.emit()
	$CanvasLayer.visible = true
	await get_tree().create_timer(3).timeout
	await get_tree().create_timer(4).timeout
	$CanvasLayer.visible = false
	visible = true
	animation_player.play('song_1')
	animation_player.animation_finished.connect(finished)

	var x = $song/pip.position
	$song/pip.action = [0,1,2,3,4,5,6,7].pick_random()
	var space = 94
	for i in range(0,30):
		var p = PIP.instantiate()
		$song.add_child(p)
		p.action = [0,1,2,3,4,5,6,7].pick_random()
		p.position = Vector2(x.x, x.y-space)
		x.y -= space
		
	await get_tree().create_timer(0.5).timeout
	active_zone.is_active = true

func stop():
	visible = false
	active_zone.is_active = false
	active_zone.monitoring = false
	active_zone.monitorable = false


func finished(anim):
	if not anim == "song_1": return
	is_active = false
	juggle.start()
	


	luteshake.play('shake')
