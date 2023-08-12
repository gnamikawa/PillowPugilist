class_name Enemy

extends CharacterBody2D

@export var current_weapon: Weapon
@export var movement_pattern: MovementPattern

enum MovementPattern { 
	SIDEWAYS
}

func _physics_process(delta):
	if current_weapon:
		current_weapon.shoot(
			delta,
			get_parent(),
			Vector2(0, 1),
			position,
			true
		)
