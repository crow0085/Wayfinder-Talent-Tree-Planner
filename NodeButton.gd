extends TextureButton
class_name SkillNode

@export var isPressed: bool
@export var ConnectedNodes: Array[SkillNode]
@export var active: bool
@export var description: String
@export var passiveType:Globals.PassiveType
@export var trio:Globals.TRIO
@export var descLabel: Label
@export var isRootNode: bool

signal activate_node(node:SkillNode)
signal deactivate_node

func _ready():
	var talentUI = get_node('/root/Control')
	if (activate_node.is_connected(Callable(talentUI, "_on__activate_node")) && deactivate_node.is_connected(Callable(talentUI, "_on__deactivate_node"))):
		activate_node.disconnect(Callable(talentUI, "_on__activate_node"))
		deactivate_node.disconnect(Callable(talentUI, "_on__deactivate_node"))
	activate_node.connect(Callable(talentUI, "_on__activate_node"))
	deactivate_node.connect(Callable(talentUI, "_on__deactivate_node"))
	if (passiveType != Globals.PassiveType.none):
		description = Globals.passivesDict[passiveType][0]
	if (isRootNode):
		Globals.startingNodes.append(self)

func _on_pressed():
	if (CanActivate()):
		active = !active
		if (active):
			if (trio!= Globals.TRIO.none):
				match trio:
					Globals.TRIO.one:
						Globals.x2_1.append(self)
					Globals.TRIO.two:
						Globals.x2_2.append(self)
					Globals.TRIO.three:
						Globals.x2_3.append(self)
					Globals.TRIO.four:
						Globals.x2_4.append(self)
					Globals.TRIO.five:
						Globals.x2_5.append(self)
					Globals.TRIO.six:
						Globals.x2_6.append(self)
			activate_node.emit(self)
			self.modulate = Color(0, 0, 1)
		else:
			if (trio!= Globals.TRIO.none):
				match trio:
					Globals.TRIO.one:
						Globals.x2_1.erase(self)
					Globals.TRIO.two:
						Globals.x2_2.erase(self)
					Globals.TRIO.three:
						Globals.x2_3.erase(self)
					Globals.TRIO.four:
						Globals.x2_4.erase(self)
					Globals.TRIO.five:
						Globals.x2_5.erase(self)
					Globals.TRIO.six:
						Globals.x2_6.erase(self)
			deactivate_node.emit(self)
			self.modulate = Color(1,1,1)
	#print(Globals.currentTalentPoints)
	#print("is node ", self.name ," currently active: ", active)

func CanActivate():
	if (!active):
		if (Globals.currentTalentPoints < Globals.totalTalentPoints):
			if (isRootNode):
				Globals.nodesDict[self] = ConnectedNodes
				Globals.currentTalentPoints += 1
				return true
			for node in ConnectedNodes:
				if node.active:
					Globals.nodesDict[self] = ConnectedNodes
					Globals.currentTalentPoints += 1
					return true
		return false
	var count = 0	
	for node in ConnectedNodes:
		if(node!= null && node.active):
			count += 1
	if (count <= 1 && !isRootNode):
		Globals.nodesDict.erase(self)
		Globals.currentTalentPoints -= 1
		return true
	var connections:Array = []
	active = false
	Globals.nodesDict.erase(self)
	for node in ConnectedNodes:
		if(node!= null && node.active):
			connections.append(dfs(Globals.nodesDict, node, Globals.startingNodes))
	Globals.nodesDict[self] = ConnectedNodes
	active = true
	if (connections.has(false)):
		return false
	else:
		Globals.nodesDict.erase(self)
		Globals.currentTalentPoints -= 1
		return true

# Function to find the shortest
# path between two nodes of a graph
# this will tell me if theres a path from connected nodes to a base node
# the goal is an array of any root node
# start is the surrounding node to check if it still has a path to a root node
# dict is the adjacency list
func dfs(dict:Dictionary, start, goal):
	var explored = []
	
	# Queue for traversing the 
	# graph in the BFS
	var queue = [[start]]
	
	if (goal.has(start)): # check if the start and the goal are the same node
		return true
	
	while queue:
		var path = queue.pop_at(0)
		var node = path[-1]
		
		if(!explored.has(node)):
			if (!dict.has(node)):
				continue
			var neighbors = dict[node]
			for neighbor in neighbors:
				var newPath = path.duplicate()
				newPath.append(neighbor)
				queue.append(newPath)
				if (goal.has(neighbor) && neighbor.active):
					#print("shortest path for ", start , " is: " , newPath)
					return true
			explored.append(node)
	#print("no connecting nodes")
	return false
	
func _draw():
	for node in ConnectedNodes:
		var pos = position - global_position
		var offset = 20
		draw_line(Vector2 (pos.x + offset, pos.y + offset), node.global_position - Vector2(global_position.x - offset, global_position.y - offset), Color.BLACK, 1)


func _on_mouse_entered():
	descLabel.text = description


func _on_mouse_exited():
	descLabel.text = ""
