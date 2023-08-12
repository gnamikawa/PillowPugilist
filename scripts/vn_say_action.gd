class_name VNSay

extends Node

@export var sprite: Texture
@export var text: String = ''

func do():
	if text.length() > 0:
		(get_parent().get_parent() as VNController).new_text(text)
	if sprite:
		(get_parent().get_parent() as VNController).set_sprite(sprite)
