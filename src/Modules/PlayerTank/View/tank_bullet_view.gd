extends Area2D

var tank_bullet_presenter: TankBulletPresenter

func _ready() -> void:
	tank_bullet_presenter = preload("res://src/Modules/PlayerTank/Presenter/tank_bullet_presenter.gd").new(self)

func _process(delta: float) -> void:
	tank_bullet_presenter.on_fire(delta)

