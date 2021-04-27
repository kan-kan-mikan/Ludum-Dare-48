extends Node2D

signal transitioned

func fade_to_black():
	$CanvasLayer/AnimationPlayer.play("fade_to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitioned")
		$CanvasLayer/AnimationPlayer.play("fade_to_normal")
