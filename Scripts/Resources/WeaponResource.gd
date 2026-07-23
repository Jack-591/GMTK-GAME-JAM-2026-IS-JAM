extends Resource

class_name Weapon


enum weapons {BasicLamp,Candle,OiledLamp,Camera,Torch,FlareGun,BlackLight}


enum attackSpeeds {VerySlow,Slow,Normal,Fast,VeryFast,UltraMegaTikiPhonkKindaSpeed}
enum rarities {Common, Rare, Legendary, TungTungShanor}




@export var name: weapons
@export var maxLight: int = 2
@export var damage: int = 5
@export var attackSpeed: attackSpeeds = attackSpeeds.Normal
@export var rarity: rarities = rarities.Common
@export var ability: String
