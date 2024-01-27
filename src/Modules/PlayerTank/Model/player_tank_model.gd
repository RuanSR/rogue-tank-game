class_name PlayerModel

var speed: int = 100
var shot_limit: int = 3
var bullet_model: TankBulletModel

var _prefab_bullet: PackedScene

func _init():
	_prefab_bullet = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")
	
	bullet_model = preload("res://src/Modules/PlayerTank/Model/tank_bullet_model.gd").new()

func get_new_bullet_instance() -> Area2D:
	var bullet = _prefab_bullet.instance()
	return bullet

