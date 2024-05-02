extends ParallaxBackground

@export var scrollSpeed = 15
@export var bg_texture: CompressedTexture2D = preload("res://Martian Mike/assets/textures/bg/Brown.png")
@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	sprite.region_rect.position += delta * Vector2(0, -scrollSpeed)
