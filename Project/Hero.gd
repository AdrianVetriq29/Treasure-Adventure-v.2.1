extends KinematicBody2D

var laju_cepat = 200
var laju_normal = 120
var laju = laju_normal
var kecepatan = Vector2.ZERO
var laju_lompat = -380
var gravitasi = 12
var koin = 0
var diamond = 0
var reddiamond = 0
var sedang_terluka = false
var health_maks = 100
var health = 100

var pistol = preload("res://Pistol.tscn")
var rifle = preload("res://Rifle.tscn")
var sword = preload("res://Sword.tscn")
var partikel_hero = preload("res://PartikelHero.tscn")

onready var sprite = $Sprite

signal hero_mati
signal hero_menang
signal hero_apdet_health(value)
signal hero_apdet_koin(value)
signal hero_apdet_peti(value)
signal hero_apdet_diamond(value)
signal hero_apdet_reddiamond(value)
signal hero_apdet_darah(value)

func _ready():
	GameSignal.connect("item_bought", self, "beli_item")
	GameSignal.connect("beli_ramuan", self, "beli_potion")

func _physics_process(delta):
	kecepatan.y = kecepatan.y + gravitasi
	
	if(not sedang_terluka and Input.is_action_pressed("gerak_kanan")):
		kecepatan.x = laju
	if(not sedang_terluka and Input.is_action_pressed("gerak_kiri")):
		kecepatan.x = -laju
	if(not sedang_terluka and Input.is_action_pressed("lompat") and is_on_floor()):
		keluarkan_partikel("lompat")
		$SuaraLompat.play()
		kecepatan.y = laju_lompat
	if(not sedang_terluka and Input.is_action_pressed("lari_cepat")):
		lari_cepat()
		
	var kecepatan_jatuh = kecepatan.y
		
	kecepatan.x = lerp(kecepatan.x, 0, 0.1)
	kecepatan = move_and_slide(kecepatan, Vector2.UP)
	
	if kecepatan.y - kecepatan_jatuh < -gravitasi:
		keluarkan_partikel("jatuh")
	
	if not sedang_terluka:
		update_animasi()
	
func update_animasi():
	if is_on_floor():
		if kecepatan.x < (laju * 0.5) and kecepatan.x > (-laju * 0.5):
			sprite.play("Diam")
		else:
			if laju == laju_normal:
				sprite.play("Lari")
			elif laju == laju_cepat:
				sprite.play("LariCepat")
	else:
		if kecepatan.y > 0:
			# jatuh
			sprite.play("Jatuh")
		else:
			# lompat
			sprite.play("Lompat")	
	$WeaponContainer.scale.x = 1
	sprite.flip_h = false
	if kecepatan.x < 0:
		$WeaponContainer.scale.x = -1
		sprite.flip_h = true
		
	
func lari_cepat():
	laju = laju_cepat
	$Timer.start()
	
func _on_Timer_timeout():
	laju = laju_normal

func ambil_koin():
	koin = koin + 1
#	print(" KOIN: ", koin)
	emit_signal("hero_apdet_koin", koin)
	$SuaraKoin.play()
	# cek jumlah koin
	var grup_koin = get_tree().get_nodes_in_group("GrupKoin")
	var jumlah_koin = grup_koin.size()
	print(" GRUP KOIN: ", grup_koin)
	print(" JUMLAH: ", jumlah_koin)
	# kalau habis, panggil signal hero_menang
	if jumlah_koin == 0:
		pass
		
func ambil_peti():
	koin = koin + 20
	var grup_peti = get_tree().get_nodes_in_group("GrupPeti")
	var dapatkan_peti = grup_peti.size()
#	print( " KOIN: ", koin)
	emit_signal("hero_apdet_peti", koin)
	if dapatkan_peti:
		emit_signal("hero_menang")
	
func ambil_diamond():
	diamond = diamond + 1
#	print(" DIAMOND: ", diamond)
	emit_signal("hero_apdet_diamond", diamond)
	$SuaraDiamond.play()
	
func ambil_reddiamond():
	reddiamond = reddiamond + 1
#	print(" RED DIAMOND :", reddiamond)
	emit_signal("hero_apdet_reddiamond", reddiamond)
	$SuaraRedDiamond.play()
	
func ambil_ramuandarah():
	health += 100
	if health >100:
		health = 100
	emit_signal("hero_apdet_darah", (float(health)+float(health_maks)) * 100)
	
func terluka():
	sedang_terluka = true
	$SuaraTerluka.play()
	health -= 10
	emit_signal("hero_apdet_health", (float(health)/float(health_maks)) * 100)
	
	if kecepatan.x > 0:
		kecepatan.x = -300
	else:
		kecepatan.x = 300
		
	sprite.play("Terluka")
	yield(get_tree().create_timer(0.5), "timeout")
	
	if health <= 0:
		mati()
	else:
		sedang_terluka = false
		
func mati():
	sprite.play("mati")
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(2, false)
	yield(get_tree().create_timer(0.5), "timeout")
	emit_signal("hero_mati")
	
func keluarkan_partikel(jenis):
	var _partikel_hero = partikel_hero.instance()
	_partikel_hero.play(jenis)
	_partikel_hero.flip_h = sprite.flip_h
	_partikel_hero.global_position = global_position
	get_tree().current_scene.add_child(_partikel_hero)

func _on_Sprite_frame_changed():
	if sprite.animation == "Lari" and sprite.frame == 2:
		keluarkan_partikel("lari")

func stop_function():
	pass

func _on_TerkenaBatu_body_entered(body):
	if body.name == 'Hero':
		terluka()
	
func beli_item(harga, currency, senjata):
	if  "pistol":
		if currency == "koin":
			if koin >= harga:
				koin = koin -10
				emit_signal("hero_apdet_koin", koin)
				!$WeaponContainer.get_children().empty()
				$WeaponContainer.remove_child($WeaponContainer.get_children()[0])
				yield(get_tree().create_timer(0.5), "timeout")
				$WeaponContainer.add_child(sword.instance())
				
				
		elif currency == "diamond":
			if diamond >= harga:
				diamond = diamond -3
				emit_signal("hero_apdet_diamond", diamond)
				!$WeaponContainer.get_children().empty()
				$WeaponContainer.remove_child($WeaponContainer.get_children()[0])
				yield(get_tree().create_timer(0.5), "timeout")
				$WeaponContainer.add_child(pistol.instance())
				
				
		elif currency == "reddiamond":
			if reddiamond >= harga:
				reddiamond = reddiamond -1
				emit_signal("hero_apdet_reddiamond", reddiamond)
				!$WeaponContainer.get_children().empty()
				$WeaponContainer.remove_child($WeaponContainer.get_children()[0])
				yield(get_tree().create_timer(0.5), "timeout")
				$WeaponContainer.add_child(rifle.instance())
				
func beli_potion(harga, currency):
	if currency == "koin":
		if koin >= harga:
			koin = koin -5
			emit_signal("hero_apdet_koin", koin)
			ambil_ramuandarah()

func _on_TerkenaBatuBesar_body_entered(body):
	if body.name == 'Hero':
		terluka()
		
