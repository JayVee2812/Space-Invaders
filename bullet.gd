extends CharacterBody2D

var speed = 500

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(0,-speed * delta))

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		queue_free()
	if area.is_in_group("Wall"):
		queue_free()
