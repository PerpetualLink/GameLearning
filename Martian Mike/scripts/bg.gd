extends ParallaxBackground

@export var scrollSpeed = 15
@export var bg_texture: CompressedTexture2D = preload("res://Martian Mike/assets/textures/bg/Blue.png")
@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	sprite.region_rect.position += delta * Vector2(scrollSpeed, scrollSpeed)
	if sprite.region_rect.position >= Vector2(64, 64):
		sprite.region_rect.position = Vector2.ZERO
	#print(sprite.region_rect.position)
