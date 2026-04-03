extends CharacterBody2D

class_name Player

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $Sprite2D as PlayerAnimatedSprite
@onready var area_collision_shape = $"Area2D/area collision shape"
@onready var body_collision_shape = $bodycollisionshape
@onready var area_2d = $Area2D


var run_speed_damping = 0.5
var speed:float = 300.0
var jump_velocity = -425




@onready var min_stomp_degree = 35
@onready var max_stomp_degree = 145
@onready var stomp_y_velocity = -150


@onready var camera_sync: Camera2D = $Camera2D2
@onready var should_camera_sync: bool = true



func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= 0.5
		
	var direction = Input.get_axis("left","right")

	if direction:
		velocity.x = lerpf(velocity.x, speed * direction, run_speed_damping * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta)
	
	animated_sprite_2d.trigger_animation(velocity, direction)
	
	move_and_slide()
	
func _on_area_2d_area_entered(area):
	if area is Enemy:
		handle_enemy_collision(area)
		print("lalal")
	if area is Block:
		handle_block_collision(area)

func handle_block_collision(block: Block):
	if block == Block:
		die()
	

func handle_enemy_collision(enemy: Enemy):
	if enemy == null:
		return
	var angle_of_collision = rad_to_deg(position.angle_to_point(enemy.position))
	
	if angle_of_collision > min_stomp_degree && max_stomp_degree > angle_of_collision:
		enemy.die()
		on_enemy_stomped()
	elif GameManager.health > 1:
		GameManager.health -= 1
	else:
		die()
	
func on_enemy_stomped():
	velocity.y = stomp_y_velocity
	
func die():
	animated_sprite_2d.play("die")
	area_2d.set_collision_mask_value(3, false)
	set_collision_layer_value(1, false)
	set_physics_process(false)
	
	var death_tween = get_tree().create_tween()
	death_tween.tween_property(self, "position", position + Vector2(0, -48), .5)
	death_tween.chain().tween_property(self, "position", position + Vector2(0,256),1)
	death_tween.tween_callback(func (): get_tree().reload_current_scene())
	await get_tree().create_timer(1.2).timeout
	GameManager.health = 3
	
func _process(_delta):
	if global_position.x > camera_sync.global_position.x && should_camera_sync:
		camera_sync.global_position.x = global_position.x
	if global_position.x < camera_sync.global_position.x && should_camera_sync:
		camera_sync.global_position.x = global_position.x


func _on_brick_2_body_entered(_body: Node2D):
	die()
