extends Node2D

@onready var animation_player:AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		animation_player.play("Lute_up")
	elif Input.is_action_just_pressed("ui_down"):
		animation_player.play("Lute_down")
	elif Input.is_action_just_pressed("ui_left"):
		animation_player.play("Lute_left")
	elif Input.is_action_just_pressed("ui_right"):
		animation_player.play("Lute_right")
	elif Input.is_action_just_pressed("ui_accept"):
		animation_player.play("Lute_fail")
