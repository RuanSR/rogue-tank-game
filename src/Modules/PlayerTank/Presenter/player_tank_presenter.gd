class_name PlayerPresenter

var tank_view: KinematicBody2D
var player_model: PlayerModel
var enums = preload("res://src/Modules/PlayerTank/@Shared/enums.gd")

func _init(tank_view: KinematicBody2D):
	player_model = preload("res://src/Modules/PlayerTank/Model/player_tank_model.gd").new()
	
	self.tank_view = tank_view

func on_move() -> void:
	
	var delta := tank_view.get_process_delta_time()
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
	
	tank_view.translate(Vector2(dir_x, dir_y) * delta * player_model.speed)

func on_shoot() -> void:
	
	if (Input.is_action_just_pressed("ui_shoot")):
		
		if (_is_shot_limit_reachead()):
			return
		
		var bullet = player_model.get_new_bullet_instance()
		var muzzle: Position2D = tank_view.get_node("TankBarrelNode2D/BulletMuzzlePosition2D")
		
		bullet.global_position = muzzle.position
		tank_view.add_child(bullet)

func _is_shot_limit_reachead() -> bool:
	var allow_shot = true

	if (tank_view.get_tree().get_nodes_in_group(enums.Barrel_Bullet_State_Group.CANNON_BULLETS).size() >= player_model.shot_limit):
		return allow_shot
		
	return !allow_shot
