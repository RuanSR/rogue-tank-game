class_name TankBulletView
extends BulletBase

var _presenter: TankBulletPresenter
var _common_player: CommonPlayer

onready var _bullet_direction: Vector2
onready var _parent_reference: String

func _ready() -> void:
	_presenter = TankBulletPresenter.new(self, _bullet_direction, global_position)
	
	_presenter.add_in_group_list(_common_player.Barrel_Bullet_State_Group.CANNON_BULLETS + _parent_reference)
 
func _process(_delta: float) -> void:
	
	if (_presenter.bullet_is_alive()):
		_presenter.on_fire()

func _on_BulletVisibilityNotifier2D_screen_exited():
	queue_free()

func init(bullet_direction: Vector2, parent_reference: String):
	_common_player = CommonPlayer.new()
	self._bullet_direction = bullet_direction
	self._parent_reference = parent_reference

	InjectModel.load_model_dependency(self)

func _on_TankBullet_body_entered(body) -> void:
	var collider_player_bullet_layer = 4

	if (body.collision_layer == collider_player_bullet_layer):
		_presenter.destroy_bullet()
