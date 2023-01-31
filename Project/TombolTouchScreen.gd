extends Node2D

func _on_Atas_pressed():
	Input.action_press("lompat")
func _on_Atas_released():
	Input.action_release("lompat")

func _on_Kanan_pressed():
	Input.action_press("gerak_kanan")
func _on_Kanan_released():
	Input.action_release("gerak_kanan")

func _on_Kiri_pressed():
	Input.action_press("gerak_kiri")
func _on_Kiri_released():
	Input.action_release("gerak_kiri")

func _on_Enter_pressed():
	Input.action_press("ui_accept")
func _on_Enter_released():
	Input.action_release("ui_accept")
