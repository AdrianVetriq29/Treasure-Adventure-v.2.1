extends Control

var rb = 0

func _process(delta):
	if Input.is_action_just_pressed("fullscr"):
		rb = rb + 1
		if rb == 1:
			OS.set_window_fullscreen(true)
		if rb == 2:
			OS.set_window_fullscreen(false)
			rb = 0

func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
