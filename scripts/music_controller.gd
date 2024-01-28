extends Node2D

@onready var ak_lute_flub = $AkLuteFlub

func _ready():
	InputManager.bad_note.connect(flub)
	InputManager.good_note.connect(good)
	InputManager.missed_note.connect(miss)
	InputManager.play_title.connect(play_title)
	InputManager.stop_title.connect(stop_title)
	InputManager.lute_intro.connect(lute_intro)
	InputManager.juggle_intro.connect(juggle_intro)
	InputManager.juggle_music.connect(juggle_music)
	InputManager.throw.connect(throw)
	InputManager.catch.connect(catch)
	InputManager.victory.connect(victory)
	InputManager.fail.connect(fail)	
	
func play():
	$AkLuteMusic.post_event()


func flub():
	print('flub')
	ak_lute_flub.post_event()


func good():
	$AkMelodyOn.set_state()


func miss():
	$AkMelodyOff.set_state()

func play_title():
	$AkTitle.post_event()

func stop_title():
	$AkTitle.queue_free()

func lute_intro():
	$AkLuteIntro.post_event()

func juggle_intro():
	$AkJuggleIntro.post_event()

func juggle_music():
	$AkJuggleMusic.post_event()

func throw():
	$AkWhoosh.post_event()

func catch():
	$AkCatch.post_event()

func victory():
	$AkVictory.post_event()

func fail():
	$AkFail.post_event()
	
