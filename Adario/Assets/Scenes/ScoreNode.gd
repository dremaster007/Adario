extends Area2D

func _ready():
	$CollisionShape2D.disabled = true

func _on_Timer_timeout():
	$CollisionShape2D.disabled = false
