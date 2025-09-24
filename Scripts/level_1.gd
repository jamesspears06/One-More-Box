extends Node2D
@onready var controller: RigidBody2D = $Controller
@onready var ceiling_fan: Sprite2D = $CeilingFan
@onready var cpu_particles_2d: CPUParticles2D = $Controller/CPUParticles2D
@export var next_level:PackedScene



	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() =="Controller":
		cpu_particles_2d.emitting=true
		$Controller/Sprite2D.visible=false
		await  cpu_particles_2d.finished
		controller.queue_free()
	get_tree().change_scene_to_packed(next_level)
