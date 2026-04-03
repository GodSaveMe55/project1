extends StaticBody2D


func _process(_delta):
	if GameManager.health == 3:
		$AnimatedSprite2D.play("3hearts")
	elif GameManager.health == 2:
		$AnimatedSprite2D.play("2hearts")
	elif GameManager.health == 1:
		$AnimatedSprite2D.play("1heart")
	elif GameManager.health == 0:
		$AnimatedSprite2D.play("0heart")
