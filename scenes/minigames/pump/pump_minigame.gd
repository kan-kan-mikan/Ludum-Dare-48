extends Node2D

signal game_over_pump

export var life = 100
export var life_per_pump = 4
export var life_drain = 5

func _ready():
	$UI/Life.value = life

func _process(delta):
	if Input.is_action_just_pressed("pump_press_pump"):
		life += life_per_pump
	
	if life > 100:
		life = 100
	
	life -= life_drain * delta

	if life < 0:
		game_over()

	# render life bar
	$UI/Life.value = life

func game_over():
	emit_signal("game_over_pump")
	reset_game()

func reset_game():
	life = 100
