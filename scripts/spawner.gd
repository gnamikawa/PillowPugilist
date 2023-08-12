class_name Spawner

extends Node2D

var spawning = false
@export var enemy_scenes: PackedScene
@export var enemy_spawn_times = 0
@export var spawn_cooldown = 0
@export var amount_to_spawn = 1

func _process(delta):
	if spawning:
		var enemy = enemy_scenes.instantiate() as Enemy
		enemy.position = position
		get_parent().get_parent().add_child(enemy)

		# Remove itself after spawning finishes...
		amount_to_spawn -= 1
		if amount_to_spawn == 0:
			spawning = false
			queue_free()
