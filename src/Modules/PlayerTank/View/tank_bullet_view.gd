extends Area2D

var tank_bullet_presenter: TankBulletPresenter
var enums = preload("res://src/Modules/PlayerTank/@Shared/enums.gd")

func _ready() -> void:
	tank_bullet_presenter = preload("res://src/Modules/PlayerTank/Presenter/tank_bullet_presenter.gd").new(self)
	tank_bullet_presenter.add_in_group_list(enums.Barrel_Bullet_State_Group.CANNON_BULLETS)
	
	
func _process(delta: float) -> void:
	tank_bullet_presenter.on_fire(delta)

func _on_BulletVisibilityNotifier2D_screen_exited():
	queue_free()

