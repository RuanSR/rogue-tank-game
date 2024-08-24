class_name PlayerModel

const ROTATION_VELOCITY: float = PI / 2
const MAX_SPEED: int = 100

var speed_velocity: int setget set_speed_velocity, get_speed_velocity
var _expo_prop_model: PlayerBase

const _prefab_track: PackedScene = preload("res://src/Modules/PlayerTank/@SubModules/TankTrack/TankTrack.tscn")

var tank_body_collision_poly: CollisionPolygon2D
var tank_body_sprite: Sprite
var tank_body_skin_manager: Node2D

var tank_barrel: BarrelView

func _init():
	self.tank_body_skin_manager = InjectModel.get_dependency("TankBodySkinManager")
	self.tank_body_collision_poly = InjectModel.get_dependency("TankBodyCollisionPoly2D")
	self.tank_body_sprite = InjectModel.get_dependency("TankBodySprite")
	
	self.tank_barrel = InjectModel.get_dependency("TankBarrel")
	

func get_speed_velocity():
	return speed_velocity

func set_speed_velocity(value: int):
	speed_velocity = value
