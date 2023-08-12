class_name VNController

extends Control

@export var next_scene: PackedScene

func _enter_tree():
	next()

func next():
	var has_children = get_child(0).get_child_count()
	if has_children:
		var nextc = get_child(0).get_child(0)
		nextc.do()
		nextc.queue_free()
	else:
		if next_scene:
			get_tree().change_scene_to_packed(next_scene)
		else:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func new_text(text):
	var label = find_child('RichTextLabel') as RichTextLabel
	label.text = text

func set_sprite(sprite):
	var left = find_child('Sprite') as Sprite2D
	left.texture = sprite


func _on_button_next_pressed():
	next()
