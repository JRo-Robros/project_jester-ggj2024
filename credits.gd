extends CanvasLayer

const MAIN_GAME = preload("res://main_game.tscn")

func _on_again_pressed():
	get_tree().change_scene_to_packed(MAIN_GAME)


func _on_quit_pressed():
	get_tree().quit()
