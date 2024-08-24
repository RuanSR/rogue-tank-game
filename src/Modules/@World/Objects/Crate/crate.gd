extends Node2D

export var path_skins: String
export var selected_skin_index: int = 0

func _ready():
	$CrateSprite.set_texture($SkinManager.get_sprite_texture())
