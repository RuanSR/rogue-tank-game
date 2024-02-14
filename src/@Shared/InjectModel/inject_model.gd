class_name InjectModel

const _models_dependency_injectable = {}

static func _scan_nodes(node_tree)-> Array:
	var name_list_of_nodes: Array = []

	for node in node_tree.get_children():
		name_list_of_nodes.append(node.get_name())
		if (node.get_child_count() != 0):
			name_list_of_nodes.append_array(_scan_nodes(node))
	
	return name_list_of_nodes

static func _add_self_node_in_dependency(viewer_node) -> Dictionary:
	var dependency_dictionary: Dictionary = {}

	var self_node_name = viewer_node.get_name()

	dependency_dictionary.keys().append(self_node_name)
	dependency_dictionary[self_node_name] = viewer_node

	return dependency_dictionary

static func load_model_dependency(viewer_node, name_list_of_nodes_in_view: Array = []) -> void:
	var dependency_dictionary: Dictionary = {}
	
	var name_list_of_nodes: Array =  _scan_nodes(viewer_node)
	if (name_list_of_nodes_in_view.size() == 0):
		for node_name in name_list_of_nodes:
			dependency_dictionary.keys().append(node_name)
			dependency_dictionary[node_name] = viewer_node.find_node(node_name)
	else:
		for node_name in name_list_of_nodes:
			for name_of_node_model in name_list_of_nodes_in_view:
				if (node_name == name_of_node_model):
					dependency_dictionary.keys().append(name_of_node_model)
					dependency_dictionary[name_of_node_model] = viewer_node.find_node(name_of_node_model)
	
	dependency_dictionary.merge(_add_self_node_in_dependency(viewer_node))
	_models_dependency_injectable.merge(dependency_dictionary)

static func get_dependency(name_of_dep: String):
	if (_models_dependency_injectable.has(name_of_dep)):
		var dependecy = _models_dependency_injectable.get(name_of_dep)
		var _erased = _models_dependency_injectable.erase(name_of_dep)

		return dependecy
