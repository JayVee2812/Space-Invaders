extends CharacterBody2D

var speed = 30
var down_step = 10
var acc
var direction = 1  # 1 = right, -1 = left
var descend = false

var kids_total

func _ready() -> void:
	kids_total = $EnemyArea/Enemies.get_child_count()
	acc = speed

func _physics_process(delta: float) -> void:
	var kids = $EnemyArea/Enemies.get_child_count()
	
	if kids < kids_total * 0.75:
		acc = speed + 30
	if kids < kids_total * 0.5:
		acc = acc + 30
	if kids < kids_total * 0.25:
		acc = acc + 30
	if kids < 2:
		acc = 500
	
	descend = false
	for enemy in $EnemyArea/Enemies.get_children():
		if enemy.isHitting():
			direction *= -1
			descend = true
			break
	
	# Move the entire group
	var move = Vector2(acc * delta * direction, 0)
	if descend:
		move.y += down_step
	move_and_collide(move)
