class_name TankBulletPresenter

var _view: Area2D
var _model: TankBulletModel

var _common = load("res://src/Modules/PlayerTank/@Shared/common_player.gd").new()

func _init(tank_bullet_view: Area2D, bullet_direction) -> void:
	self._view = tank_bullet_view
	
	var bullet_collision: CollisionShape2D = self._view.get_node("BulletCollisionShape2D")
	var bullet_sprite: Sprite = self._view.get_node("BulletSprite2D")
	var bullet_visibility_noty: VisibilityNotifier2D = self._view.get_node("BulletVisibilityNotifier2D")
	
	_model = preload("res://src/Modules/PlayerTank/Model/tank_bullet_model.gd").new(bullet_collision, bullet_sprite, bullet_visibility_noty, bullet_direction)

func on_fire() -> void:
	_view.translate(_model.bullet_direction * _model.bullet_velocity * _view.get_process_delta_time())
	_view.set_rotation(_model.bullet_direction.angle())
	
func add_in_group_list(group_name: String):
	_view.add_to_group(group_name)

func _set_node_config() -> void:

	_model.bullet_collision_shape.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.bullet_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
