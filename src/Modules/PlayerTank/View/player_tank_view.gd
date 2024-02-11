tool
extends KinematicBody2D

const _prefab_bullet: PackedScene = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")

var _presenter: PlayerPresenter

func _ready():
	
	_presenter = PlayerPresenter.new(self)
	
	load_selected_texture()

func _process(_delta):
	
	if (_is_editor_tool()):
		return

	_presenter.on_move()
	_presenter.on_shoot()
	_presenter.look_at_mouse()

func _draw():
	if (_is_editor_tool()):
		update()

func _is_editor_tool() -> bool:
	return Engine.editor_hint

func load_selected_texture() -> void:
	$TankBodySprite.texture = $TankBodySkinManager.selected_texture
	$TankBarrelNode2D/TankBarrelSprite.texture = $TankBarrelNode2D/BarrelSkinManager.selected_texture
