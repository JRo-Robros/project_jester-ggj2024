extends Node2D

@onready var animation_player: = $AnimationPlayer as AnimationPlayer
@onready var dish_spawn_timer: = $DishSpawnTimer as Timer

@onready var catch_hands = $CatchHands
@onready var high_catch_hands: = $Area2D/HighCatchHands as CollisionShape2D
@onready var middle_catch_hands = $Area2D/MiddleCatchHands as CollisionShape2D
@onready var low_catch_hands = $Area2D/LowCatchHands as CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func bounce_dish(dish: Area2D):
	if dish.has_method("throw"):
		dish.throw()

func catch_low():
	animation_player.play("catch_low")
	low_catch_hands.disabled = false
	middle_catch_hands.disabled = true
	high_catch_hands.disabled = true

func catch_middle():
	animation_player.play("catch_middle")
	low_catch_hands.disabled = true
	middle_catch_hands.disabled = false
	high_catch_hands.disabled = true

func catch_high():
	animation_player.play("catch_high")
	low_catch_hands.disabled = true
	middle_catch_hands.disabled = true
	high_catch_hands.disabled = false

