extends CharacterBody2D

signal take_Damage

var speed = 400
var rScene = preload("res://Alien Attack/scenes/rocket.tscn")

#var rocket_container
@onready var rocket_Container = get_node("Rocket Container")

func _ready():
	#rocket_container = get_node("Rocket Container")
	pass

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	velocity = Vector2(0,0);
	
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	
	#if (global_position.x < 0):
		#global_position.x = 0
	#if (global_position.y < 0):
		#global_position.y = 0
	#if (global_position.x > screen_size.x):
		#global_position.x = 1280
	#if (global_position.y > screen_size.y):
		#global_position.y = 720
		
	#global_position.x = clampf(global_position.x, 0, screen_size.x)
	#global_position.y = clampf(global_position.y, 0, screen_size.y)
	
	global_position = global_position.clamp(Vector2(0,0), screen_size)
	#print(global_position)
	
func shoot():
	var rocket_instance = rScene.instantiate()
	rocket_Container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 75
	$"Rocket Shot".play()

func takeDamage():
	emit_signal("take_Damage")
	
func die():
	queue_free()
