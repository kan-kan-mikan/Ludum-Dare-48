extends Node

func _on_Breathing_game_over_total():
	$TransitionScene.fade_to_black()

func _on_TransitionScene_transitioned():
	get_tree().change_scene_to(load("res://scenes/scene_manager.tscn"))	
