class_name Dish
extends Node2D

# Set this when the dish spawns. If it drops below this level it shatters.
# (Different based on where the dish is spawned on the screen)
@export var break_x: float = 1500
@export var start_velocity: Vector2 # pixels per tick
@export var gravity: float # pixels per tick

@onready var sprite_2d: = $Sprite2D as Sprite2D

signal bounced
signal broke

var hit: bool = false

var velocity: Vector2 = Vector2(0,0)

func _ready():
	sprite_2d.frame = randi_range(0,8)
	throw()

# Jester's hands throw anything that touches them
# Dish huckers call throw on dishes they spawn
func throw():
	velocity = start_velocity

func bounce():
	velocity = start_velocity
	hit = true
	bounced.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.x > break_x:
		if not hit:
			broke.emit()
			InputManager.dish_break.emit()
		queue_free()
	else:
		velocity.y += gravity * delta
		global_position += velocity * delta
