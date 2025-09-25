extends Area2D
var card



func _on_button_button_down() -> void: queue_free()

func _on_tree_entered() -> void: 
	await tree_exited
	if card:
		card.object_deleted()


func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="Controller":
		body.apply_impulse(Vector2(body.linear_velocity.x * 2,-(body.linear_velocity.y * 5)))
