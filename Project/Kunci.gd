extends StaticBody2D

signal peti_terbuka

var is_open = false
var ambil_kunci = false
var di_zona_peti = false

func _on_Area2D_body_entered(body: PhysicsBody2D):
	if ambil_kunci == false:
		$SuaraKunci.play()
		ambil_kunci = true
		$Sprite.queue_free()
		
func _process(delta):
	if ambil_kunci == true:
		if di_zona_peti == true:
				$SuaraPetiTerbuka.play()
				print("peti_terbuka")
				emit_signal("peti_terbuka")

func _on_ZonaPeti_body_entered(body: PhysicsBody2D):
	if is_open == false:
		print(ambil_kunci)
		if body.name == 'Hero' and ambil_kunci == true:
			is_open = true
			emit_signal("peti_terbuka")
			body.ambil_peti()
			$SuaraPetiTerbuka.play()
			print(di_zona_peti)
			
func _on_ZonaPeti_body_exited(body):
	di_zona_peti = false
	print(di_zona_peti)


func _on_ZonaPeti2_body_entered(body):
	if is_open == false:
		print(ambil_kunci)
		if body.name == 'Hero' and ambil_kunci == true:
			is_open = true
			emit_signal("peti_terbuka")
			body.ambil_peti()
			$SuaraPetiTerbuka.play()
			print(di_zona_peti)
	
	
func _on_ZonaPeti2_body_exited(body):
	di_zona_peti = false
	print(di_zona_peti)


func _on_ZonaPeti3_body_entered(body):
	if is_open == false:
		print(ambil_kunci)
		if body.name == 'Hero' and ambil_kunci == true:
			is_open = true
			emit_signal("peti_terbuka")
			body.ambil_peti()
			$SuaraPetiTerbuka.play()
			print(di_zona_peti)


func _on_ZonaPeti3_body_exited(body):
	di_zona_peti = false
	print(di_zona_peti)
