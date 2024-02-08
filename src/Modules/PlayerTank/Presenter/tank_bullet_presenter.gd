class_name TankBulletPresenter

var _view: Area2D
var _model: TankBulletModel
var _common: CommonPlayer = CommonPlayer.new()

func _init(tank_bullet_view: Area2D, bullet_direction: Vector2) -> void:
	self._view = tank_bullet_view
	
	_model = TankBulletModel.new(self._view.BulletCollisionShape2D, self._view.BulletSprite2D, self._view.BulletVisibilityNotifier2D, bullet_direction)

func on_fire() -> void:
	_view.translate(_model.bullet_direction * _model.bullet_velocity * _view.get_process_delta_time())
	_view.set_rotation(_model.bullet_direction.angle())
	
func add_in_group_list(group_name: String):
	_view.add_to_group(group_name)
