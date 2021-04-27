extends KinematicBody2D


export var speed = 100;

func _ready():
	# reset to center of the screen
	var screen = get_viewport_rect().size
	position.y = screen.y/2
	position.x = 50

func _physics_process(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("pong_move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("pong_move_down"):
		velocity.y += 1

	move_and_slide(velocity * speed)
	position.x = 50
