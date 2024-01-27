class_name TankBulletPresenter

var tank_bullet_view: Area2D
var tank_bullet_model: TankBulletModel

func _init(tank_bullet_view: Area2D) -> void:
	self.tank_bullet_view = tank_bullet_view
	tank_bullet_model = preload("res://src/Modules/PlayerTank/Model/tank_bullet_model.gd").new()

func on_fire(delta: float) -> void:
	tank_bullet_view.translate(tank_bullet_model.bullet_direction * tank_bullet_model.bullet_velocity * delta)

func add_in_group_list(group_name: String):
	tank_bullet_view.add_to_group(group_name)
