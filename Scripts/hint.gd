extends Control
@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2
@export var hint_text:String

func _on_texture_button_pressed() -> void:
	self.visible=false

func _ready() -> void:
	rich_text_label_2.text = hint_text
