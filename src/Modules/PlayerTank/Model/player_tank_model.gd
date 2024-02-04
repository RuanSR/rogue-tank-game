class_name PlayerModel

var speed: int = 100
var shot_limit: int = 10

var tank_body_collision_poly: CollisionPolygon2D
var tank_body_sprite: Sprite
var tank_barrel_node: Node2D
var bullet_muzzle_position: Position2D
var tank_barrel_sprite: Sprite
var bullet_shot_sprite: Sprite
var bullet_shot_animation_player: AnimationPlayer
var tank_body_skin_manager: Node2D
var tank_barrel_skin_manager: Node2D

func _init(tank_body_collision_poly: CollisionPolygon2D, tank_body_sprite: Sprite, tank_barrel_node: Node2D, bullet_muzzle_position: Position2D, tank_barrel_sprite: Sprite, bullet_shot_sprite: Sprite, bullet_shot_animation_player: AnimationPlayer, tank_body_skin_manager: Node2D, tank_barrel_skin_manager: Node2D):
	self.tank_body_collision_poly = tank_body_collision_poly
	self.tank_body_sprite = tank_body_sprite
	self.tank_barrel_node = tank_barrel_node
	self.bullet_muzzle_position = bullet_muzzle_position
	self.tank_barrel_sprite = tank_barrel_sprite
	self.bullet_shot_sprite = bullet_shot_sprite
	self.bullet_shot_animation_player = bullet_shot_animation_player
	self.tank_body_skin_manager = tank_body_skin_manager
	self.tank_barrel_skin_manager = tank_barrel_skin_manager
