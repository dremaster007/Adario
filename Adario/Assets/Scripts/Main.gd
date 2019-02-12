extends Node

export (Vector2) var map_size

var spawn_size = 0

var is_playing = true

export (PackedScene) var ScoreNode
onready var player = get_node("Player")

func _ready():
	spawn_size = (map_size.x * 0.1) * (map_size.y * 0.1)
	print(spawn_size)
	spawn_level()

func spawn_level():
	for score in range(spawn_size):
		score = ScoreNode.instance()
		$PointContainer.add_child(score)
		score.position = Vector2(rand_range(0, map_size.x), rand_range(0, map_size.y))
		yield(get_tree().create_timer(0.05), "timeout")

#My problem is that its spawing too much at oncec I think

func _process(delta):
	if is_playing == true:
		icon_size_change()

func icon_size_change():
	if player.size > Vector2(2, 2):
		for child in $PointContainer.get_children():
			child.scale = player.size * Vector2(0.5, 0.5)