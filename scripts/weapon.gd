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
