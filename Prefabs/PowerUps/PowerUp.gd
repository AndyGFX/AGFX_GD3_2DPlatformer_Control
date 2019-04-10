extends Node

var container = null
var timer = null
var move_control = null
var new_value = null;
var in_use:bool =false
func _ready():
	pass

func Picked(_move,_container, wait_time, value):
	container = _container
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(30)
	timer.connect("timeout",self,"on_timer_complete")	
	timer.set_wait_time(wait_time)
	container.add_child(timer)	
	move_control = _move
	new_value = value
	
	
func Initialize():
	pass	