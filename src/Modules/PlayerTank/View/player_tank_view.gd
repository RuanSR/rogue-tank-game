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
onready var TankBodySkinManager: Node2D = $TankBodySkinManager
onready var TankBarrelSkinManager: Node2D = $TankBarrelNode2D/BarrelSkinManager

func _ready():
	_presenter = PlayerPresenter.new(self)
	
	_presenter.set_node_config()
	_presenter.load_selected_texture()
	
	
func _process(_delta):
	
	_presenter.on_move()
	_presenter.on_shoot()
	_presenter.look_at_mouse()
