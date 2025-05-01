extends CharacterBody2D

var isHit = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Bullet"):
		queue_free()
	if area.is_in_group("Wall"):
		isHit = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	isHit = false

func isHitting() -> bool:
	return isHit
