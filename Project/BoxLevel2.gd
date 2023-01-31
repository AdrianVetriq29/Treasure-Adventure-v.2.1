extends Node2D

func _on_1_pressed():
	SceneManager.change_scene("res://Level1.tscn")
	$Control/SuaraTombol.play()


func _on_2_pressed():
	SceneManager.change_scene("res://Level2.tscn")
	$Control/SuaraTombol.play()


func _on_3_pressed():
	SceneManager.change_scene("res://Level3.tscn")
	$Control/SuaraTombol.play()


func _on_Back_pressed():
	SceneManager.change_scene("res://Title.tscn")
	$Control/SuaraTombol.play()
