tool
extends PlayerBase

var _presenter: PlayerPresenter

export var path_skins: String
export var selected_skin_index: int = 0

func _ready():
	_presenter = PlayerPresenter.new(self)
	
	load_selected_texture()

func _physics_process(_delta):
	
	if (_is_editor_tool()):
		return

	_presenter.on_move()
	_presenter.on_rotate()

func _draw():
	if (_is_editor_tool()):
		update()

func _is_editor_tool() -> bool:
	return Engine.editor_hint

func load_selected_texture() -> void:
	$TankBodySprite.set_texture($TankBodySkinManager.get_sprite_texture())
