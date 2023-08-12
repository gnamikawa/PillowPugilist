class_name Bullet

extends Sprite2D

enum BulletType {LINEAR, SINUSOIDAL, ARC}
@export var player_spawned = false
@export var bullet_type = BulletType.LINEAR
@export var damage = 1
var movement = null;

func find_movement_if_exists():
	if movement == null:
		for c in get_children():
			if c is Movement:
				movement = c

func set_up(p_position: Vector2, p_direction: Vector2):
	find_movement_if_exists()
	position = p_position
	if movement:
		print(p_direction)
		movement.direction = p_direction.normalized()

func _on_area_2d_body_entered(body):
	if body.is_in_group('walls'):
		queue_free()
	if body.is_in_group('player') and not player_spawned:
		body.queue_free()
	if body.is_in_group('enemy') and player_spawned:
		(body as Enemy).damage(damage)
