extends Node2D

export var animationName = "undefined"
func _ready():
	
	$AnimationPlayer.play(self.animationName)
	$AnimationPlayer.get_animation(self.animationName).loop = false	
	yield($AnimationPlayer, "animation_finished") 
	queue_free()
	pass
