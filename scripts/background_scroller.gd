extends Sprite2D

@export var speed = 100;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	if position.y >= get_viewport_rect().size.y * 1.5:
		position.y = get_viewport_rect().size.y * -0.5
