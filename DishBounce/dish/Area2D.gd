extends Area2D

signal thrown
signal bounced

func throw():
	thrown.emit()

func bounce():
	bounced.emit()
