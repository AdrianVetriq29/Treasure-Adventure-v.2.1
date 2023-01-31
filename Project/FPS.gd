extends ColorRect

func _process(delta):
	$FPS.text = str(Engine.get_frames_per_second())
