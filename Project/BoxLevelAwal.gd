extends Node2D


func _ready():
	if Glob.is_level2_unlocked:
		$"Control/2/Lock-padlock-symbol-for-protectIcon-iconscom56926".visible = false
		
	else:
		$"Control/2/Lock-padlock-symbol-for-protectIcon-iconscom56926".visible = true
		$"Control/2".disabled = true
		
	if Glob.is_level3_unlocked:
		$"Control/3/Lock-padlock-symbol-for-protectIcon-iconscom56927".visible = false
		
	else:
		$"Control/3/Lock-padlock-symbol-for-protectIcon-iconscom56927".visible = true
		$"Control/3".disabled = true

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
