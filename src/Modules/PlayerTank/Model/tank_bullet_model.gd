class_name TankBulletModel

const bullet_velocity: int = 400

var bullet_collision_shape: CollisionShape2D
var bullet_sprite: Sprite
var bullet_visibility_notifier: VisibilityNotifier2D

var bullet_direction: Vector2 = Vector2(0, -1) setget set_bullet_direction
var _is_live: bool = true setget set_bullet_state, get_bullet_state
var _bullet_initial_position: Vector2

func _init(bullet_collision_shape: CollisionShape2D, bullet_sprite: Sprite, bullet_visibility_notifier: VisibilityNotifier2D, bullet_direction: Vector2, bullet_initial_position: Vector2):
	self.bullet_collision_shape = bullet_collision_shape
	self.bullet_sprite = bullet_sprite
	self.bullet_visibility_notifier = bullet_visibility_notifier
	self.bullet_direction = bullet_direction
	_bullet_initial_position = bullet_initial_position
	

func set_bullet_direction(new_direction: Vector2) -> void:
	bullet_direction = new_direction

func set_bullet_state(is_live: bool) -> void:
	_is_live = is_live

func get_bullet_state() -> bool:
	return _is_live
