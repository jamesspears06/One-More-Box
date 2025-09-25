extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.get_name()=="Fork":
		body.set_deferred("freeze",true)
		
