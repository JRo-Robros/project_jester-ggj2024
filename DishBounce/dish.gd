extends Node2D

# Set this when the dish spawns. If it drops below this level it shatters.
# (Different based on where the dish is spawned on the screen)
@export var break_y: float
@export var start_velocity: Vector2 # pixels per tick
@export var gravity: float # pixels per tick

signal bounced
signal broke

var velocity: Vector2

# Jester's hands throw anything that touches them
# Dish huckers call throw on dishes they spawn
func throw():
	velocity = start_velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.y < break_y:
		broke.emit()
		## TODO visual effects
	else:
		velocity.y -= gravity
		global_position += velocity
