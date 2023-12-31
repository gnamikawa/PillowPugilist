class_name PlayerObject

extends CharacterBody2D

@export var angle_spread = 0.5 # Modifies how wide the angle is during shooting while moving diagonally or horizontally
@export var speed = 300
@export var slow_speed = 100 

# Returns the speed in pixels per second
func get_speed():
	if Input.is_action_pressed('slow_down'):
		return slow_speed
	else:
		return speed

func _exit_tree():
	print('played dead :skull:')
	var ds = DeathScreen.new()
	get_parent().add_child.call_deferred(ds)

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
	$AnimatedSprite2D.play()

func _process(delta):
	if Input.is_key_pressed(KEY_SPACE) or true:
		# Spawn the bullet
		for c in get_children():
			if c is Weapon:
				c.shoot(
					delta,
					get_parent(),
					Vector2(sign(velocity.x) * angle_spread, -1).normalized(),
					position,
					true,
					true
				)

func _physics_process(delta):
	get_input()
	move_and_slide()
