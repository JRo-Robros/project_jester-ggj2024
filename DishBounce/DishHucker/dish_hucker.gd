class_name DishHucker
extends Node2D

@onready var animation_player: = $AnimationPlayer as AnimationPlayer
@onready var dish_spawn_marker: = $DishSpawnPos as Marker2D
@export var dish_scene: PackedScene

signal thrown(dish: Dish)

func _ready():
	animation_player.play("idle")

func throw_animation():
	animation_player.play("throw")

func huck_dish():
	var dish: Dish = dish_scene.instantiate() as Dish
	get_parent().add_child(dish)
	dish.global_position = dish_spawn_marker.global_position
	thrown.emit(dish)
