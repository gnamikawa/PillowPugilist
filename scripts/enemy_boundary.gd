extends Node

func _on_body_entered(body):
	
	body.queue_free()
