extends KinematicBody2D

var presenter: PlayerPresenter

func _ready():
	presenter = preload("res://src/Modules/Player/Presenter/player_presenter.gd").new(self)

func _process(delta):
	
	presenter.on_move(delta)
