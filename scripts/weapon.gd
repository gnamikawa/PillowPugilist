class_name Weapon

extends Node

@export var shots_per_minute: float
@export var bullet_scene: PackedScene
@export var clip: AudioStream

var timer = 0
const MIN_SHOTS_PER_MINUTE = 1 # Just to avoid division by 0...

func shoot(delta_time: float, bullet_parent, direction = Vector2(0, 1), position = Vector2(0, 0), overwrite_position = false, player_spawned = false):
	timer += delta_time
	var shooting_rate = 60 / max(MIN_SHOTS_PER_MINUTE, shots_per_minute)
	if timer > shooting_rate:
		timer = 0

		var bullet = bullet_scene.instantiate() as Bullet;
		if overwrite_position:
			bullet.position = position
		bullet.player_spawned = player_spawned
		bullet.direction = direction
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
