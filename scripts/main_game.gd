extends Node2D

@onready var main_menu = $MainMenu
@onready var lute_game = $with_lute
@onready var juggle = $juggle


func _ready():
	main_menu.game_started.connect(start_game)
	
	
func start_game():
	lute_game.start()
