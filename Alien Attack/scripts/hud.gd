extends Control

@onready var score = $score

@onready var lives = [$LifeTextureRect, $LifeTextureRect2, $LifeTextureRect3]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setScoreLabel(newScore):
	score.text = "Score: " + str(newScore)

func onRemoveLife(livesLeft):
	lives[livesLeft].queue_free()
