extends Node2D

@onready var object = get_node("RigidBody2D")
@onready var object_collider
@onready var object_sprite = object.get_node("Sprite2D")
@onready var object_button = object.get_node("Button")


@onready var card = get_node("Sprite2D")
@onready var card_button = card.get_node("Button")
@onready var card_area = card.get_node("Area2D")

@export var is_placed:= false

var is_clicked = false
var start_pos
var object_start_transform

func _ready() -> void:
	
	if object.has_node("CollisionPolygon2D"): 
		object_collider = object.get_node("CollisionPolygon2D")
	elif object.has_node("CollisionShape2D"):
		object_collider = object.get_node("CollisionShape2D")
	
	start_pos = global_position
	object_start_transform = object.transform
	
	object.freeze = true
	object.visible = false
	
	object_button.button_down.connect(object_clicked)
	card_button.button_down.connect(card_clicked)
	card_button.button_up.connect(card_unclicked)
	card_button.mouse_entered.connect(mouse_entered_card)
	card_button.mouse_exited.connect(mouse_exited_card)


func _process(delta: float) -> void:
	if is_clicked: global_position = get_global_mouse_position()


func object_clicked():
	
	card.visible = true
	object.rotation = 0
	object.visible = false
	object.freeze = true
	object_collider.disabled = true
	
	global_position = start_pos
	object.global_position = start_pos
	
	card.modulate.a = 1
	
	is_placed = false

func card_clicked():
	is_clicked = true
	card.scale *= 0.5

func card_unclicked():
	is_clicked = false
	card.scale /= 0.5
	
	card.visible = false
	object.visible = true
	object.freeze = false
	object_collider.disabled = false
	object.linear_velocity = Vector2.ZERO
	object.angular_velocity = 0
	is_placed = true
	
	
	#if card_area.has_overlapping_bodies(): 
		#global_position = start_pos
	#else: 
		#card.visible = false
		#object.visible = true
		#object.freeze = false
		#object_collider.disabled = false
		#object.linear_velocity = Vector2.ZERO
		#object.angular_velocity = 0
		#is_placed = true


func mouse_entered_card(): card.scale *= 1.2
func mouse_exited_card(): card.scale /= 1.2
