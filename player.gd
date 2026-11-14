extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var JUMP_COUNT = 0
var MAX_JUMP = 2


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		JUMP_COUNT=0
	# Handle jump.
	if Input.is_action_just_pressed("up") and JUMP_COUNT < MAX_JUMP:
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT += 1
		




	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
