class_name PlayerObject

extends CharacterBody2D

@export var speed = 300
@export var slow_speed = 100

# Returns the speed in pixels per second
func get_speed():
	if Input.is_action_pressed('slow_down'):
		return slow_speed
	else:
		return speed

# Writes the velocity vector on the CharacterBody2D
func get_input():
	var input_direction = Input.get_vector(
		'movement_left',
		'movement_right',
		'movement_up',
		'movement_down'
	)
	velocity = input_direction * get_speed()

func _ready():
	print('player ready')

func _physics_process(delta):
	get_input()
	move_and_slide()
