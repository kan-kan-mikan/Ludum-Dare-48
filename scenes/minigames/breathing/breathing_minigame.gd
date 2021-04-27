extends Node

signal game_over_total

var air
var stress

var is_breathing_in
var is_breathing_out

var is_game_over = false

func _ready():
	air = 0
	stress = 0
	is_breathing_in = false
	is_breathing_out = false

func _process(delta):
	if Input.is_action_pressed("breathe") and air < $UI/AirBar.max_value:
		breathingIn(delta)

	if Input.is_action_just_released("breathe") and air > $UI/AirBar.min_value:
		breathingOut()

	# change air
	if is_breathing_in:
		air += 40 * delta
	else:
		air -= 30 * delta

	# change stress
	if is_breathing_out:
		stress -= 3 * delta
	else:
		stress += delta

	# cap at max values
	if air > $UI/AirBar.max_value:
		air = $UI/AirBar.max_value
		$UI/Instruction.set_text("Now Breathe Out.")
	if stress > $UI/StressBar.max_value:
		game_over()

	if air < $UI/AirBar.min_value:
		air = $UI/AirBar.min_value
		$UI/Instruction.set_text("Breathe In.")
	if stress < $UI/StressBar.min_value:
		stress = $UI/StressBar.min_value

	# update state
	if air == $UI/AirBar.min_value:
		is_breathing_out = false

	# update bars
	$UI/AirBar.value = air
	$UI/StressBar.value = stress

	$UI/AirBar/Label.set_text("Air: %.1f" % air + "%")
	$UI/StressBar/Label.set_text("Stress: %.1f" % stress + "%")

func breathingIn(delta):
	is_breathing_in = true
	is_breathing_out = false

func breathingOut():
	is_breathing_in = false
	is_breathing_out = true

func game_over():
	if !is_game_over:
		is_game_over = true
		emit_signal("game_over_total")

func _on_Ball_game_over_pong():
	stress += 10

func _on_Ball_game_over_balance():
	stress += 10

func _on_Player_game_over_flappy():
	stress += 10

func _on_Pump_game_over_pump():
	stress += 10

func _on_Player_game_over_dodge():
	stress += 10

func _on_Metronome_game_over_metronome():
	stress += 10
