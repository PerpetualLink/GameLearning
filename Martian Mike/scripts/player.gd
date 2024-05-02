extends CharacterBody2D
class_name Player

@export var grav = 400
@export var runSpeed = 500
@export var jumpForce = 200
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	pass
	#if Input.is_action_just_pressed("mm_move_right"):
		#animated_sprite.play("run")

func _physics_process(delta):
	
	if !is_on_floor():
		velocity.y += grav * delta
		if velocity.y > 800:
			velocity.y = 800
	
	if Input.is_action_just_pressed("mm_jump") && is_on_floor():
		jump(jumpForce)
		animated_sprite.play("jump")
		
	var direction = Input.get_axis("mm_move_left", "mm_move_right")
	
	update_animations(direction)
	velocity.x = runSpeed * direction
	move_and_slide()
	
func jump(force):
	AudioPlayer.play_sfx("jump")
	velocity.y = -force
	
func update_animations(direction):
	if direction != 0 && velocity.y == 0:
		animated_sprite.flip_h = (direction == -1)
		animated_sprite.play("run")
	elif velocity.y < 0:
		animated_sprite.play("Jump")
	elif velocity.y > 0:
		animated_sprite.play("fall")
	else:
		animated_sprite.play("idle")	
