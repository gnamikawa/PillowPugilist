class_name Bullet

extends Sprite2D

enum BulletType {LINEAR, SINUSOIDAL, ARC}
@export var player_spawned = false
@export var speed = 300
@export var bullet_type = BulletType.LINEAR
@export var spin_speed = 0 # Degrees per second
var origin_point
var direction = Vector2(0, -1)

func _ready():
	origin_point = position

func _process(delta):
	if spin_speed > 0:
		rotation += spin_speed / 180 * PI
	match bullet_type:
		BulletType.LINEAR:
			position += direction * delta * speed
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group('walls'):
		queue_free()
