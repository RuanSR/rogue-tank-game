class_name PlayerModel

var speed: int = 250
var shot_limit: int = 5

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
