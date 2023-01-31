extends Node2D

var slash = true

func _process(delta):
	if Input.is_action_just_pressed("serang") and slash:
		slash = false
		$Sfx.play()
		$AnimationPlayer.play("Attack")
		

func _on_AnimationPlayer_animation_finished(anim_name):
	slash = true
