class_name Hud extends CanvasLayer

@export var king: King
@export var jester: Node

var hit = 0.0
var miss = 0.0
var percent = 0.5:
	set(value):
		%KingLabel.text = "The King is Amused!!" if value > 0.6 else "The King is NOT Amused."
		jester.set_mood(value)
		king.set_mood(value)
		percent = value
var streak = 0:
	set(value):
		if value > best_streak: best_streak = value
		streak = value
var best_streak = 0:
	set(value):
		new_best(value)
		best_streak = value


func register_hit():
	hit += 1.0
	streak += 1.0
	percent = hit / (hit + miss)
	var p_string = round(percent * 100)
	%PercentLabel.text = "%s %%" % p_string


func register_miss():
	miss += 1.0
	streak = 0.0
	percent = hit / (hit + miss)
	var p_string = round(percent * 100)
	%PercentLabel.text = "%s %%" % p_string


func new_best(value):
	%BestLabel.text = "Best Streak %s" % value


func end_screen():
	visible = true;
	if percent > 0.6:
		InputManager.victory.emit()
	else:
		InputManager.fail.emit()
