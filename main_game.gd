extends Node2D

@onready var main_menu = $MainMenu
@onready var loot_game = $with_lute

func _ready():
	main_menu.game_started.connect(start_game)
	
	
func start_game():
	loot_game.start()
