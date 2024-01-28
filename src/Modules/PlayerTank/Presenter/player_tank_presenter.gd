class_name PlayerPresenter

var _view: KinematicBody2D
var _prefab_bullet: PackedScene

var player_model: PlayerModel

var enums = preload("res://src/Modules/PlayerTank/@Shared/enums.gd")

func _init(tank_view: KinematicBody2D):
	player_model = preload("res://src/Modules/PlayerTank/Model/player_tank_model.gd").new()
	_prefab_bullet = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")
	
	self._view = tank_view

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
	
	_view.translate(Vector2(dir_x, dir_y) * delta * player_model.speed)
	

func on_shoot() -> void:
	
	if (Input.is_action_just_pressed("ui_shoot")):
		
		if (_is_shot_limit_reachead()):
			return
		
		var bullet: Area2D = _prefab_bullet.instance()
		var muzzle: Position2D = _view.get_node("TankBarrelNode2D/BulletMuzzlePosition2D")
		
		bullet.init(Vector2( cos(_view.global_rotation), sin(_view.global_rotation) ).normalized())
		
		bullet.global_position = muzzle.global_position

		_view.get_parent().add_child(bullet)
	

func _is_shot_limit_reachead() -> bool:
	var allow_shot = true

	if (_view.get_tree().get_nodes_in_group(enums.Barrel_Bullet_State_Group.CANNON_BULLETS).size() >= player_model.shot_limit):
		return allow_shot
		
	return !allow_shot
