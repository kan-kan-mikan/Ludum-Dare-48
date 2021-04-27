extends KinematicBody2D

signal game_over_pong

export var defaultSpeed = 100
var velocity = Vector2()
var speed = defaultSpeed

func _ready():
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)

	if collision_object:
		velocity = velocity.bounce(collision_object.normal)

func stop_ball():
	speed = 0

func restart_ball():
	position = Vector2(1250, 360)
	speed = defaultSpeed 
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]

func _on_Game_Over_Trigger_body_entered(body):
	if body.name == "Ball":
		game_over()

func game_over():
	emit_signal("game_over_pong")

	reset_game()

func reset_game():
	restart_ball()
