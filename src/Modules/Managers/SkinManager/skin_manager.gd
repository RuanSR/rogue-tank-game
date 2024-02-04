extends Node2D

export var path_skins: String
export var file_extension: String = ".png"
export var skin_index: int

var selected_skin: Texture 

func _ready():
	
	var list = dynamic_load_skins(path_skins, file_extension)
	
	selected_skin = load(list[skin_index])
	

func dynamic_load_skins(path: String, file_extension: String) -> Array:
	
	if (!file_extension.begins_with(".")):
		str("." + file_extension)
	
	var base_path = ProjectSettings.globalize_path(path)
	
	var list_of_paths: Array = []
	
	var dir = Directory.new()
	
	if dir.open(base_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() && file_name.ends_with(file_extension):
				list_of_paths.append(base_path+file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
	return list_of_paths
