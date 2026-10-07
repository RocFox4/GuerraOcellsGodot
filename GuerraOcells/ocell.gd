extends RigidBody2D

var CurrentPosition = Vector2()
var DeltaTime = GuerraOcells.interval-1
var lastthrow = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	# Disable gravity
	gravity_scale = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DeltaTime = DeltaTime + delta
	if  (DeltaTime - lastthrow) >= GuerraOcells.interval or Input.is_action_just_pressed("right_click"):
		reset_position()
		if Input.is_action_just_pressed("left_click"):
			llença_ocell()
	if position.x == 0:
		if get_global_mouse_position().y >= GuerraOcells.Ymax-50:
			CurrentPosition = Vector2(0,GuerraOcells.Ymax-50)
			position = CurrentPosition
			global_translate(CurrentPosition - position)
		elif get_global_mouse_position().y < 50:
			CurrentPosition = Vector2(0,50)
			position = CurrentPosition
			global_translate(CurrentPosition - position)
# Function to reset the ball's position and velocities
func reset_position():
	gravity_scale = 0
	linear_velocity = Vector2()
	angular_velocity = 0
	rotation = 0
	CurrentPosition = Vector2(0, get_global_mouse_position().y)
	position = CurrentPosition
	global_translate(CurrentPosition - position)

# Function to launch the ball with a random angle and specified impulse
func llença_ocell():
	gravity_scale = 1
	var randomAngle = randf_range(GuerraOcells.angleMin, GuerraOcells.angleMax)  # Calculate random angle
	var angleInRadians = deg_to_rad(randomAngle)  # Convert angle to radians
	var impulseVector = Vector2(cos(angleInRadians), -sin(angleInRadians)) * GuerraOcells.impuls  # Calculate impulse vector
	apply_central_impulse(impulseVector)
	lastthrow = DeltaTime


func _on_jugar_pressed():
	set_process_input(true)
	set_process(true)
	reset_position()
	show() 
	
func _on_comptador_timeout():
	set_process_input(false)
	set_process(false)
	hide() 


func _on_body_entered(body):
	if body.name == "ocell2": 
		reset_position()
