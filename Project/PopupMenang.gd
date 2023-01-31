extends CenterContainer

onready var tween = $Tween

var sudah_muncul = false

func _ready():
	pass
	
func muncul():
	tween.interpolate_property(self, "rect_position:y", -130, 56, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	tween.start()

func _on_Hero_hero_menang():
	Glob.is_level2_unlocked = true
	muncul()
	$SuaraMenang.play()

func _on_TmblSelanjutnya_pressed():
	SceneManager.change_scene("res://BoxLevelAwal.tscn")
	$VBoxContainer/SuaraTombol.play()
