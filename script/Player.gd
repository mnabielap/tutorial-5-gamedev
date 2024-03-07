extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var dash_speed = 800  # Kecepatan dash
export (float) var dash_duration = 0.2  # Durasi dash dalam detik
export (int) var GRAVITY = 1200
export (int) var max_jumps = 2
const Meteor = preload("res://scenes/Meteor.tscn")

const UP = Vector2(0, -1)

var velocity = Vector2()
var jumps = 0
var is_dashing = false
var dash_timer = 0

func get_input():
	var animation = "diri_kanan"
  
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed('up'):
		velocity.y = jump_speed
		animation = "lompat_kanan"
		if !$JumpSound.playing:
			$JumpSound.play()
	if Input.is_action_pressed('right'):
		velocity.x += speed
		animation = "jalan_kanan"
		if !$WalkSound.playing:
			$WalkSound.play()
	if Input.is_action_pressed('left'):
		velocity.x -= speed
		animation = "jalan_kiri"
		if !$WalkSound.playing:
			$WalkSound.play()
  
	if $AnimatedSprite.animation != animation:
		$AnimatedSprite.play(animation)
		
	if Input.is_action_just_pressed("ui_end"):
		create_new_object()

func create_new_object():
	var world_node = get_tree().get_root()
	var new_object_instance = preload("res://scenes/Meteor.tscn").instance()
	new_object_instance.position = position + Vector2(50, 0)  # Sesuaikan posisi objek baru
	world_node.add_child(new_object_instance)

func _physics_process(delta):
	velocity.y += delta * GRAVITY	
	get_input()
	velocity = move_and_slide(velocity, UP)


func _on_HitBox_body_entered(body):
	if str(body.get_name()) == "Meteor":
		if !$HitMeteor.playing:
			$HitMeteor.play()
