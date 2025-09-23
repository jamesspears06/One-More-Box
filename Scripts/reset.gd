extends Control

func _ready() -> void:
	size = get_viewport_rect().size



func _on_button_button_down() -> void:
	get_tree().reload_current_scene()
	
