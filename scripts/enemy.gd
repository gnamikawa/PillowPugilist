class_name Enemy

extends CharacterBody2D

@export var movement_pattern: MovementPattern = MovementPattern.DOWN
@export var speed = 25
@export var health = 3
@export var score_gained = 100

enum MovementPattern { 
	DOWN
}

func damage(dmg):
	health -= dmg
	if health <= 0:
		var score = (get_node("/root/ScoreCounter") as ScoreCounter)
		score.total_score += score_gained
		queue_free()

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
			print(speed)
			print(delta)
			position.y += speed * delta
