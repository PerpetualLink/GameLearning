extends Area2D

@export var speed = 500

#@onready var visible_notifier = $VisibleNotifier

func _ready():
	#visible_notifier.connect("screen_exited", _onscreen_exited)
	pass
	
func _physics_process(delta):
	global_position.x += speed * delta
	#print(delta)


func _onscreen_exited():
	#queue_free() # Replace with function body.
	pass


func _on_visible_notifier_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_area_entered(area):
	queue_free()
	area.die()
	pass # Replace with function body.
