class_name DishHucker
extends Node2D

# Dish hucker throws a dish on command
# TODO: Select a random scene from a set

@onready var dish_spawn_marker: = $DishSpawnPos as Marker2D
@export var dish_scene: PackedScene

func huck_dish():
	var dish: Node2D = dish_scene.instantiate() as Node2D
	get_parent().add_child(dish)
	dish.global_position = dish_spawn_marker.global_position
	print("A dish hath been hucked")
