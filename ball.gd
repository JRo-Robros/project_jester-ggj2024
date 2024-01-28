class_name Ball extends PathFollow2D

const ball_tex = preload("res://assets/ball.png")
var speed: float = 300.0
const PIP = preload("res://pip.tscn")

func _init( piptype = 0, upside_down = true):
	speed += randf() * 150
	loop = false
	rotates = false
	if upside_down: rotation_degrees = 180
	var s = Sprite2D.new()
	s.texture = ball_tex
	add_child(s)
	var p = PIP.instantiate()
	add_child(p)
	p.action = piptype


func _process(delta):
	progress += delta * speed
	
