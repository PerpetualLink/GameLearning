extends Node2D

@export var lives = 3

@onready var score = 0

@onready var player = $Player
@onready var hud = $UI/Hud

@onready var gameOverScene = preload("res://Alien Attack/scenes/game_over_screen.tscn")

func _ready():
	hud.setScoreLabel(score)

func _on_area_2d_area_entered(area):
	area.queue_free()
	pass # Replace with function body.


func _on_player_take_damage():
	lives -= 1
	$"Player Take Damage".play()
	hud.onRemoveLife(lives)
	if lives == 0:
		player.die()
		
		await get_tree().create_timer(1).timeout
		
		var gameOverInstance = gameOverScene.instantiate()
		gameOverInstance.setScore(score)
		$UI.add_child(gameOverInstance)
		


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	pass # Replace with function body.

func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance):
	path_enemy_instance.enemy.connect("died", _on_enemy_died)

func _on_enemy_died():
	$"Enemy Hit Sound".play()
	score += 100
	hud.setScoreLabel(score)
