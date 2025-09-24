extends Control


func _on_button_pressed() -> void:
	get_parent().get_node("Hint").visible = true
