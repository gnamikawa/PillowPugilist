class_name Enemy

extends CharacterBody2D

@export var health = 3
@export var score_gained = 100
var movement = null;

func find_movement_if_exists():
	for c in get_children():
		if c is Movement:
			movement = c

func damage(dmg):
	health -= dmg
	if health <= 0:
		var score = (get_node("/root/ScoreCounter") as ScoreCounter)
		score.total_score += score_gained
		queue_free()

func set_up(p_position: Vector2, p_direction: Vector2):
	find_movement_if_exists()
	position = p_position
	if movement:
		movement.direction = p_direction.normalized()

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
