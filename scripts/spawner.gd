class_name Spawner

extends Node2D

var spawning = false
@export var enemy_scenes: PackedScene
@export var enemy_spawn_times = 0 # TIME WHEN TO START SPAWNING
@export var spawn_cooldown = 0 # SPAWN COOLDOWN THINGY
@export var amount_to_spawn = 1 # HOW MANY TO SPAWN
@export var direction = Vector2(0, 1)
var spawn_timer = 0

func _enter_tree():
	spawn_timer = 9999999999 # Just so we don't need to wait for the first spawn cooldown when we start spawning...

func _process(delta):
	if spawning:
		spawn_timer += delta
		if spawn_timer >= spawn_cooldown:
			spawn_timer = 0

			var enemy = enemy_scenes.instantiate() as Enemy
			enemy.set_up(position, direction)
			get_parent().get_parent().add_child(enemy)

			# Remove itself after spawning finishes...
			amount_to_spawn -= 1
			if amount_to_spawn == 0:
				spawning = false
				queue_free()
