class_name PlayerPresenter

var _view: KinematicBody2D

var _model: PlayerModel

var _common: CommonPlayer = CommonPlayer.new()

func _init(tank_view: KinematicBody2D):

	var tank_body_collision_poly: CollisionPolygon2D = tank_view.TankBodyCollisionPoly2D
	var tank_body_sprite: Sprite = tank_view.TankBodySprite
	var tank_barrel_node: Node2D = tank_view.TankBarrelNode2D
	var bullet_muzzle_position: Position2D = tank_view.BulletMuzzlePosition2D
	var tank_barrel_sprite: Sprite = tank_view.TankBarrelSprite
	var bullet_shot_sprite: Sprite = tank_view.BulletShotSprite
	var bullet_shot_animation_player: AnimationPlayer = tank_view.BulletShotAnimationPlayer
	
	_model = PlayerModel.new(tank_body_collision_poly, tank_body_sprite, tank_barrel_node, bullet_muzzle_position, tank_barrel_sprite, bullet_shot_sprite, bullet_shot_animation_player)
	
	self._view = tank_view

func _is_shot_limit_reachead() -> bool:
	var allow_shot = true

	if (_view.get_tree().get_nodes_in_group(_common.Barrel_Bullet_State_Group.CANNON_BULLETS).size() >= _model.shot_limit):
		return allow_shot
		
	return !allow_shot

func _set_node_config() -> void:
	
	_model.tank_body_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.tank_barrel_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.bullet_muzzle_position.set_position(Vector2(30, 0))
	
	_model.bullet_shot_sprite.set_position(Vector2(37, 0))
	_model.bullet_shot_sprite.set_rotation_degrees(-90)

func look_at_mouse() -> void:
	_view.look_at(_view.get_global_mouse_position())

func on_move() -> void:

	var delta := _view.get_process_delta_time()
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
	
	_view.translate(Vector2(dir_x, dir_y) * delta * _model.speed)

func on_shoot() -> void:
	
	if (Input.is_action_just_pressed("ui_shoot")):
		
		if (_is_shot_limit_reachead()):
			return
		
		var bullet: Area2D = _view._prefab_bullet.instance()
		var muzzle: Position2D = _model.bullet_muzzle_position
		
		bullet.init(Vector2( cos(_view.global_rotation), sin(_view.global_rotation) ).normalized())
		
		bullet.global_position = muzzle.global_position

		_view.get_parent().add_child(bullet)
		
		_model.bullet_shot_animation_player.play("on_fire")
