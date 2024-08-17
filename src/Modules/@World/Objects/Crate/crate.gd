extends Node2D

func _ready():
	load_selected_texture()
	pass

func load_selected_texture() -> void:
	var crate_sprite: Sprite = $CrateSprite
	var skin_manager: SkinManager = $SkinManager

	crate_sprite.set_texture(skin_manager.selected_texture)
