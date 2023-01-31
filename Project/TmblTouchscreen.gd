extends Node2D


func _on_Kanan_pressed():
	Input.action_press("gerak_kanan")
func _on_Kanan_released():
	Input.action_release("gerak_kanan")


func _on_Kiri_pressed():
	Input.action_press("gerak_kiri")
func _on_Kiri_released():
	Input.action_release("gerak_kiri")


func _on_Lompat_pressed():
	Input.action_press("lompat")
func _on_Lompat_released():
	Input.action_release("lompat")


func _on_Enter_pressed():
	Input.action_press("serang")
func _on_Enter_released():
	Input.action_release("serang")


func _on_Lari_pressed():
	Input.action_press("lari_cepat")
func _on_Lari_released():
	Input.action_release("lari_cepat")


func _on_Menu_pressed():
	Input.action_press("game_menu")
func _on_Menu_released():
	Input.action_press("game_menu")
