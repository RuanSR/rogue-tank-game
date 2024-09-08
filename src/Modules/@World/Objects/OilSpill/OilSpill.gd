extends Area2D

var oil_utils: OilUtils = OilUtils.new()

func _on_OilSpill_body_entered(body):
	add_to_group(oil_utils.get_named_group_schema(str(body)))

func _on_OilSpill_body_exited(body):
	remove_from_group(oil_utils.get_named_group_schema(str(body)))
