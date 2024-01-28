extends Node2D

@onready var main_menu = $MainMenu
@onready var lute_game = $with_lute
@onready var juggle = $juggle

@onready var dish_bounce = $DishBounce
@onready var jester = $Jester
const CREDITS = preload("res://credits.tscn")


func _ready():
	main_menu.game_started.connect(start_game)
	InputManager.play_title.emit()
	
func start_game():
	InputManager.stop_title.emit()
	lute_game.start()


func _on_juggle_finished():
	jester.visible = false


func _on_quit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	$hud/Control/MarginContainer/PanelContainer/MarginContainer/TextureRect.show()
	%KingLabel.hide()
	%PercentLabel.hide()
	%BestLabel.hide()