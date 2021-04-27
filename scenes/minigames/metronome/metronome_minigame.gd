extends Node2D

signal game_over_metronome

export var reticule_speed = 256
export var target_spawn_range_min = 256
export var target_spawn_range_max = 1024

var reticule_in_target

func _ready():
	randomize()
	reticule_in_target = false

func _process(delta):
	if Input.is_action_just_pressed("metronome_select"):
		check_if_hit_target()

	$Reticule.position.x += reticule_speed * delta

func check_if_hit_target():
	if reticule_in_target:
		reset_game()

func reset_game():
	$Reticule.position.x = 0
	$Target.position.x = rand_range(target_spawn_range_min, target_spawn_range_max)
	
func game_over():
	emit_signal("game_over_metronome")

func _on_Target_body_entered(body):
	reticule_in_target = true

func _on_Target_body_exited(body):
	reticule_in_target = false

func _on_DeathTrigger_body_entered(body):
	if body.name == "Reticule":
		game_over()
		reset_game()
