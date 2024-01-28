extends Node2D

@onready var ak_lute_flub = $AkLuteFlub

func _ready():
	InputManager.bad_note.connect(flub)
	InputManager.good_note.connect(good)
	InputManager.missed_note.connect(miss)
	
	
func play():
	$AkLuteMusic.post_event()


func flub():
	print('flub')
	ak_lute_flub.post_event()


func good():
	$AkMelodyOn.set_state()


func miss():
	$AkMelodyOff.set_state()
