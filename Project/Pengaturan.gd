extends Node2D

func _on_Back_pressed():
	SceneManager.change_scene("res://Title.tscn")
	$Control/SuaraTombol.play()
