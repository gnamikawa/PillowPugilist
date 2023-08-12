extends Node

func _process(delta):
	if get_child_count() > 0:
		(get_child(0) as BossMovement).next(delta, get_parent())
