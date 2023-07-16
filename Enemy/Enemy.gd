extends KinematicBody2D
var Vel = Vector2.ZERO
var Speed = 150
var path: Array = []
var NavNode = null
var player = null
var enemy = null
func _ready():
	if get_tree().has_group("Nav"): #Check if the Nav Group is within the scene
		NavNode = get_tree().get_nodes_in_group("Nav")[0] #Add Nav Group to the Array
	if get_tree().has_group("Player"): #Check if the Nav Group is within the scene
		player = get_tree().get_nodes_in_group("Player")[0] #Add Player Group to the Array
func _physics_process(delta):
	CreatePath()
	Goto()
	Vel = move_and_slide(Vel)

func CreatePath():
	if NavNode != null && player !=null:
		#Creates a path and a position to the array and go the area in a array
		path = NavNode.get_simple_path(global_position, player.global_position, false)
func Goto(): #Go the path of the player has taken
	if path.size() > 0:
		Vel = global_position.direction_to(path[1]) * Speed
