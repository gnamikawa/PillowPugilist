class_name Enemy

extends CharacterBody2D

@export var movement_pattern: MovementPattern = MovementPattern.LINE
@export var speed = 50
@export var health = 3
@export var score_gained = 100
@export var movement_frequency = 0.1 # For periodic and radial functions
@export var movement_amplitude = 10 # For periodic and radial functions

enum MovementPattern { 
	LINE,
	SINUSOIDAL,
}

var travel_time = 0
var starting_position = 0
var direction = Vector2(0, 1)

func _enter_tree():
	starting_position = position

func damage(dmg):
	health -= dmg
	if health <= 0:
		var score = (get_node("/root/ScoreCounter") as ScoreCounter)
		score.total_score += score_gained
		queue_free()

func perpendicular(vector_in: Vector2):
	return Vector2(vector_in.y, -vector_in.x)

func _physics_process(delta):
	travel_time += delta
	for c in get_children():
		if c is Weapon:
			c.shoot(
				delta,
				get_parent(),
				Vector2(0, 1),
				position,
				true
			)
	
	match movement_pattern:
		MovementPattern.LINE:
			position += direction * speed * delta
		MovementPattern.SINUSOIDAL:
			var t = speed * travel_time
			var sinus = sin(t * movement_frequency)
			position = starting_position + t * direction + movement_amplitude * perpendicular(direction) * sinus
