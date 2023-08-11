class_name Bullet

extends Sprite2D

enum BulletType {LINEAR, SINUSOIDAL, ARC}
@export var player_spawned = false
@export var speed = 300
@export var bullet_type = BulletType.LINEAR

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match bullet_type:
		BulletType.LINEAR:
			position.y += -delta * speed
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group('walls'):
		queue_free()
