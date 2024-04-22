tool
extends PlayerBase

var _presenter: PlayerPresenter

func _ready():
	_presenter = PlayerPresenter.new(self)
	
	load_selected_texture()

func _physics_process(_delta):
	
	if (_is_editor_tool()):
		return

	_presenter.on_move()
	_presenter.on_rotate()
	_presenter.on_shoot()
	# _presenter.look_at_mouse()

func _draw():
	if (_is_editor_tool()):
		update()

func _is_editor_tool() -> bool:
	return Engine.editor_hint

func load_selected_texture() -> void:
	var tank_body_sprite: Sprite = $TankBodySprite
	var tank_barrel_sprite: Sprite = $TankBarrelNode2D/TankBarrelSprite

	var skin_body_manager: SkinManager = $TankBodySkinManager
	var skin_barrel_manager: SkinManager = $TankBarrelNode2D/BarrelSkinManager

	tank_body_sprite.set_texture(skin_body_manager.selected_texture)
	tank_barrel_sprite.set_texture(skin_barrel_manager.selected_texture)
