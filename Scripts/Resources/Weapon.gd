extends Resource

class_name Weapon

enum attackSpeeds {VerySlow,Slow,Normal,Fast,VeryFast,UltraMegaTikiPhonkKindaSpeed}
enum rarities {Common, Uncommon, Rare, Legendary, Mythical, TungTungShanor}

@export var name: String
@export var maxLight: int = 2
@export var damage: int = 5
@export var attackSpeed: attackSpeeds = attackSpeeds.Normal
@export var rarity: rarities = rarities.Common
@export var ability: String
