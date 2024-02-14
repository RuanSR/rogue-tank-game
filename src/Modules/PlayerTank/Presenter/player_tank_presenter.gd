class_name PlayerPresenter

var _view: KinematicBody2D

var _model: PlayerModel

var _common: CommonPlayer = CommonPlayer.new()

var _self_ref: String

func _init(tank_view: KinematicBody2D):
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
	
	var direction: Vector2 = Vector2( cos(_view.global_rotation), sin(_view.global_rotation) ).normalized()
	
	bullet.init(direction, _self_ref)
	
	bullet.global_position = muzzle.global_position

	_view.get_parent().add_child(bullet)
	
	_model.bullet_shot_animation_player.play("on_fire")
	
	_model.tank_body_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.tank_barrel_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.bullet_muzzle_position.set_position(Vector2(30, 0))
	
	_model.bullet_shot_sprite.set_position(Vector2(37, 0))
	_model.bullet_shot_sprite.set_rotation_degrees(-90)

func look_at_mouse() -> void:
	_view.look_at(_view.get_global_mouse_position())

func on_move() -> void:

	var dir_x := 0;
	var dir_y := 0;
	
	if(Input.is_action_pressed("ui_right")):
		dir_x += 1;
	
	if(Input.is_action_pressed("ui_left")):
		dir_x -= 1;
	
	if(Input.is_action_pressed("ui_up")):
		dir_y -= 1;
	
	if(Input.is_action_pressed("ui_down")):
		dir_y += 1;
	
	var _linear_velocity = _view.move_and_slide(Vector2(dir_x, dir_y) * _model.speed_velocity)

func on_shoot() -> void:
	
	if (Input.is_action_just_pressed("ui_shoot")):
		
		if (_is_shot_limit_reachead()):
			return
		
		_create_and_add_new_bullet()
