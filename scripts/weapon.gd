class_name Weapon

extends Resource


@export var shots_per_minute: float
@export var name: String
@export var bullet_scene: PackedScene

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_shots_per_minute = 60, p_name = 'Weapon', p_bullet_scene = 'res://scenes/bullet.tscn'):
	shots_per_minute = p_shots_per_minute
	name = p_name
	bullet_scene = load(p_bullet_scene)

func shoot(bullet_parent, direction = Vector2(0, 1), position = Vector2(0, 0), overwrite_position = false, player_spawned = false):
	var bullet = bullet_scene.instantiate() as Bullet;
	if overwrite_position:
		bullet.position = position
	bullet.player_spawned = player_spawned
	bullet.direction = direction
	print('spawning : ', bullet.spin_speed)
	# Adds the bullet to the scene tree
	# (necessary as otherwise it won't render!)
	bullet_parent.add_child(bullet)
