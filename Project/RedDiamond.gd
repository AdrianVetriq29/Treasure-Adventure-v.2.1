extends Area2D

func _on_RedDiamond_body_entered(body):
	if body.name == 'Hero':
		body.ambil_reddiamond()
	var _efekreddiamond = preload("res://Efek Diamond.tscn")
	var efekreddiamond = _efekreddiamond.instance()
	efekreddiamond.transform = self.transform
	get_tree().current_scene.add_child(efekreddiamond)
	queue_free()
