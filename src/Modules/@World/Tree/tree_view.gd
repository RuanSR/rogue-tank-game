tool
extends StaticBody2D

export var path_skins: String

export var selected_skin_index: int = 0 setget set_selected_skin_index

func _ready():
	$Sprite.set_texture($SkinManager.get_sprite_texture())
	$Shadow.set_texture($SkinManager.get_sprite_texture())	

func set_selected_skin_index(value):
	selected_skin_index = value
	$Sprite.set_texture($SkinManager.get_sprite_texture())
	$Shadow.set_texture($SkinManager.get_sprite_texture())
	
	if (Engine.is_editor_hint()):
		update()
