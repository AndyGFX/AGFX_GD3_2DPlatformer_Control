extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var root_entities

# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.root_entities = Utils.FindNode("Entities")
	
	print("Post-process: build entities inscene in runtime mode ... ")
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
							Create_health(scene,object)
#						"ammo": 
#							Create_ammo(scene,object)
#						"granade":
#							Create_granade(scene,object)
#						"panel":
#							Create_panel(scene,object)
#						"teleport":
#							Create_teleport(scene,object)

				pass

func CreateInstance(scene,object,name,pos):
	var _instance = object.instance()
	_instance.set_position(pos + Vector2(16, -16))	
	#var container = scene.get_root.find_node("Entities", true, false)
	self.root_entities.add_child(_instance)
	_instance.set_owner(self.root_entities)
	
	
func Create_health(scene,obj):
	print("- Entity|"+obj.name+" type: "+obj.get_meta("Type"))
	var prefab_health = load(obj.get_meta("PrefabName"))
	var health = CreateInstance(scene,prefab_health,"Health #"+obj.name,obj.get_position())
	pass
	