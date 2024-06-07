extends Node

var totalTalentPoints: float = 30
var currentTalentPoints: float = 0
@export var nodesDict: Dictionary
@export var startingNodes: Array[SkillNode]

enum TRIO {
	none,
	one,
	two,
	three,
	four,
	five,
	six
}

var x2_1: Array = []
var x2_2: Array = []
var x2_3: Array = []
var x2_4: Array = []
var x2_5: Array = []
var x2_6: Array = []

enum PassiveType {
	none,
	weapon_power,
	ability_power,
	crit_power,
	echo_slot_small,
	echo_slot_big,
	ability_cooldown,
	ultimate_generation,
	weapon_power_echo_slot,
	stamina,
	defence,
}

var passivesDict: Dictionary = {
	PassiveType.weapon_power: ["+72 Weapon Power",72],
	PassiveType.ability_power: ["+72 Ability Power",72],
	PassiveType.crit_power:["+58 Crit Power", 58],
	PassiveType.echo_slot_small: ["+2 Additional Wayfinder Echo Capacity Per Slot",2],
	PassiveType.echo_slot_big: ["+4 Additional Wayfinder Echo Capacity Per Slot",4],
	PassiveType.ability_cooldown: ["4.25% Additional Ability Cooldown Reduction",4.25],
	PassiveType.ultimate_generation: ["3% Ultimate Generation Multiplier",3],
	PassiveType.weapon_power_echo_slot: ["+108 Weapon Power and +2 Additional Wayfinder Echo Capacity Per Slot",108, 2],
	PassiveType.stamina: ["+4 Max Stamina",4],
	PassiveType.defence: ["+120 Phys Defence",120],
}
