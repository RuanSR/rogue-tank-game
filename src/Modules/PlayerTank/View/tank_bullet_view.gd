extends Area2D

var _presenter: TankBulletPresenter
var _common_player: CommonPlayer

onready var BulletCollisionShape2D: CollisionShape2D = $BulletCollisionShape2D
onready var BulletSprite2D: Sprite = $BulletSprite2D
onready var BulletVisibilityNotifier2D: VisibilityNotifier2D = $BulletVisibilityNotifier2D
onready var bullet_direction: Vector2

func _ready() -> void:
	_presenter = TankBulletPresenter.new(self, self.bullet_direction)
	
	_presenter.add_in_group_list(_common_player.Barrel_Bullet_State_Group.CANNON_BULLETS)
	_presenter._set_node_config()
 
func _process(delta: float) -> void:
	_presenter.on_fire()

func _on_BulletVisibilityNotifier2D_screen_exited():
	queue_free()

func init(bullet_direction: Vector2):
	_common_player = CommonPlayer.new()
	self.bullet_direction = bullet_direction

