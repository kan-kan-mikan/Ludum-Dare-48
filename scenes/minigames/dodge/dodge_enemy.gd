extends Node2D

export var speed = 3

func _process(delta):
	position += Vector2(0, speed)
