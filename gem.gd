extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var main = get_tree().current_scene
		if main.has_method("add_score"):
			main.add_score(1)
			
		queue_free()
