extends Area2D

func _on_Diamond_body_entered(body):
	if body.name == 'Hero':
		body.ambil_diamond()
	var _efekdiamond = preload ("res://Efek Diamond.tscn")
	var efekdiamond = _efekdiamond.instance()
	efekdiamond.transform = self.transform
	get_tree(). current_scene.add_child(efekdiamond)
	queue_free()
