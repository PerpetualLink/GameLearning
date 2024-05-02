extends Node2D

var player = null

@export var next_level: PackedScene = null
@export var level_time = 30
@export var is_final_level: bool = false

# @onready var player = $player
@onready var Start = $Environment/Start
@onready var exit = $Environment/Exit
@onready var deathZone = $DeathZone
@onready var hud = $UILayer/Timer
@onready var uiLayer = $UILayer

var timer_node = null
var time_left = null

var win = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = Start.get_spawn_pos()
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		#trap.connect("touched_player", _on_trap_touched_player)
		trap.touched_player.connect(_on_trap_touched_player)
	exit.body_entered.connect(_on_exit_body_entered)
	deathZone.body_entered.connect(_on_death_zone_body_entered)

	time_left = level_time
	timer_node = Timer.new()
	timer_node.name = "Level Timer"
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timeout)
	add_child(timer_node)
	timer_node.start()
	
	hud.setTimeLabel(time_left)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mm_quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("mm_reset"):
		get_tree().reload_current_scene()

func _on_level_timeout():
	time_left -= 1
	hud.setTimeLabel(time_left)
	if time_left <= 0 && !win:
		resetPlayer()
		time_left = 5

func _on_death_zone_body_entered(body):
	resetPlayer()
	pass # Replace with function body.

func _on_trap_touched_player():
	resetPlayer()
	pass # Replace with function body.

func _on_exit_body_entered(body):
	if body is Player:
		exit.animate()
		win = true
		if is_final_level || (next_level != null):
			await get_tree().create_timer(0.5).timeout
			if is_final_level:
				uiLayer.show_win_screen(true)
			else:
				get_tree().change_scene_to_packed(next_level)
	pass

func resetPlayer():
	AudioPlayer.play_sfx("hurt")
	player.velocity = Vector2.ZERO
	player.global_position = Start.get_spawn_pos()
