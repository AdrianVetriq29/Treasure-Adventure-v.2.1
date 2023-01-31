extends Area2D

func _on_StarShop_body_entered(body):
	if body.name == "Hero":
		get_tree().paused = true
		get_node("TampilanShop/AnimationPlayer").play("Transin")


