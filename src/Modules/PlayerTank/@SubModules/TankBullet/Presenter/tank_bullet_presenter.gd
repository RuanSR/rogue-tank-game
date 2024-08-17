class_name TankBulletPresenter

const MAX_BULLET_DISTANCE = 250

var _view: Area2D
var _model: TankBulletModel

func _init(tank_bullet_view: Area2D, bullet_direction: Vector2, bullet_initial_position: Vector2) -> void:
	self._view = tank_bullet_view
	
	_model = TankBulletModel.new(bullet_direction, bullet_initial_position)

func _reached_maximum_distance_limit(actual_position: Vector2, initial_position: Vector2, max_distance: int) -> bool:
	return actual_position.distance_to(initial_position) >= max_distance

func on_fire() -> void:
	if (bullet_is_of_limit()):
		destroy_bullet()
		
	_view.translate(_model.get_bullet_direction() * _model.get_bullet_velocity() * _view.get_process_delta_time())
	_view.set_rotation(_model.get_bullet_direction().angle())
	
func add_in_group_list(group_name: String):
	_view.add_to_group(group_name)

func bullet_is_alive() -> bool:
	return _model.get_bullet_state()

func bullet_is_of_limit() -> bool:
	return _reached_maximum_distance_limit(_view.global_position, _model.get_bullet_initial_position(), MAX_BULLET_DISTANCE)

func destroy_bullet() -> void:
	_model.set_bullet_state(false)
	_model.bullet_smoke_particles.set_emitting(false)
	_model.bullet_sprite.set_visible(false)
	_model.bullet_self_destruction_animation_player.play("explode")
	_view.set_deferred("set_monitoring", false)
	yield (_model.bullet_self_destruction_animation_player, "animation_finished")
	_view.queue_free()
