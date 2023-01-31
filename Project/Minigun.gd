extends Node2D

var peluru = preload("res://Peluru.tscn")
var bisa_menembak = true

func _process(delta):
	if Input.is_action_pressed("serang") and bisa_menembak:
		bisa_menembak = false
		$Sfx.play()
		$AnimationPlayer.play("Fire")
		var p = peluru.instance()
		p.position = $SpawnPoint.global_position
		get_parent().add_child(p)
		

func _on_AnimationPlayer_animation_finished(anim_name):
	bisa_menembak = true
