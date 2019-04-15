extends Area2D

var is_opened:bool = false
var state_open = null
var state_close = null
var enable_use_key:bool = false
var items:Array = [];

export (Array,PackedScene) var itemsList
export (bool) var need_key
export (String) var key_name = "undefined"

func _ready():
	self.state_open = $OPENED
	self.state_close = $CLOSED
		
	self.items.append($OPENED/ItemsORIGIN/Position2D1)
	self.items.append($OPENED/ItemsORIGIN/Position2D2)
	self.items.append($OPENED/ItemsORIGIN/Position2D3)
	self.items.append($OPENED/ItemsORIGIN/Position2D4)
	
	for i in range(4):
		
		var item_id = randi()%4
		var new_item = self.itemsList[item_id].instance()
		self.items[i].add_child(new_item)
		new_item.set_owner(self.items[i])
	
	
	pass


func _process(delta):
	if self.enable_use_key:
		if Input.is_action_just_pressed("key_use"):
			if (self.is_opened):
				self.Chest_Close()
			elif (self.is_opened):
				self.Chest_Open()
		pass
	pass


func _on_Chest_body_entered(body):
	
	if (body.is_in_group("PLAYER")):
		print("Player ENTER")
		self.enable_use_key = true
	pass # Replace with function body.


func _on_Chest_body_exited(body):
	if (body.is_in_group("PLAYER")):
		print("Player EXIT")
		self.enable_use_key = false
	pass # Replace with function body.


func Chest_Open():
	self.state_close.visible = false
	self.state_open.visible = true
	self.is_opened = true
	pass
	
func Chest_Close():
	self.state_close.visible = true
	self.state_open.visible = false
	self.is_opened = false
	pass	