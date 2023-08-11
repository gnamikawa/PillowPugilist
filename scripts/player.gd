class_name PlayerObject

extends CharacterBody2D

@export var speed = 300
@export var slow_speed = 100 
@onready var bullet_node = preload('res://scenes/bullet.tscn')

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
	if Input.is_key_pressed(KEY_SPACE):
		var bullet = bullet_node.instantiate() as Bullet;
		bullet.position = position
		bullet.player_spawned = true
		bullet.direction = Vector2(sign(velocity.x), -1).normalized()
		get_parent().add_child(bullet)

func _physics_process(delta):
	get_input()
	move_and_slide()
