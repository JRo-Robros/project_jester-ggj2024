class_name DishHucker
extends Node2D

# Dish hucker throws a dish on command
# TODO: Select a random scene from a set

@onready var dish_scene_spawn_pos: = $dish_sceneSpawnPos as Marker2D
@export var dish_scene: PackedScene

func huck_dish():
	var dish: Node2D = dish_scene.instantiate() as Node2D
	dish.global_position = dish_scene_spawn_pos.global_position
	if dish.has_method("throw"):
		dish.throw()
	else:
		print("Error:", name, " cannot huck this at the jester.")
