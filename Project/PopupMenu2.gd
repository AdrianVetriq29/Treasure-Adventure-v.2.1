extends CenterContainer

onready var tween = $Tween
var is_paused = false setget set_is_paused

func _ready():
	pass

func muncul():
	tween.interpolate_property(self, "rect_position:y", -130, 56, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	tween.start()
	
func _process(delta):
	if Input.is_action_just_pressed("game_menu"):
		muncul()
		self.is_paused = !is_paused

func _on_TmblRestart_pressed():
	self.is_paused = false
	SceneManager.change_scene("res://Level2.tscn")
	
func _on_TmblMenu_pressed():
	self.is_paused = false
	SceneManager.change_scene("res://Title.tscn")

func _on_TmblResume_pressed():
	self.is_paused = false

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
