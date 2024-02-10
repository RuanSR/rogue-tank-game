extends Area2D

var _presenter: TankBulletPresenter
var _common_player: CommonPlayer

onready var BulletCollisionShape2D: CollisionShape2D = $BulletCollisionShape2D
onready var BulletSprite2D: Sprite = $BulletSprite2D
onready var BulletVisibilityNotifier2D: VisibilityNotifier2D = $BulletVisibilityNotifier2D
onready var BulletSmokeParticles2D: Particles2D = $BulletSmokeParticles2D
onready var BulletSelfDestructionAnimationPlayer: AnimationPlayer = $BulletSelfDestructionAnimationPlayer

onready var bullet_direction: Vector2
onready var parent_reference: String
onready var bullet_initial_position: Vector2 = global_position

var live: bool = true

func _ready() -> void:
	_presenter = TankBulletPresenter.new(self, self.bullet_direction, global_position)
	
	_presenter.add_in_group_list(_common_player.Barrel_Bullet_State_Group.CANNON_BULLETS+parent_reference)
 
func _process(delta: float) -> void:
	
	if (_presenter.bullet_is_alive()):
		_presenter.on_fire()

func _on_BulletVisibilityNotifier2D_screen_exited():
	queue_free()

func init(bullet_direction: Vector2, parent_reference: String):
	_common_player = CommonPlayer.new()
	self.bullet_direction = bullet_direction
	self.parent_reference = parent_reference


func _on_TankBullet_body_entered(body: Node2D):
	if (body.collision_layer == 4):
		_presenter.destroy_bullet()
