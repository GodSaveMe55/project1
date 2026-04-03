extends Area2D

@onready var anim = $AnimatedSprite2D





func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		anim.play("saved")
		await get_tree().create_timer(1.0).timeout
		handle_release()
		GameManager.score += 1
func handle_release():
	self.queue_free()
