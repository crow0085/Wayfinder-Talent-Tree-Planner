extends Control

@export var labelPoints: Label
@export var labelWeaponPower: Label
@export var labelAbilityPower: Label
@export var labelCritPower: Label
@export var labelPhysDefence: Label
@export var labelStamina: Label
@export var labelEchoCap: Label
@export var labelUltimateGen: Label
@export var labelCooldown: Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on__activate_node(node:SkillNode):
	var pointsRem = str(Globals.totalTalentPoints - Globals.currentTalentPoints)
	labelPoints.text = (pointsRem)
	
	print("activating node: ", node.name)
	if (node.trio != Globals.TRIO.none):
		match node.trio:
			Globals.TRIO.one:
				if (Globals.x2_1.size() == 3): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelCritPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.crit_power][1]
					labelCritPower.text = str(temp)
			Globals.TRIO.two:
				if (Globals.x2_2.size() == 3): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelCritPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.crit_power][1]
					labelCritPower.text = str(temp)
					
					temp = float(labelCooldown.text)
					temp += Globals.passivesDict[Globals.PassiveType.ability_cooldown][1]
					labelCooldown.text = str(temp)
			Globals.TRIO.three:
				if (Globals.x2_3.size() == 3): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelAbilityPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.ability_power][1]
					labelAbilityPower.text = str(temp)
					
					temp = float(labelCooldown.text)
					temp += Globals.passivesDict[Globals.PassiveType.ability_cooldown][1]
					labelCooldown.text = str(temp)
			Globals.TRIO.four:
				if (Globals.x2_4.size() == 3): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelAbilityPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.ability_power][1]
					labelAbilityPower.text = str(temp)
					
					temp = float(labelStamina.text)
					temp += Globals.passivesDict[Globals.PassiveType.stamina][1]
					labelStamina.text = str(temp)
			Globals.TRIO.five:
				if (Globals.x2_5.size() == 3): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelPhysDefence.text)
					temp += Globals.passivesDict[Globals.PassiveType.defence][1]
					labelPhysDefence.text = str(temp)
					
					temp = float(labelStamina.text)
					temp += Globals.passivesDict[Globals.PassiveType.stamina][1]
					labelStamina.text = str(temp)
			Globals.TRIO.six:
				if (Globals.x2_6.size() == 3): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp += Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelPhysDefence.text)
					temp += Globals.passivesDict[Globals.PassiveType.defence][1]
					labelPhysDefence.text = str(temp)
					
					temp = float(labelUltimateGen.text)
					temp += Globals.passivesDict[Globals.PassiveType.ultimate_generation][1]
					labelUltimateGen.text = str(temp)
	
	match node.passiveType:
		Globals.PassiveType.weapon_power:
			var temp = float(labelWeaponPower.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelWeaponPower.text = str(temp)
			pass
		Globals.PassiveType.ability_power:
			var temp = float(labelAbilityPower.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelAbilityPower.text = str(temp)
			pass
		Globals.PassiveType.crit_power:
			var temp = float(labelCritPower.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelCritPower.text = str(temp)
			pass
		Globals.PassiveType.defence:
			var temp = float(labelPhysDefence.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelPhysDefence.text = str(temp)
			pass
		Globals.PassiveType.stamina:
			var temp = float(labelStamina.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelStamina.text = str(temp)
			pass
		Globals.PassiveType.echo_slot_small:
			var temp = float(labelEchoCap.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelEchoCap.text = str(temp)
			pass
		Globals.PassiveType.echo_slot_big:
			var temp = float(labelEchoCap.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelEchoCap.text = str(temp)
			pass
		Globals.PassiveType.ultimate_generation:
			var temp = float(labelUltimateGen.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelUltimateGen.text = str(temp)
			pass
		Globals.PassiveType.ability_cooldown:
			var temp = float(labelCooldown.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelCooldown.text = str(temp)
			pass
		Globals.PassiveType.weapon_power_echo_slot:
			var temp = float(labelWeaponPower.text)
			temp += Globals.passivesDict[node.passiveType][1]
			labelWeaponPower.text = str(temp)
			temp = float(labelEchoCap.text)
			temp += Globals.passivesDict[node.passiveType][2]
			labelEchoCap.text = str(temp)
			pass


func _on__deactivate_node(node:SkillNode):
	var pointsRem = str(Globals.totalTalentPoints - Globals.currentTalentPoints)
	labelPoints.text = (pointsRem)
	
	print("deactivating node: ", node.name)
		
	print("here")
	if (node.trio != Globals.TRIO.none):
		print("here 2")
		match node.trio:
			Globals.TRIO.one:
				if (Globals.x2_1.size() == 2): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelCritPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.crit_power][1]
					labelCritPower.text = str(temp)
			Globals.TRIO.two:
				if (Globals.x2_2.size() == 2): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelCritPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.crit_power][1]
					labelCritPower.text = str(temp)
					
					temp = float(labelCooldown.text)
					temp -= Globals.passivesDict[Globals.PassiveType.ability_cooldown][1]
					labelCooldown.text = str(temp)
			Globals.TRIO.three:
				if (Globals.x2_3.size() == 2): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelAbilityPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.ability_power][1]
					labelAbilityPower.text = str(temp)
					
					temp = float(labelCooldown.text)
					temp -= Globals.passivesDict[Globals.PassiveType.ability_cooldown][1]
					labelCooldown.text = str(temp)
			Globals.TRIO.four:
				if (Globals.x2_4.size() == 2): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelAbilityPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.ability_power][1]
					labelAbilityPower.text = str(temp)
					
					temp = float(labelStamina.text)
					temp -= Globals.passivesDict[Globals.PassiveType.stamina][1]
					labelStamina.text = str(temp)
			Globals.TRIO.five:
				if (Globals.x2_5.size() == 2): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelPhysDefence.text)
					temp -= Globals.passivesDict[Globals.PassiveType.defence][1]
					labelPhysDefence.text = str(temp)
					
					temp = float(labelStamina.text)
					temp -= Globals.passivesDict[Globals.PassiveType.stamina][1]
					labelStamina.text = str(temp)
			Globals.TRIO.six:
				if (Globals.x2_6.size() == 2): #all 3 nodes for this x2 region are active
					var temp = float(labelWeaponPower.text)
					temp -= Globals.passivesDict[Globals.PassiveType.weapon_power][1]
					labelWeaponPower.text = str(temp)
					
					temp = float(labelPhysDefence.text)
					temp -= Globals.passivesDict[Globals.PassiveType.defence][1]
					labelPhysDefence.text = str(temp)
					
					temp = float(labelUltimateGen.text)
					temp -= Globals.passivesDict[Globals.PassiveType.ultimate_generation][1]
					labelUltimateGen.text = str(temp)
	
	match node.passiveType:
		Globals.PassiveType.weapon_power:
			var temp = float(labelWeaponPower.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelWeaponPower.text = str(temp)
			pass
		Globals.PassiveType.ability_power:
			var temp = float(labelAbilityPower.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelAbilityPower.text = str(temp)
			pass
		Globals.PassiveType.crit_power:
			var temp = float(labelCritPower.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelCritPower.text = str(temp)
			pass
		Globals.PassiveType.defence:
			var temp = float(labelPhysDefence.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelPhysDefence.text = str(temp)
			pass
		Globals.PassiveType.stamina:
			var temp = float(labelStamina.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelStamina.text = str(temp)
			pass
		Globals.PassiveType.echo_slot_small:
			var temp = float(labelEchoCap.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelEchoCap.text = str(temp)
			pass
		Globals.PassiveType.echo_slot_big:
			var temp = float(labelEchoCap.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelEchoCap.text = str(temp)
			pass
		Globals.PassiveType.ultimate_generation:
			var temp = float(labelUltimateGen.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelUltimateGen.text = str(temp)
			pass
		Globals.PassiveType.ability_cooldown:
			var temp = float(labelCooldown.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelCooldown.text = str(temp)
			pass
		Globals.PassiveType.weapon_power_echo_slot:
			var temp = float(labelWeaponPower.text)
			temp -= Globals.passivesDict[node.passiveType][1]
			labelWeaponPower.text = str(temp)
			temp = float(labelEchoCap.text)
			temp -= Globals.passivesDict[node.passiveType][2]
			labelEchoCap.text = str(temp)
			pass
