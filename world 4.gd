extends Control

func _ready():
	visible = false
	get_tree().paused = false

func resume():
	get_tree().paused = false
	visible = false
	
func pause():
	visible = true
	get_tree().paused = true

func ESC():
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true


func _on_resume_pressed() -> void:
	resume()
func _process(_delta):
	ESC()
