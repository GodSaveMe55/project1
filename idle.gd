extends State
@onready var progress_bar = owner.find_child("ProgressBar")
@onready var collision = $"../../playerdetect/CollisionShape2D"

var player_entered: bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		progress_bar.set_deferred("visible", value)

func _ready():
	player_entered = false
func _on_playerdetect_body_entered(_body):
	player_entered = true
func transition():
	if player_entered:
		get_parent().change_state("follow")
