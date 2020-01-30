extends Area2D

var is_opened:bool = false
onready var state_open = self.get_node("OPENED")
onready var state_close = self.get_node("CLOSED")
var enable_read_input_key:bool = false
var items:Array = [];


export (bool) var need_key = false
export (String) var key_name = "undefined"


# ---------------------------------------------------------
#  Prepare chest on start
# ---------------------------------------------------------
func _ready():
	
	#self.state_open = $OPENED
	#self.state_close = $CLOSED
		
	self.items.append($OPENED/ItemsORIGIN/Position2D1)
	self.items.append($OPENED/ItemsORIGIN/Position2D2)
	self.items.append($OPENED/ItemsORIGIN/Position2D3)
	self.items.append($OPENED/ItemsORIGIN/Position2D4)
	
	for i in range(4):
		
		var item_id = randi()%4
		
		var new_item = load(Globals.chestItems[i]).instance()
		new_item.name="Chest_Item_"+String(i)
		self.items[i].add_child(new_item)
		new_item.set_owner(self.items[i])
		new_item.PickupControl(false)
	
	self.set_process(true)
	self.Chest_Close()
	
	self.connect("body_entered", self, "_on_Chest_body_entered")
	self.connect("body_exited", self, "_on_Chest_body_exited")
	
	pass

# ---------------------------------------------------------
# Check key pressed when is auto_open is disabled
# ---------------------------------------------------------
func _process(delta):
	if self.enable_read_input_key:
		if Input.is_action_just_pressed("key_use"):
			print("USE ...",self.get_name())
			if (self.is_opened):
				self.Chest_Close()
			elif (!self.is_opened):
				self.Chest_Open()
		pass
	pass


# ---------------------------------------------------------
# Enable chest events when player enter area
# ---------------------------------------------------------
func _on_Chest_body_entered(body):
	
	if (body.is_in_group("PLAYER")):
		print("Player ENTER")
		self.enable_read_input_key = true
	pass 

func _on_Chest_body_exited(body):
	if (body.is_in_group("PLAYER")):
		print("Player EXIT")
		self.enable_read_input_key = false
	pass 
# ---------------------------------------------------------
# Enable collisionshape on items in chest
# ---------------------------------------------------------
func EnablePickup():
	for i in range(4):
		if self.items[i].get_child_count()>0:
			var children = self.items[i].get_children()		
			children[0].PickupControl(true)

# ---------------------------------------------------------
# Disable collisionshape on items in chest
# ---------------------------------------------------------
func DisablePickup():
	for i in range(4):
		if self.items[i].get_child_count()>0:
			var children = self.items[i].get_children()		
			children[0].PickupControl(false)
			
# ---------------------------------------------------------
# Open chest (check key in inventory if needed - when is using item key enabled)
# ---------------------------------------------------------
func Chest_Open():
	var open = false;
	
	if self.need_key:
		if GameData.Get(self.key_name)==1:
			open=true
			pass
	else:
		open = true
	
	if open:
		self.state_close.visible = false
		self.state_open.visible = true
		self.is_opened = true
		self.EnablePickup()
	pass

# ---------------------------------------------------------
# close chest
# ---------------------------------------------------------
func Chest_Close():
	self.DisablePickup()
	self.state_close.visible = true
	self.state_open.visible = false
	self.is_opened = false
	
	pass	
