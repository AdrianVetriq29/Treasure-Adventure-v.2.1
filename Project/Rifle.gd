extends Node2D

var peluru = preload("res://Peluru.tscn")
var bisa_menembak = true

func _process(delta):
	if Input.is_action_pressed("serang") and bisa_menembak:
		bisa_menembak = false
		$AnimationPlayer.play("Fire")
		$sfx.play()
		var p = peluru.instance()
		p.position = get_parent().global_position
		p.direction = get_parent().scale.x
		get_tree().current_scene.add_child(p)
		

func _on_AnimationPlayer_animation_finished(anim_name):
	bisa_menembak = true
