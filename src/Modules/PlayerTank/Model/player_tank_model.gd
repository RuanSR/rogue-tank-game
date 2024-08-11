class_name PlayerModel

const ROTATION_VELOCITY: float = PI / 2
const MAX_SPEED: int = 100

var speed_velocity: int setget set_speed_velocity, get_speed_velocity
var bullet_limit_shot: int setget set_bullet_limit_shot, get_bullet_limit_shot
var _expo_prop_model: PlayerBase

const _prefab_bullet: PackedScene = preload ("res://src/Modules/PlayerTank/@SubModules/TankBullet/View/TankBullet.tscn")
const _prefab_track: PackedScene = preload("res://src/Modules/PlayerTank/@SubModules/TankTrack/TankTrack.tscn")

var tank_body_collision_poly: CollisionPolygon2D
var tank_body_sprite: Sprite
var tank_barrel_node: Node2D
var bullet_muzzle_position: Position2D
var tank_barrel_sprite: Sprite
var bullet_shot_sprite: Sprite
var bullet_shot_animation_player: AnimationPlayer
var tank_body_skin_manager: Node2D
var tank_barrel_skin_manager: Node2D

func _init():
	self.tank_body_collision_poly = InjectModel.get_dependency("TankBodyCollisionPoly2D")
	self.tank_body_sprite = InjectModel.get_dependency("TankBodySprite")
	self.tank_barrel_node = InjectModel.get_dependency("TankBarrelNode2D")
	self.bullet_muzzle_position = InjectModel.get_dependency("BulletMuzzlePosition2D")
	self.tank_barrel_sprite = InjectModel.get_dependency("TankBarrelSprite")
	self.bullet_shot_sprite = InjectModel.get_dependency("BulletShotSprite")
	self.bullet_shot_animation_player = InjectModel.get_dependency("BulletShotAnimationPlayer")
	self.tank_body_skin_manager = InjectModel.get_dependency("TankBodySkinManager")
	self.tank_barrel_skin_manager = InjectModel.get_dependency("BarrelSkinManager")
	_expo_prop_model = InjectModel.get_dependency("PlayerTank")

	speed_velocity = _expo_prop_model.speed_velocity
	bullet_limit_shot = _expo_prop_model.bullet_limit_shot

func get_speed_velocity():
	return speed_velocity

func set_speed_velocity(value: int):
	speed_velocity = value

func set_bullet_limit_shot(value: int):
	bullet_limit_shot = value

func get_bullet_limit_shot() -> int:
	return bullet_limit_shot
