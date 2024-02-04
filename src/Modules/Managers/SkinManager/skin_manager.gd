extends Node2D

export var path_skins: String
export var file_extension: String = ".png" setget set_file_extension
export var texture_index: int = 0 setget set_texture_index

var selected_texture: Texture
var selected_texture_name: String

var _list_of_paths: Array = []
var _list_of_name_textures: Array = []

func _ready():
	_dynamic_load_skins(path_skins)
	
	selected_texture = load(_list_of_paths[texture_index])
	selected_texture_name = _list_of_name_textures[texture_index]

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
		texture_index = 0
	
	texture_index = value 

func set_file_extension(value: String) -> void:
	file_extension = _file_extension_valid_parser(value)
