extends Node2D

@onready var enemyScene = preload("res://Alien Attack/scenes/enemy.tscn")
@onready var pathScene = preload("res://Alien Attack/scenes/path_enemy.tscn")

var enemyIndexNumber = 1

signal enemySpawned(enemy_instance)
signal pathEnemySpawned(path_enemy_instance)

@onready var enemyContainer = $EnemyContainer
@onready var spawnPositions = $SpawnPositions

func _on_timer_timeout():
	spawnEnemy()
	pass # Replace with function body.

func spawnEnemy():
	var spawnPositionsArray = spawnPositions.get_children()
	var enemyInstance = enemyScene.instantiate()
	
	enemyInstance.name = "Enemy" + str(enemyIndexNumber)
	enemyInstance.global_position = spawnPositionsArray.pick_random().global_position
	enemyContainer.add_child(enemyInstance)
	
	enemyIndexNumber += 1
	
	emit_signal("enemySpawned", enemyInstance)

func spawnPathEnemy():
	var pathEnemyInstance = pathScene.instantiate()
	enemyContainer.add_child(pathEnemyInstance)
	
	emit_signal("pathEnemySpawned", pathEnemyInstance)

func _on_timer_2_timeout():
	spawnPathEnemy()
