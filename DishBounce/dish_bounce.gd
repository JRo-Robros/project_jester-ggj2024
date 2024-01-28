extends Node2D

@onready var dish_spawn_timer: = $DishSpawnTimer as Timer

@onready var dish_hucker_1: = $DishHucker1 as DishHucker
@onready var dish_hucker_2: = $DishHucker2 as DishHucker
@onready var dish_hucker_3: = $DishHucker3 as DishHucker


func throw_random_dish():
	dish_spawn_timer.start()
	
	var dish_path: int = [0, 1, 2].pick_random()
	if dish_path == 0:
		dish_hucker_1.huck_dish()
	elif dish_path == 1:
		dish_hucker_2.huck_dish()
	else:
		dish_hucker_3.huck_dish()