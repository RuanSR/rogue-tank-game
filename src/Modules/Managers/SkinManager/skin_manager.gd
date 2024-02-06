extends Node2D

export var path_skins: String
export var file_extension: String = ".png" setget set_file_extension
export var selected_index_texture: int = -1 setget set_texture_index

export var default_texture: Texture

var selected_texture: Texture
var selected_texture_name: String

var _list_of_paths: Array = []
var _list_of_name_textures: Array = []


func _ready():
	_dynamic_load_skins(path_skins)
	
	_set_selected_texture()
	_set_selected_texture_name()

func _dynamic_load_skins(path: String) -> void:
	var directory = Directory.new()
	var base_path = ProjectSettings.globalize_path(path)
	var valid_file_extension: String = _file_extension_valid_parser(file_extension)
	
	if directory.open(base_path) == OK:
		directory.list_dir_begin()
		var file_name: String = directory.get_next()
		while !file_name.empty():
			if !directory.current_is_dir() && file_name.ends_with(valid_file_extension):
				_list_of_paths.append(base_path+file_name)
				_set_list_of_name_textures(file_name)
			file_name = directory.get_next()
	else:
		print("An error occurred when trying to access the path.")

func _set_list_of_name_textures(file_name: String) -> void:
	var parsed_file_name = file_name.replace("_", " ").replace(".png", "")

	_list_of_name_textures.append(parsed_file_name)

func _file_extension_valid_parser(extension_value: String) -> String:
	if (!extension_value.begins_with(".")):
		return str("." + extension_value)
	
	return extension_value

func set_texture_index(value: int = 0) -> void:
	if (value < 0):
		selected_index_texture = 0
	
	selected_index_texture = value

func set_file_extension(value: String) -> void:
	file_extension = _file_extension_valid_parser(value)

func _set_selected_texture() -> void:
	if (selected_index_texture == -1):
		selected_texture = default_texture
		return
	
	selected_texture = load(_list_of_paths[selected_index_texture])

func _set_selected_texture_name() -> void:
	if (selected_index_texture == -1):
		selected_texture_name = default_texture.get_name()
		return
	selected_texture_name = _list_of_name_textures[selected_index_texture]

