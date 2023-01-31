extends Area2D

var direction = 1
var speed = 300

func _physics_process(delta):
	position += Vector2(direction,0) * delta * speed
	$AnimationPlayer.play("hilang")
	
func hilang():
	queue_free()
