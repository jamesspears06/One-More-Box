extends Control

func _ready() -> void:
	var s = get_viewport_rect().size
	self.set_deferred("size",s)



func _on_button_button_down() -> void:
	get_tree().reload_current_scene()
	
