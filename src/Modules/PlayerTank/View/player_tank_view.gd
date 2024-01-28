extends KinematicBody2D

var _presenter: PlayerPresenter

func _ready():
	_presenter = preload("res://src/Modules/PlayerTank/Presenter/player_tank_presenter.gd").new(self)
	
	_presenter._set_node_config()

func _process(delta):
	
	_presenter.on_move()
	_presenter.on_shoot()
	_presenter.look_at_mouse()
	
