extends RigidBody2D
class_name Item
var card



func _on_button_button_down() -> void: queue_free()

func _on_tree_entered() -> void: 
	await tree_exited
	if card:
		card.object_deleted()
