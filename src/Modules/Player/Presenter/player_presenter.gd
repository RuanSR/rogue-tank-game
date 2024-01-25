class_name PlayerPresenter

var tank_view: KinematicBody2D
var player_model: PlayerModel

func _init(tank_view: KinematicBody2D):
	player_model = preload("res://src/Modules/Player/Model/player_model.gd").new()
	
	self.tank_view = tank_view

func on_move(delta: float):
	var dir_x: int = 0;
	
	if(Input.is_action_pressed("ui_right")):
		dir_x += 1;
	
	if(Input.is_action_pressed("ui_left")):
		dir_x -= 1;
	
	tank_view.translate(Vector2(dir_x, 0) * delta * player_model.speed)
