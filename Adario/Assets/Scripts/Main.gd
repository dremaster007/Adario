extends Node

export (Vector2) var map_size

var spawn_size

var is_playing = false

export (PackedScene) var ScoreNode
onready var player = get_node("Player")

func _ready():
	spawn_size = map_size.x * map_size.y

func _process(delta):
	for score in spawn_size:
		score = ScoreNode.instance()
		$PointContainer.add_child(score)
		score.position = Vector2(rand_range(0, map_size.x), rand_range(0, map_size.y))
	if is_playing == true:
		icon_size_change()

func icon_size_change():
	if player.size > Vector2(2, 2):
		for child in $PointContainer.get_children():
			child.scale = player.size * Vector2(0.5, 0.5)