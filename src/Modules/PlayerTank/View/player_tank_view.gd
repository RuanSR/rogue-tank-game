extends KinematicBody2D

var player_presenter: PlayerPresenter

func _ready():
	_set_node_config()
	
	player_presenter = preload("res://src/Modules/PlayerTank/Presenter/player_tank_presenter.gd").new(self)

func _process(delta):
	
	player_presenter.on_move()
	player_presenter.on_shoot()
	look_at(get_global_mouse_position())
	

func _set_node_config() -> void:
	var default_rotation_degrees = 90
	
	$TankBodySprite.set_rotation_degrees(default_rotation_degrees)
	$TankBarrelNode2D/TankBarrelSprite.set_rotation_degrees(default_rotation_degrees)
	$TankBarrelNode2D/BulletMuzzlePosition2D.set_position(Vector2(30, 0))
