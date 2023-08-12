class_name Enemy

extends CharacterBody2D

@export var movement_pattern: MovementPattern

enum MovementPattern { 
	SIDEWAYS
}

func _physics_process(delta):
	for c in get_children():
		if c is Weapon:
			c.shoot(
				delta,
				get_parent(),
				Vector2(0, 1),
				position,
				true
			)
