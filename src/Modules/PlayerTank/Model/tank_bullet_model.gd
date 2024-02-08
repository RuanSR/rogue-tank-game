class_name TankBulletModel

const bullet_velocity: int = 400
var bullet_direction: Vector2 = Vector2(0, -1) setget set_bullet_direction

var bullet_collision_shape: CollisionShape2D
var bullet_sprite: Sprite
var bullet_visibility_notifier: VisibilityNotifier2D

func _init(bullet_collision_shape: CollisionShape2D, bullet_sprite: Sprite, bullet_visibility_notifier: VisibilityNotifier2D, bullet_direction: Vector2):
	self.bullet_direction = bullet_direction
	self.bullet_collision_shape = bullet_collision_shape
	self.bullet_sprite = bullet_sprite
	self.bullet_visibility_notifier = bullet_visibility_notifier
	

func set_bullet_direction(new_direction: Vector2) -> void:
	bullet_direction = new_direction
