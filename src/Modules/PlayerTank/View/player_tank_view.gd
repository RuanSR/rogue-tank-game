tool
extends KinematicBody2D

const _prefab_bullet: PackedScene = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")

var _presenter: PlayerPresenter

onready var TankBodyCollisionPoly2D: CollisionPolygon2D = $TankBodyCollisionPoly2D
onready var TankBodySprite: Sprite = $TankBodySprite
onready var TankBarrelNode2D: Node2D = $TankBarrelNode2D
onready var BulletMuzzlePosition2D: Position2D = $TankBarrelNode2D/BulletMuzzlePosition2D
onready var TankBarrelSprite: Sprite = $TankBarrelNode2D/TankBarrelSprite
onready var BulletShotSprite: Sprite = $TankBarrelNode2D/BulletShotSprite
onready var BulletShotAnimationPlayer: AnimationPlayer = $TankBarrelNode2D/BulletShotAnimationPlayer
onready var TankBodySkinManager: Node = $TankBodySkinManager
onready var TankBarrelSkinManager: Node = $TankBarrelNode2D/BarrelSkinManager

func _ready():
	
	_presenter = PlayerPresenter.new(self)
	_presenter.set_node_config()
	
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
	TankBodySprite.texture = TankBodySkinManager.selected_texture
	TankBarrelSprite.texture = TankBarrelSkinManager.selected_texture
