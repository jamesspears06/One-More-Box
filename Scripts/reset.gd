extends Control

@export var  self_scene:PackedScene
func _ready() -> void:
	self_scene = preload("res://Scenes/levels/level_2.tscn")
	size = get_viewport_rect().size



func _on_button_button_down() -> void:
	get_tree().change_scene_to_packed(self_scene)
	
