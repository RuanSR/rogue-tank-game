extends KinematicBody2D

var _prefab_bullet: PackedScene
var _presenter: PlayerPresenter

onready var TankBodyCollisionPoly2D: CollisionPolygon2D = $TankBodyCollisionPoly2D
onready var TankBodySprite: Sprite = $TankBodySprite
onready var TankBarrelNode2D: Node2D = $TankBarrelNode2D
onready var BulletMuzzlePosition2D: Position2D = $TankBarrelNode2D/BulletMuzzlePosition2D
onready var TankBarrelSprite: Sprite = $TankBarrelNode2D/TankBarrelSprite
onready var BulletShotSprite: Sprite = $TankBarrelNode2D/BulletShotSprite
onready var BulletShotAnimationPlayer: AnimationPlayer = $TankBarrelNode2D/BulletShotAnimationPlayer


func _ready():
	_prefab_bullet = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")
	
	_presenter = preload("res://src/Modules/PlayerTank/Presenter/player_tank_presenter.gd").new(self)
	
	_presenter._set_node_config()

func _process(delta):
	
	_presenter.on_move()
	_presenter.on_shoot()
	_presenter.look_at_mouse()
	
