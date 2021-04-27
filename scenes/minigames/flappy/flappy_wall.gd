extends StaticBody2D

export var speed = 5

func _process(delta):
	position += Vector2(-speed, 0)
