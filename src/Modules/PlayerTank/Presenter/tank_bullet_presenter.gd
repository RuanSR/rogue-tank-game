class_name TankBulletPresenter

var _view: Area2D
var tank_bullet_model: TankBulletModel

func _init(tank_bullet_view: Area2D, bullet_direction) -> void:
	self._view = tank_bullet_view
	
	var bullet_collision: CollisionShape2D = self._view.get_node("BulletCollisionShape2D")
	var bullet_sprite: Sprite = self._view.get_node("BulletSprite2D")
	var bullet_visibility_noty: VisibilityNotifier2D = self._view.get_node("BulletVisibilityNotifier2D")
	
	tank_bullet_model = preload("res://src/Modules/PlayerTank/Model/tank_bullet_model.gd").new(bullet_collision, bullet_sprite, bullet_visibility_noty, bullet_direction)

func on_fire() -> void:
	_view.translate(tank_bullet_model.bullet_direction * tank_bullet_model.bullet_velocity * _view.get_process_delta_time())
	_view.set_rotation(tank_bullet_model.bullet_direction.angle())
	
func add_in_group_list(group_name: String):
	_view.add_to_group(group_name)

