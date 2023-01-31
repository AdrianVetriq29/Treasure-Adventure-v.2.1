extends Area2D

func _on_Koin_body_entered(body):
	
	var _efekkoin = preload("res://EfekKoin.tscn")
	var efekoin = _efekkoin.instance()
	efekoin.transform = self.transform
	get_tree(). current_scene.add_child(efekoin)
	
	remove_from_group("GrupKoin")
	if body.name == 'Hero':
		body.ambil_koin()	
	queue_free()
