extends RigidBody2D

var force = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	#apply_impulse(Vector2(25, 0))
	pass
	#print("First")
	#print("Second")
	#print("Third")
		

func _process(delta):
	#print(Engine.get_frames_per_second())
	pass

func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0, -force))
	elif Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, force))
	elif Input.is_action_pressed("move_left"):
		apply_force(Vector2(-force, 0))
	elif Input.is_action_pressed("move_right"):
		apply_force(Vector2(force, 0))

#func add(a, b):
	#return a + b

#func test():
	#var t = 10
	#return (t+10)
	#print("Test");
	#print(10)
	#print(10,3589)
	# + - / * **
	#print(5**2)
	#var name = "steve"
	#const otherName = 20
	#print("name: " + name)
	#print("Const Value: ", otherName)
