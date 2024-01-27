extends Node2D

@onready var active_zone = $"../active_zone"
@onready var ak_lute_flub = $AkLuteFlub

func _ready():
	active_zone.bad_note.connect(flub)
	active_zone.good_note.connect(good)
	active_zone.missed_note.connect(miss)
	
	
func play():
	$AkLuteMusic.post_event()


func flub():
	print('flub')
	ak_lute_flub.post_event()


func good():
	$AkMelodyOn.set_state()


func miss():
	$AkMelodyOff.set_state()
