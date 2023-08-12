class_name Enemy

extends CharacterBody2D

@export var movement_pattern: MovementPattern = MovementPattern.DOWN
@export var speed = 25
@export var health = 3

enum MovementPattern { 
	DOWN
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
	
	match movement_pattern:
		MovementPattern.DOWN:
			position.y += speed * delta
