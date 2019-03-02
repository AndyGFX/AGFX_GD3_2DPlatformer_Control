extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var root_entities

var file_name = "res://TMX_Map/TiledObjectTypes/objecttypes.json"
var objectTypes

# Called when the node enters the scene tree for the first time.
func _ready():

	# load TMX objecttypes 

	print("ObjectTypes data loaded.")
	self.objectTypes = Utils.LoadJSON(file_name) 
	
	for obj in self.objectTypes:	
		print("   | "+obj.name)

	self.root_entities = Utils.FindNode("Entities")
	
	print("Post-process: build entities in scene at runtime ... ")
	var scene = Utils.FindNode(self.name)
	
	for node in scene.get_children():
		if node is Node2D:
			print("TMX: scan objects ...")
			for object in node.get_children():

				if object.has_meta("Type"):
					var type = object.get_meta("Type")
					#print(type)

					match type:
						"health":
							Create_health(object)
						"ammo": 
							Create_ammo(object)
						"granade":							
							Create_granade(object)
						"coin":
							Create_coin(object)							
#						"panel":
#							Create_panel(scene,object)
#						"teleport":
#							Create_teleport(scene,object)

				pass

func CreateInstance(object,name,pos):
	
	var _instance = object.instance()
	_instance.name = name
	_instance.set_position(pos + Vector2(8, -8))	
	self.root_entities.add_child(_instance)
	_instance.set_owner(self.root_entities)
	return _instance
	
func CreateEntity(obj):
	
	var entity_prefab = load(obj.get_meta("PrefabName"))
	var entity_name = obj.get_meta("Name")+"("+obj.name+")"
	var entity_pos = obj.get_position()
	return CreateInstance(entity_prefab,entity_name,entity_pos)
	
func Create_health(obj):

	var entity = CreateEntity(obj)
	entity.item_amount = obj.get_meta("Amount")
	
func Create_ammo(obj):

	var entity = CreateEntity(obj)
	entity.item_amount = obj.get_meta("Amount")
	
func Create_granade(obj):

	var entity = CreateEntity(obj)
	entity.item_amount = obj.get_meta("Amount")	
	
func Create_coin(obj):

	var entity = CreateEntity(obj)
	entity.item_amount = obj.get_meta("Amount")	