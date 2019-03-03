extends KinematicBody2D

var speed = 5000
var direction = 1
var velocity = Vector2(0,0)
var distance = 200
var current_pos = Vector2(0,0)
var start_pos = Vector2(0,0)

func _ready():
	
	self.start_pos = self.get_position()
	pass # Replace with function body.


func _physics_process(delta):
	
	
	velocity.x = direction * speed * delta
	
	move_and_slide(velocity, Vector2(0,0))
	
	self.current_pos = self.get_position()
	
	var current_dist = self.current_pos.x - self.start_pos.x
	
	if (current_dist>=distance) or (current_dist<=0): direction = -direction
	
	pass
