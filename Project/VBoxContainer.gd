extends VBoxContainer

func _on_TombolMulai_pressed():
	SceneManager.change_scene("res://BoxLevelAwal.tscn")
	$SuaraTombol.play()

func _on_TombolQuit_pressed():
	get_tree().quit()
	$SuaraTombol.play()


func _on_TombolTentang_pressed():
	SceneManager.change_scene("res://Tentang.tscn")
	$SuaraTombol.play()


func _on_Button_pressed():
	SceneManager.change_scene("res://Pengaturan.tscn")
	$SuaraTombol.play()
