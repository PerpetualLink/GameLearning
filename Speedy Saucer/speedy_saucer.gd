extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_maze_body_exited(body):
	get_tree().reload_current_scene()
	pass # Replace with function body.
