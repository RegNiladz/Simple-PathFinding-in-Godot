extends KinematicBody2D
var Vel = Vector2.ZERO
var Speed = 150
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	Vel = Vector2.ZERO
	Inputs()
	Vel = move_and_slide(Vel * Speed )

func Inputs():
	if Input.is_action_pressed("ui_left"):
		Vel.x -= 1
	if Input.is_action_pressed("ui_right"):
		Vel.x += 1
	if Input.is_action_pressed("ui_up"):
		Vel.y -= 1
	if Input.is_action_pressed("ui_down"):
		Vel.y += 1
