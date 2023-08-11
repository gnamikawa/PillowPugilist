class_name BackgroundScroller

extends Sprite2D

const SPEED = 10;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += SPEED * delta
	if position.y >= get_viewport_rect().size.y * 1.5:
		position.y = get_viewport_rect().size.y * -0.5
