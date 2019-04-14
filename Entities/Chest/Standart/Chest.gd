extends Area2D

var state_open = null
var state_close = null
var items_1 = null;
var items_2 = null;
var items_3 = null;
var items_4 = null;

export (Array,PackedScene) var itemsList

func _ready():
	self.state_open = $OPENED
	self.state_close = $CLOSED
	self.items_1 = $OPENED/ItemsORIGIN/Position2D1
	self.items_2 = $OPENED/ItemsORIGIN/Position2D2
	self.items_3 = $OPENED/ItemsORIGIN/Position2D3
	self.items_4 = $OPENED/ItemsORIGIN/Position2D4
	pass


func _process(delta):
	pass
