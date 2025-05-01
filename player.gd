extends CharacterBody2D


const SPEED = 500
var bullet = preload("res://bullet.tscn")
var is_Shooting = true
var screen_Size
var counter = 0
var group = 0

func _ready() -> void:
	screen_Size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	position = position.clamp(Vector2.ZERO - Vector2(-30,0),screen_Size - Vector2(30,0))
	
	group = get_tree().get_nodes_in_group("BullNode").size()
	
	if Input.is_action_just_pressed("ui_accept") && group < 3 :
		shoot()


func shoot():
	var instance = bullet.instantiate()
	instance.position = position - Vector2(0,50)
	add_child(instance)
	instance.add_to_group("BullNode")
	
	

	
