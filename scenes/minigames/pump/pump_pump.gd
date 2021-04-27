extends Node2D

var pump_up = preload("res://assets/minigames/pump/pump_up.png")
var pump_down = preload("res://assets/minigames/pump/pump_down.png")

func _process(delta):
	if Input.is_action_just_pressed("pump_press_pump"):
		$Sprite.set_texture(pump_down)
	if Input.is_action_just_released("pump_press_pump"):
		$Sprite.set_texture(pump_up)
