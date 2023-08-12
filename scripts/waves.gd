class_name Waves

extends Node

@export var dumpNode: NodePath
var dump: Node
var total_time = 0

func _enter_tree():
	dump = get_node(dumpNode)

func _process(delta):
	total_time += delta
	
	if get_child_count() > 0:
		var first_child = get_child(0) as Spawner

		# Check if the time is right for this spawner to spawn enemies
		# If it is, move it over to the "dump node" so that we can move onto checking the next spawner...
		if total_time > first_child.enemy_spawn_times:
			first_child.spawning = true
			remove_child(first_child)
			dump.add_child(first_child)
