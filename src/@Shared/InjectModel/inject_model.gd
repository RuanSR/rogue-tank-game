class_name InjectModel

const _models_dependency_injectable = {}

static func load_model_dependency(viewer_node: Node, name_list_of_nodes_in_view: Array = []) -> void:
	var dependency_dictionary: Dictionary = {}
	
	var name_list_of_nodes: Array = []
	
	var all_nodes_in_node_parent = viewer_node.get_children()
	for node in all_nodes_in_node_parent:
		name_list_of_nodes.append(node.get_name())
	
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
	
	_models_dependency_injectable.merge(dependency_dictionary)

static func get_dependency(name_of_dep: String):
	if (_models_dependency_injectable.has(name_of_dep)):
		var dependecy = _models_dependency_injectable.get(name_of_dep)
		_models_dependency_injectable.erase(name_of_dep)

		return dependecy
