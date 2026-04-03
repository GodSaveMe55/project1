extends Area2D

var entered = false

func _on_body_entered(body: Player):
	entered = true
	
func _process(delta):
	if entered == true:
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = "res://levels/world_" + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
