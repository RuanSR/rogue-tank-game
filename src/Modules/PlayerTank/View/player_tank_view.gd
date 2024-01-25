extends KinematicBody2D

var player_presenter: PlayerPresenter
var bullet_muzzle: Position2D

func _ready():
	player_presenter = preload("res://src/Modules/PlayerTank/Presenter/player_tank_presenter.gd").new(self)

func _process(delta):
	
	player_presenter.on_move()
	player_presenter.on_shoot()
