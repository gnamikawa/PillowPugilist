class_name Weapon

extends Node

enum SpawnPattern {
	LINE,
	RANDOM,
	CIRCLE,
}

@export var spawn_pattern = SpawnPattern.LINE;
@export var shots_per_minute: float
@export var bullet_scene: PackedScene
@export var clip: AudioStream
@export var pattern_value = 1

var total_timer = 0 # this timer never resets!
var timer = 0
const MIN_SHOTS_PER_MINUTE = 1 # Just to avoid division by 0...

func shoot(delta_time: float, bullet_parent, direction = Vector2(0, 1), position = Vector2(0, 0), overwrite_position = false, player_spawned = false):
	timer += delta_time
	total_timer += delta_time
	var shooting_rate = 60 / max(MIN_SHOTS_PER_MINUTE, shots_per_minute)
	if timer > shooting_rate:
		timer = 0

		var bullet = bullet_scene.instantiate() as Bullet;
		var dir = direction;
		match spawn_pattern:
			SpawnPattern.RANDOM:
				dir = Vector2(randf_range(-1, 1), randf_range(-1, 1))
			SpawnPattern.CIRCLE:
				dir = Vector2(sin(total_timer * pattern_value), cos(total_timer * pattern_value))
		bullet.set_up(position, dir)
		bullet.player_spawned = player_spawned
		if player_spawned:
			bullet.name = 'player_bullet'
		# Adds the bullet to the scene tree
		# (necessary as otherwise it won't render!)
		bullet_parent.add_child(bullet)
		
		if get_child_count() > 0:
			var player = get_child(0) as AudioStreamPlayer2D
			if player:
				if player.stream != clip:
					player.stream = clip
				player.play()
		
		return true
	return false
