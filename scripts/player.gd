extends KinematicBody

func _ready():
	GlobalSignals.connect("speed_power", self, "_speed_power")
	GlobalSignals.connect("bed_speed", self, "_bed_speed")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	captured = true

export var speed = 10
export var accel = 10
export var gravity = 50
export var jump = 20


var look_rotation: Vector3 = Vector3.ZERO
onready var head: Spatial = $"%head"

var move_dir = Vector3.ZERO
var velocity = Vector3.ZERO


var max_angle:float = 80.0
var min_angle:float = -80.0

export var sensitivity: float = 0.2


var captured: bool = true

func _speed_power():
	speed += 10

func _bed_speed():
	speed -= 5

func _physics_process(delta):
	
	head.rotation_degrees.x = look_rotation.x
	rotation_degrees.y = look_rotation.y
	
#	if not is_on_floor():
	velocity.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump
	
	move_dir = Vector3(Input.get_axis("left", "right"), 0, Input.get_axis("forward", "back")).normalized().rotated(Vector3.UP, rotation.y)
	
	
	velocity.x = lerp(velocity.x, move_dir.x * speed, accel * delta)
	velocity.z = lerp(velocity.z, move_dir.z * speed, accel * delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		if captured:
			captured = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			captured = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
	if not captured:
		return
	
	if event is InputEventMouseMotion:
		look_rotation.y -= event.relative.x * sensitivity
		look_rotation.x -= event.relative.y * sensitivity
		look_rotation.x = clamp(look_rotation.x, min_angle, max_angle)



