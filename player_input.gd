class_name PlayerInput
extends Node
var direction = Input.get_axis("left","right")

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "jump", "unlock")
