tool
class_name BarrelView extends Node2D


export var bullet_limit_shot: int = 5 setget set_bullet_limit_shot, get_bullet_limit_shot

func set_bullet_limit_shot(value: int):
	bullet_limit_shot = value

func get_bullet_limit_shot():
	return bullet_limit_shot

export var path_skins: String
export var selected_skin_index: int = 0 setget set_selected_skin_index

func set_selected_skin_index(value: int):
	selected_skin_index = value

var _presenter: BarrelPresenter

func _ready():
	$TankBarrelSprite.set_texture($BarrelSkinManager.get_sprite_texture())
	_presenter = BarrelPresenter.new(self)

func _init():
	InjectModel.load_model_dependency(self)

func _physics_process(_delta):
	if (Engine.is_editor_hint()):
		$TankBarrelSprite.set_texture($BarrelSkinManager.get_sprite_texture())
		return
	
	on_shot()
	look_at(get_global_mouse_position())

func on_shot() -> void:
	if (Input.is_action_just_pressed("ui_shoot")):
		_presenter.on_shot()

