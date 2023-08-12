class_name DeathScreen

extends Sprite2D


var timer = 0
const TIME_TO_FADE = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector2(99999, 99999)
	texture = load('res://assets/sprites/DeathScreen.png')
	z_index = 1000
	modulate = Color(0, 0, 0, 0)
	print('ohnyo')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	modulate = Color(1, 1, 1, 1) * clamp(timer / TIME_TO_FADE, 0, 1)
	if timer > TIME_TO_FADE:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
