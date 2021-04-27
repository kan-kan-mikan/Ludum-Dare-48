extends RigidBody2D

signal game_over_balance

var ball = preload("res://scenes/minigames/balance/balance_ball.tscn")

func _on_GameOver_body_entered(body):
	if body.name == "Ball":
		emit_signal("game_over_balance")

	reset_game()

func reset_game():
	position = Vector2(640, 50)
