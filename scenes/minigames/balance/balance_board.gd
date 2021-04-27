extends KinematicBody2D

export var rotation_speed = 0.05;
var rotation_dir = 0

func _ready():
	randomize()
	rotation += [-0.15, 0.15][randi() % 2] * randf()

func _physics_process(delta):
	if Input.is_action_pressed("balance_rotate_left"):
		rotation_dir -= 1
	if Input.is_action_pressed("balance_rotate_right"):
		rotation_dir += 1

	rotation += rotation_dir * rotation_speed * delta
