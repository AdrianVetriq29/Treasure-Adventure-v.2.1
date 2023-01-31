extends Area2D

func _on_RamuanDarah_body_entered(body):
	if body.name == 'Hero':
		body.ambil_ramuandarah()
		$SuaraPotion.play()
	var _efekdiamond = preload ("res://Efek Diamond.tscn")
	var efekdiamond = _efekdiamond.instance()
	efekdiamond.transform = self.transform
	get_tree(). current_scene.add_child(efekdiamond)
	queue_free()


