extends Area2D

signal died
@export var speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position.x += -speed * delta

func die():
	queue_free()
	emit_signal("died")


func _on_body_entered(body):
	body.takeDamage()
	die()
