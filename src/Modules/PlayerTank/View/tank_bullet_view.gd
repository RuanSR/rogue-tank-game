extends Area2D

var tank_bullet_presenter: TankBulletPresenter

var enums = preload("res://src/Modules/PlayerTank/@Shared/enums.gd")

func init(bullet_direction: Vector2):
	_set_node_config()
	tank_bullet_presenter = preload("res://src/Modules/PlayerTank/Presenter/tank_bullet_presenter.gd").new(self, bullet_direction)

func _ready() -> void:
	tank_bullet_presenter.add_in_group_list(enums.Barrel_Bullet_State_Group.CANNON_BULLETS)
 
func _process(delta: float) -> void:
	tank_bullet_presenter.on_fire()

func _on_BulletVisibilityNotifier2D_screen_exited():
	queue_free()

func _set_node_config() -> void:
	var default_rotation_degrees = 90
	
	$BulletCollisionShape2D.set_rotation_degrees(90)
	$BulletSprite2D.set_rotation_degrees(90)
