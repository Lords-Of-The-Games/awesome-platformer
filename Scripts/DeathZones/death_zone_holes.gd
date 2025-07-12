extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player has entered the death zone!")
		body.position = Vector2(0, -400)
