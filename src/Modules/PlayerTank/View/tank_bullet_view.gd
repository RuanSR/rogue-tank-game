extends Area2D

var _presenter: TankBulletPresenter

var _common_player: CommonPlayer

func init(bullet_direction: Vector2):
	_common_player = preload("res://src/Modules/PlayerTank/@Shared/common_player.gd").new()
	_presenter = preload("res://src/Modules/PlayerTank/Presenter/tank_bullet_presenter.gd").new(self, bullet_direction)
	
	_presenter._set_node_config()

func _ready() -> void:
	_presenter.add_in_group_list(_common_player.Barrel_Bullet_State_Group.CANNON_BULLETS)
 
func _process(delta: float) -> void:
	_presenter.on_fire()

func _on_BulletVisibilityNotifier2D_screen_exited():
	queue_free()

