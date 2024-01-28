class_name DishBounceGame
extends Node2D


@export var hud: Hud

@onready var minigame_timer: = $MinigameTimer as Timer
@onready var dish_spawn_timer: = $DishSpawnTimer as Timer
@onready var dish_bounce_jester = $DishBounceJester

@onready var dish_hucker_1: = $DishHucker1 as DishHucker
@onready var dish_hucker_2: = $DishHucker2 as DishHucker
@onready var dish_hucker_3: = $DishHucker3 as DishHucker
@onready var percent_label = %PercentLabel

var mood: float = 1
var hits: float = 0
var misses: float = 0
	

func start():
	visible = true
	dish_spawn_timer.start()
	minigame_timer.start()
	InputManager.dish_music.emit()

func stop():
	visible = false
	dish_spawn_timer.stop()
	hud.end_screen()

func watch_dish(dish: Dish):
	dish.bounced.connect(register_hit)
	dish.broke.connect(register_miss)

func register_hit():
	hud.register_hit()
	hits += 1
	update_jester_mood()

func register_miss():
	hud.register_miss()
	misses += 1
	update_jester_mood()

func update_jester_mood():
	mood = hits / (hits + misses)
	dish_bounce_jester.set_mood(mood)

func throw_random_dish():
	dish_spawn_timer.start()
	
	var dish_path: int = [0, 1, 2].pick_random()
	if dish_path == 0:
		dish_hucker_1.throw_animation()
	elif dish_path == 1:
		dish_hucker_2.throw_animation()
	else:
		dish_hucker_3.throw_animation()
