extends KinematicBody2D

signal game_over_flappy

export var flap_strength = 300
export var max_fall_speed = 100
export var gravity = 10

var movement = Vector2()
var wall = preload("res://scenes/minigames/flappy/flappy_wall.tscn")

func _physics_process(delta):
	movement.y += gravity

	if movement.y > max_fall_speed:
		movement.y = max_fall_speed

	if Input.is_action_just_pressed("flappy_jump"):
		movement.y -= flap_strength

	movement = move_and_slide(movement, Vector2(0,1))

	# make sure player cant go outside of the viewport
	var screen = get_viewport_rect().size

	if position.y < 0:
		position.y = 0
		movement.y = 0
	
	if position.y > 720:
		position.y = 720

func spawn_wall():
	var wall_instance = wall.instance()
	wall_instance.position = Vector2(2500, rand_range(280, 440))
	get_parent().call_deferred("add_child", wall_instance)

func game_over():
	emit_signal("game_over_flappy")

	reset_game()

func reset_game():
	position = Vector2(640, 360)

func _on_Reset_body_entered(body):
	if body.name == "Wall":
		body.queue_free()
		spawn_wall()

func _on_Detect_body_entered(body):
	if body.name == "Wall":
		game_over()
