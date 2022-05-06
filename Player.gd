extends Area2D

export var speed = 150
export var spee = 360
var tagx = 2
var direction = Vector2.ZERO
var x

func _ready():
	set_process_input(true)

func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		tagx = 1
		rotation_degrees += speed*delta
		x = rotation_degrees as int
		print(x)
	
	
	if Input.is_key_pressed(KEY_LEFT):
		tagx = 1
		rotation_degrees -= speed*delta
		x = rotation_degrees as int
		print(x)
	
	
	if Input.is_action_just_released("ui_right",true):
		tagx = 0
	
	if Input.is_action_just_released("ui_left",true):
		tagx = 0
	
	if tagx == 0:
		direction = Vector2.UP.rotated(deg2rad(x)).normalized()#.rotated(rotation_degrees)
		position += direction * spee* delta
	
	########################################################

		
	
	if position.x < 0 || position.x >= 1920 || position.y < 0 || position.y >= 1080:
		get_tree().paused = true
