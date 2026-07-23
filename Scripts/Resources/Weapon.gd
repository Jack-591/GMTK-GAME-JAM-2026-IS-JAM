extends Resource

class_name Weapon

enum attackSpeeds {VerySlow,Slow,Normal,Fast,VeryFast,UltraMegaTikiPhonkKindaSpeed}
enum rarities {Common, Uncommon, Rare, Legendary, Mythical, TungTungShanor}

@export var name: String
@export var maxLight: int
@export var damage: int
@export var attackSpeed: attackSpeeds
@export var rarity: rarities
@export var ability: String
