extends Node2D

onready var health_progress = $CanvasLayer/HealthBar/TextureProgress
onready var jumlah_koin = $CanvasLayer/CoinBar/Label
onready var jumlah_diamond = $CanvasLayer/DiamondBar/Label
onready var jumlah_reddiamond = $CanvasLayer/RedDiamondBar/Label
onready var hero = $Hero
onready var pedang = $Pedang


func _on_Hero_hero_apdet_health(value):
	health_progress.value = value

func _on_Hero_hero_apdet_koin(value):
	jumlah_koin.text = String(value)
	
func _on_Hero_hero_apdet_peti(value):
	jumlah_koin.text = String(value)
	
func _on_Hero_hero_apdet_diamond(value):
	jumlah_diamond.text = String(value)

func _on_Hero_hero_apdet_reddiamond(value):
	jumlah_reddiamond.text = String(value)

func _on_Pedang_body_entered(body):
	if body.name == 'Hero':
		pedang.queue_free()
		hero.ambil_pedang()

func _on_Hero_hero_apdet_darah(value):
	health_progress.value = value
