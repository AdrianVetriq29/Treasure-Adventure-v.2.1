extends StaticBody2D

func _ready():
	$BukaPeti.visible = false
	$TutupPeti.visible = true

func _on_Kunci_peti_terbuka():
	$BukaPeti.visible = true
	$TutupPeti.visible = false

