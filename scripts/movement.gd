class_name Movement

extends Node

enum MovementPattern { 
	LINE,
	SINUSOIDAL,
}

func perpendicular(vector_in: Vector2):
	return Vector2(vector_in.y, -vector_in.x)

@export var movement_pattern = MovementPattern.LINE
@export var movement_frequency = 0.1 # For periodic and radial functions
@export var movement_amplitude = 10 # For periodic and radial functions
@export var movement_speed = 50
@export var movement_acceleration = 0
@export var spin_speed = 0 # Degrees per second
var travel_time = 0
var starting_position = 0
var direction = Vector2(0, 1)

var parent: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent() as Node2D
	starting_position = parent.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	travel_time += delta
	movement_speed += movement_acceleration * delta
	match movement_pattern:
		MovementPattern.LINE:
			parent.position += direction * movement_speed * delta
		MovementPattern.SINUSOIDAL:
			var t = movement_speed * travel_time
			var sinus = sin(t * movement_frequency)
			parent.position = starting_position + t * direction + movement_amplitude * perpendicular(direction) * sinus
