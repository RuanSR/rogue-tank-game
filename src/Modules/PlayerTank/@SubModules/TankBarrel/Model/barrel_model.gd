class_name BarrelModel

var tank_barrel_node: Node2D
var bullet_muzzle_position: Position2D
var tank_barrel_sprite: Sprite
var bullet_shot_sprite: Sprite
var bullet_shot_animation_player: AnimationPlayer
var barrel_skin_manager: Node2D

var bullet_limit_shot: int setget set_bullet_limit_shot, get_bullet_limit_shot

func _init():
	self.bullet_muzzle_position = InjectModel.get_dependency("BulletMuzzlePosition2D")
	self.bullet_shot_sprite = InjectModel.get_dependency("BulletShotSprite")
	self.bullet_shot_animation_player = InjectModel.get_dependency("BulletShotAnimationPlayer")
	self.tank_barrel_sprite = InjectModel.get_dependency("TankBarrelSprite")
	self.tank_barrel_node = InjectModel.get_dependency("TankBarrel")
	self.barrel_skin_manager = InjectModel.get_dependency("BarrelSkinManager")
	
	bullet_limit_shot = tank_barrel_node.bullet_limit_shot

func set_bullet_limit_shot(value: int):
	bullet_limit_shot = value

func get_bullet_limit_shot() -> int:
	return bullet_limit_shot
