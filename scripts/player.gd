class_name PlayerObject

extends CharacterBody2D

@export var angle_spread = 0.6 # Modifies how wide the angle is during shooting while moving diagonally or horizontally
@export var speed = 300
@export var slow_speed = 100 
@export var current_weapon: Weapon = load('res://data/weapons/default_weapon.tres')
var timer = 0
const MIN_SHOTS_PER_MINUTE = 1 # Just to avoid division by 0...

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

func _process(delta):
	timer += delta
	var shooting_rate = 60 / max(MIN_SHOTS_PER_MINUTE, current_weapon.shots_per_minute)
	if Input.is_key_pressed(KEY_SPACE) and timer > shooting_rate:
		timer -= shooting_rate

		# Spawn the bullet
		current_weapon.shoot(
			get_parent(),
			Vector2(sign(velocity.x) * angle_spread, -1).normalized(),
			position,
			true,
			true
		)

func _physics_process(delta):
	get_input()
	move_and_slide()
