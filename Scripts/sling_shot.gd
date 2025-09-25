extends Node2D
var controller
var controller_in_area = false





var dir
enum SlingState {
	idle,
	pulling,
	thrown,
	reset
}

@onready var sling_icon: Sprite2D = $slingIcon

var angle
var sling_shot_state
var leftline
var rightline
@onready var penter_of_sling: Marker2D = $CenterOfSlingShot
var center_of_sling_shot:Vector2





func _ready() -> void:
	sling_shot_state = SlingState.idle
	center_of_sling_shot= penter_of_sling.global_position
	leftline = $LeftLine
	rightline=$RightLine
	leftline.points[1] = (penter_of_sling.global_position)
	rightline.points[1]= (penter_of_sling.global_position)
	#print("Angle in degrees: ", rad_to_deg(angle))



func _process(_delta: float) -> void:
	
	match sling_shot_state:
		SlingState.idle:
			pass
		SlingState.pulling:
			if Input.is_action_pressed("left_click"):
				var distance =get_global_mouse_position()
				if distance.distance_to(penter_of_sling.global_position) >200:
					
					distance = (distance - penter_of_sling.global_position).normalized()*200 + penter_of_sling.global_position

					
					
				if controller:
					controller.global_position = distance

				
			else:
				var location =get_global_mouse_position()
				var distance = location.distance_to(center_of_sling_shot)
				var velocity = (center_of_sling_shot - location).normalized() *1000
				if controller:
					controller.freeze=false
					controller.apply_impulse(velocity/200 * distance)
				sling_shot_state= SlingState.thrown
				leftline.points[1] = penter_of_sling.position
				rightline.points[1]= penter_of_sling.position
				
		SlingState.thrown:
			sling_shot_state = SlingState.idle
			controller_in_area = false
		SlingState.reset:
			pass
		
		
	


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if sling_shot_state==SlingState.idle:
		
		if(event is InputEventMouseButton && event.pressed):
			if controller_in_area:
				sling_shot_state= SlingState.pulling
	


func _on_equip_area_body_entered(body: Node2D) -> void:
	if body.get_name()=="Controller":
		controller_in_area = true
		controller = get_parent().get_node("Controller")
		controller.set_deferred("freeze",true)
		var tween = create_tween().set_ease(Tween.EASE_IN).set_parallel()
		tween.tween_property(controller,"rotation_degrees",controller.rotation_degrees+270,1)
		tween.tween_property(controller,"global_position",center_of_sling_shot,1)
	
