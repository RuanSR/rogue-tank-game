class_name BarrelPresenter

var _model: BarrelModel
var _view

const _prefab_bullet: PackedScene = preload ("res://src/Modules/PlayerTank/@SubModules/TankBullet/View/TankBullet.tscn")

var _self_ref: String

var _common: CommonPlayer = CommonPlayer.new()

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
