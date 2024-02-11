class_name TankBulletModel

const bullet_velocity: int = 400

onready var bullet_collision_shape: CollisionShape2D
onready var bullet_sprite: Sprite
onready var bullet_visibility_notifier: VisibilityNotifier2D
onready var bullet_smoke_particles: Particles2D
onready var bullet_self_destruction_animation_player: AnimationPlayer

var bullet_direction: Vector2 = Vector2(0, -1) setget set_bullet_direction
var _is_live: bool = true setget set_bullet_state, get_bullet_state
var _bullet_initial_position: Vector2

func _init(bullet_direction: Vector2, bullet_initial_position: Vector2):
	self.bullet_collision_shape = InjectModel.get_dependency("BulletCollisionShape")
	self.bullet_sprite = InjectModel.get_dependency("BulletSprite")
	self.bullet_visibility_notifier = InjectModel.get_dependency("BulletVisibilityNotifier")
	self.bullet_smoke_particles = InjectModel.get_dependency("BulletSmokeParticles")
	self.bullet_self_destruction_animation_player = InjectModel.get_dependency("BulletSelfDestructionAnimationPlayer")

	self.bullet_direction = bullet_direction
	_bullet_initial_position = bullet_initial_position

func set_bullet_direction(new_direction: Vector2) -> void:
	bullet_direction = new_direction

func set_bullet_state(is_live: bool) -> void:
	_is_live = is_live

func get_bullet_state() -> bool:
	return _is_live
