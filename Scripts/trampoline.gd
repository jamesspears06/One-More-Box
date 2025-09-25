extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="Controller":
		body.apply_impulse(Vector2(body.linear_velocity.x * 2,-(body.linear_velocity.y * 5)))
