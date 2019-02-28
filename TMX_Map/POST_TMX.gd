extends Node

func post_import(scene):
	
	
	print("Post import  script executed ... ")
	# Load scenes to instantiate and add to the level

	print("TMX: scan scene ...")
	for node in scene.get_children():
		print("- TileMap|"+node.name)
		# To know the type of a node, check if it is an instance of a base class
		# The addon imports tile layers as TileMap nodes and object layers as Node2D
		if node is TileMap:
			
			# Process tile layers. E.g. read the ID of the individual tiles and
			# replace them with random variations, or instantiate scenes on top of them
			
			if node.has_meta("TYPE"):
				var type = node.get_meta("T|YPE")
				print(node.name)
				if type == "SOLID": node.add_to_group("SOLID",true)
			if node.has_meta("Z index"):
				node.z_index = int(node.get_meta("Z index"))
				pass
#
#		elif node is Node2D:
#			print("TMX: scan objects ...")
#			for object in node.get_children():
#				#print("- Object|"+object.name)
#				# Assume all objects have a custom property named "type" and get its value
#
#				if object.has_meta("Type"):
#					var type = object.get_meta("Type")
#					#print(type)
#
#					match type:
#						"health":
#							Create_health(scene,object)
#						"ammo": 
#							Create_ammo(scene,object)
#						"granade":
#							Create_granade(scene,object)
#						"panel":
#							Create_panel(scene,object)
#						"teleport":
#							Create_teleport(scene,object)
				
			pass
			
			
	#print(Globals.tmx_entities)
	print("... done")
	# You must return the modified scene
	return scene 

func CreateInstance(scene,object,name,pos):
	var _instance = object.instance()
	_instance.set_position(pos + Vector2(16, 16))	
	#var container = scene.get_root.find_node("Entities", true, false)
	scene.add_child(_instance)
	_instance.set_owner(scene)
	_instance.set_group("TMX_OBJECT")
	
func Create_health(scene,obj):
	
	#print("- Entity|"+obj.name+" type: "+obj.get_meta("Type"))
	var prefab_health = load(obj.get_meta("PrefabName"))
	var health = CreateInstance(scene,prefab_health,"Health #"+obj.name,obj.get_position())
	pass
	
func Create_ammo(scene,obj):
	print("- Entity|"+obj.name+" type: "+obj.get_meta("Type"))
	pass

func Create_granade(scene,obj):
	print("- Entity|"+obj.name+" type: "+obj.get_meta("Type"))
	pass
	
func Create_panel(scene,obj):
	print("- Entity|"+obj.name+" type: "+obj.get_meta("Type"))
	pass
	
func Create_teleport(scene,obj):
	print("- Entity|"+obj.name+" type: "+obj.get_meta("Type"))
	pass
	