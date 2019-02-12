extends Area2D

export (int) var speed
var score = 0
var velocity = Vector2()

var player = self

onready var start_size = player.scale
var size = Vector2(0,0)

func _ready():
	size = start_size
	velocity = Vector2(0,0)

func _process(delta):
	camera_size_change()
	get_input()
	position += velocity * delta * speed

func change_size():
	size.x = start_size.x + 0.1 * score
	size.y = start_size.y + 0.1 * score
	player.scale = size
	print(size)

func camera_size_change():
	$Camera2D.zoom = size * 0.75

func get_input():
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if velocity.length() > 1:
		velocity = velocity.normalized()

func _on_Player_area_entered(area):
	if area.is_in_group("point"):
		score += 1
		change_size()
		area.queue_free()
	#if area.is_in_group("spawn"):
		#area.queue_free()
