extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var new_speed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_enter")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_body_enter(other_body):
	print(other_body.name)
	pass
