class_name PlayerModel

var speed: int = 100

var _prefab_bullet: PackedScene

func _init():
	_prefab_bullet = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")

func get_new_bullet_instance() -> Area2D:
	var bullet = _prefab_bullet.instance()
	return bullet

