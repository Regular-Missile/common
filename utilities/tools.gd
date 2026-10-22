class_name Tools
extends Node


## Instantiates node, adds it to the tree, positions it. Returns the node
## Is run deferred so as to not mess with any physics flushing queries
static func instantiate_at_position(scene_to_instantiate: PackedScene, target_node: Node, _position: Vector2) -> Node2D:
	var return_node: Node2D = scene_to_instantiate.instantiate()
	return_node.global_position = _position
	
	# Some things trigger the error 
	# E 0:00:18:369   tools.gd:10 @ instantiate_at_position(): 
	# Can't change this state while flushing queries. 
	# Use call_deferred() or set_deferred() to change monitoring state instead.
	# So, do use add_child.call_deferred
	target_node.add_child.call_deferred(return_node)
	return return_node
	

## Instantiates node, adds it to the tree. returns node
static func instantiate_to_parent(scene_to_instantiate: PackedScene, target_node: Node) -> Node:
	var return_node: Node = scene_to_instantiate.instantiate()
	target_node.add_child(return_node)

	return return_node


## Instantiates node, returns it. Does not add it to the tree
static func instantiate(scene_to_instantiate: PackedScene) -> Node: 
	var return_node: Node = scene_to_instantiate.instantiate()
	
	return return_node
