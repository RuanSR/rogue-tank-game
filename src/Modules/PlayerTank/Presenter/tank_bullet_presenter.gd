class_name TankBulletPresenter

const MAX_BULLET_DISTANCE = 250

var _view: Area2D
var _model: TankBulletModel
var _common: CommonPlayer = CommonPlayer.new()

func _init(tank_bullet_view: Area2D, bullet_direction: Vector2, bullet_initial_position: Vector2) -> void:
	self._view = tank_bullet_view
	
	_model = TankBulletModel.new(self._view.BulletCollisionShape2D, self._view.BulletSprite2D, self._view.BulletVisibilityNotifier2D, bullet_direction, bullet_initial_position)

func _reached_maximum_distance_limit(actual_position: Vector2, initial_position: Vector2, max_distance: int) -> bool:
	return actual_position.distance_to(initial_position) >= max_distance

func on_fire() -> void:
	if (bullet_is_of_limit()):
		destroy_bullet()
		
	_view.translate(_model.bullet_direction * _model.bullet_velocity * _view.get_process_delta_time())
	_view.set_rotation(_model.bullet_direction.angle())
	
func add_in_group_list(group_name: String):
	_view.add_to_group(group_name)

func bullet_is_alive() -> bool:
	return _model.get_bullet_state()

func bullet_is_of_limit() -> bool:
	return _reached_maximum_distance_limit(_view.global_position, _view.bullet_initial_position, MAX_BULLET_DISTANCE)

func destroy_bullet() -> void:
	_model.set_bullet_state(false)
	_view.BulletSmokeParticles2D.set_emitting(false)
	_view.BulletSprite2D.set_visible(false)
	_view.BulletSelfDestructionAnimationPlayer.play("explode")
	_view.set_monitoring(false)
	yield(_view.BulletSelfDestructionAnimationPlayer,"animation_finished")
	_view.queue_free()
