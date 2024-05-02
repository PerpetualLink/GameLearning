extends StaticBody2D

@onready var spawn_pos = $"Spawn Position"

func _ready():
	#print(get_spawn_pos())
	pass

func get_spawn_pos():
	return spawn_pos.global_position
