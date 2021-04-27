extends KinematicBody2D

signal game_over_dodge

# magic numbers for player positioning
var left_pos = 1280 / 3
var right_pos = 1280/ 3 * 2

var enemy = preload("res://scenes/minigames/dodge/dodge_enemy.tscn")

func _ready():
	position.x = left_pos

func _process(delta):
	if Input.is_action_just_pressed("dodge_move_right"):
		position.x = right_pos
	if Input.is_action_just_released("dodge_move_right"):
		position.x = left_pos

func spawn_enemy():
	var enemy_instance = enemy.instance()
	enemy_instance.position = Vector2([left_pos, right_pos][randi() % 2], -300)
	get_parent().call_deferred("add_child", enemy_instance)

func game_over():
	emit_signal("game_over_dodge")

func _on_Reset_body_entered(body):
	if body.name == "Enemy":
		body.queue_free()
		spawn_enemy()

func _on_Detect_body_entered(body):
	if body.name == "Enemy":
		game_over()
		body.free()
