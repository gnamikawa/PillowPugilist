class_name BossMovement

extends Node2D

@export var wait = 1
@export var speed = 0.2
@export var next_weapon: PackedScene

var timer = 0

func next(delta, node2D: Node2D):
	timer += delta
	if timer > wait:
		var dir = position - node2D.position;
		var distance = dir.length();
		node2D.position = node2D.position.lerp(position, clamp(speed * (timer - wait) / distance, 0, 1))
		if distance < 0.01:
			if next_weapon:
				var boss = get_parent().get_parent()
				for c in boss.get_children():
					if c is Weapon:
						c.queue_free()
				boss.add_child(next_weapon.instantiate())
			queue_free()
