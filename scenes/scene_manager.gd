extends Node

var in_game = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and !in_game:
		$TransitionScene.fade_to_black()

func _on_TransitionScene_transitioned():
	get_tree().change_scene_to(load("res://scenes/main_level.tscn"))
	in_game = true

