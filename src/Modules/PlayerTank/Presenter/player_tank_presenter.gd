class_name PlayerPresenter

var _acceleration: int = 0

var _view: PlayerBase

var _model: PlayerModel

var _common: CommonPlayer = CommonPlayer.new()
var oil_utils: OilUtils = OilUtils.new()

var _self_ref: String

var travel = 0

func _init(tank_view: PlayerBase):
	self._view = tank_view

	_self_ref = str(self._view)
	
	InjectModel.load_model_dependency(self._view)

	_model = PlayerModel.new()


func _add_travel(move: Vector2) -> void:
	travel += move.length() * _view.get_physics_process_delta_time()
	
	# _model.tank_body_sprite.texture.get_size().y: 
	# Pega o tamanho do body, para adcionar a trilha apos o carro andar
	if(travel > _model.tank_body_sprite.texture.get_size().y):
		travel = 0
		var track = _model._prefab_track.instance()
		var travelToPixelsBack = Vector2(cos(_view.rotation), sin(_view.rotation)).normalized() * 5
		
		track.global_position = _view.global_position - travelToPixelsBack
		track.rotation = _view.rotation
		track.z_index = _view.z_index - 1
		_view.get_parent().add_child(track)

func on_move() -> void:
	var direction_value := 0
	
	if (Input.is_action_pressed("ui_up")):
		direction_value += 1;
	
	if (Input.is_action_pressed("ui_down")):
		direction_value -= 1;
	
	if (direction_value == 0):
		direction_value = -Input.get_joy_axis(0, JOY_AXIS_1)
	
	_acceleration = lerp(_acceleration, _model.MAX_SPEED * direction_value, .03)
	
	var variation_velocity: float = 1
	if (_view.get_tree().get_nodes_in_group(oil_utils.get_named_group_schema(str(_view)))):
		variation_velocity = .3
	
	var _linear_velocity: Vector2 = _view.move_and_slide(Vector2(cos(_view.rotation), sin(_view.rotation)) * _acceleration * variation_velocity)
	
	_add_travel(_linear_velocity)
	
	pass

func on_rotate() -> void:

	var rot = 0

	if (Input.is_action_pressed("ui_right")):
		rot += 1;
	
	if (Input.is_action_pressed("ui_left")):
		rot -= 1;
	
	if (rot == 0):
		rot = Input.get_joy_axis(0, JOY_AXIS_0)
	
	_view.rotate(_model.ROTATION_VELOCITY * rot * _view.get_physics_process_delta_time())
