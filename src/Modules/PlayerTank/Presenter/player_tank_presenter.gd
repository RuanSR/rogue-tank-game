class_name PlayerPresenter

var _acceleration: int = 0

var _view: PlayerBase

var _model: PlayerModel

var _common: CommonPlayer = CommonPlayer.new()

var _self_ref: String

var travel = 0

func _init(tank_view: PlayerBase):
	self._view = tank_view

	_self_ref = str(self._view)
	
	InjectModel.load_model_dependency(self._view)

	_model = PlayerModel.new()

func _is_shot_limit_reachead() -> bool:
	var allow_shot = true
	
	if (_view.get_tree().get_nodes_in_group(_common.Barrel_Bullet_State_Group.CANNON_BULLETS + _self_ref).size() >= _model.bullet_limit_shot):
		return allow_shot
		
	return !allow_shot

func _create_and_add_new_bullet() -> void:
	var bullet: TankBulletView = _model._prefab_bullet.instance()
	var muzzle: Position2D = _model.bullet_muzzle_position
	
	var direction: Vector2 = Vector2(cos(_model.tank_barrel_node.global_rotation), sin(_model.tank_barrel_node.global_rotation)).normalized()
	
	bullet.init(direction, _self_ref)
	
	bullet.global_position = muzzle.global_position

	_view.get_parent().add_child(bullet)
	
	_model.bullet_shot_animation_player.play("on_fire")
	
	_model.tank_body_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.tank_barrel_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.bullet_muzzle_position.set_position(Vector2(30, 0))
	
	_model.bullet_shot_sprite.set_position(Vector2(37, 0))
	_model.bullet_shot_sprite.set_rotation_degrees( - 90)

func _add_travel(move: Vector2) -> void:
	travel += move.length() * _view.get_physics_process_delta_time()
	
	# _model.tank_body_sprite.texture.get_size().y: 
	# Pega o tamanho do body, para adcionar a trilha apos o carro andar
	if(travel > _model.tank_body_sprite.texture.get_size().y):
		travel = 0
		var track = _model._prefab_track.instance()
		var travelToPixelsBack = Vector2(cos(_view.rotation), sin(_view.rotation)).normalized() * 5
		
		track.global_position = _view.global_position - travelToPixelsBack
		track.rotation = _view.rotation
		track.z_index = _view.z_index - 1
		_view.get_parent().add_child(track)

func look_at_mouse() -> void:
	_model.tank_barrel_node.look_at(_view.get_global_mouse_position())

func on_move() -> void:
	var direction_value := 0

	if (Input.is_action_pressed("ui_up")):
		direction_value += 1;
	
	if (Input.is_action_pressed("ui_down")):
		direction_value -= 1;

	_acceleration = lerp(_acceleration, _model.MAX_SPEED * direction_value, .03)
	
	var _linear_velocity: Vector2 = _view.move_and_slide(Vector2(cos(_view.rotation), sin(_view.rotation)) * _acceleration)
	
	_add_travel(_linear_velocity)
	
	pass

func on_rotate() -> void:

	var rot = 0

	if (Input.is_action_pressed("ui_right")):
		rot += 1;
	
	if (Input.is_action_pressed("ui_left")):
		rot -= 1;
	
	_view.rotate(_model.ROTATION_VELOCITY * rot * _view.get_physics_process_delta_time())

func on_shoot() -> void:
	
	if (Input.is_action_just_pressed("ui_shoot")):
		
		if (_is_shot_limit_reachead()):
			return
		
		_create_and_add_new_bullet()
