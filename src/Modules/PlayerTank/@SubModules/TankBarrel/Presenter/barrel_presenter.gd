class_name BarrelPresenter

const LEFT_JOY_DEAD_ZORE: float = 0.02
const RIGTH_JOY_DEAD_ZONE: float = .95

const _prefab_bullet: PackedScene = preload ("res://src/Modules/PlayerTank/@SubModules/TankBullet/View/TankBullet.tscn")

var _model: BarrelModel
var _self_ref: String
var _common: CommonPlayer = CommonPlayer.new()
var _view

func _init(_view):
	self._view = _view
	_self_ref = str(self._view)
	
	InjectModel.load_model_dependency(_view)
	_model = BarrelModel.new()

func on_shot() -> void:
	if (_is_shot_limit_reachead()):
		return
	
	var bullet: TankBulletView = _prefab_bullet.instance()
	var muzzle: Position2D = _model.bullet_muzzle_position
	
	var direction: Vector2 = Vector2(cos(_model.tank_barrel_node.global_rotation), sin(_model.tank_barrel_node.global_rotation)).normalized()
	
	bullet.init(direction, _self_ref)
	
	bullet.global_position = muzzle.global_position
	
	if(_view.get_parent().get_parent() != null):
		#runing global scene
		_view.get_parent().get_parent().add_child(bullet)
	else:
		#runing local scene
		_view.get_parent().add_child(bullet)
	
	_model.bullet_shot_animation_player.play("on_fire")
	_model.tank_barrel_sprite.set_rotation_degrees(_common.DEFAULT_ROTATION_DEGREES)
	_model.bullet_muzzle_position.set_position(Vector2(30, 0))
	_model.bullet_shot_sprite.set_position(Vector2(37, 0))
	_model.bullet_shot_sprite.set_rotation_degrees( - 90)

func _is_shot_limit_reachead() -> bool:
	var allow_shot = true
	
	if (_view.get_tree().get_nodes_in_group(_common.Barrel_Bullet_State_Group.CANNON_BULLETS + _self_ref).size() >= _model.bullet_limit_shot):
		return allow_shot
		
	return !allow_shot

func on_barrel_move():
	
	if (_view.can_mouse_look):
		_on_mouse_move()
	
	_on_joy_stick_move()

func _on_joy_stick_move() -> void:
	var r_hor_axis = -Input.get_joy_axis(0, JOY_AXIS_2)
	
	if (abs(r_hor_axis) < LEFT_JOY_DEAD_ZORE):
		r_hor_axis = 0
	
	var r_ver_axis = -Input.get_joy_axis(0, JOY_AXIS_3)
	
	if (abs(r_ver_axis) < LEFT_JOY_DEAD_ZORE):
		r_ver_axis = 0

	if (r_hor_axis != 0 and r_ver_axis != 0):
		var vector = Vector2(r_hor_axis, r_ver_axis)
		if (vector.length() > RIGTH_JOY_DEAD_ZONE):
			_view.global_rotation = vector.normalized().angle()
			_view.can_mouse_look = false

func _on_mouse_move() -> void:
	_view.look_at(_view.get_global_mouse_position())
