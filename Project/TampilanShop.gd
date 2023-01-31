extends CanvasLayer

func _on_Back_pressed():
	get_node("AnimationPlayer").play("TransOut")
	get_tree().paused = false


func _on_BeliPedang_pressed():
	GameSignal.emit_signal("item_bought", 10, "koin", "pedang")
	get_node("AnimationPlayer").play("TransOut")
	get_tree().paused = false


func _on_BeliPistol_pressed():
	GameSignal.emit_signal("item_bought", 3, "diamond", "pistol")
	get_node("AnimationPlayer").play("TransOut")
	get_tree().paused = false


func _on_BeliAK_pressed():
	GameSignal.emit_signal("item_bought", 1, "reddiamond", "rifle")
	get_node("AnimationPlayer").play("TransOut")
	get_tree().paused = false


func _on_BeliRedPotion_pressed():
	GameSignal.emit_signal("beli_ramuan", 5, "koin")
	get_node("AnimationPlayer").play("TransOut")
	get_tree().paused = false
