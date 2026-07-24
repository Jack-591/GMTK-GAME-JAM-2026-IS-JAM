extends Resource

class_name EnemyResource

enum Names {Goon, Swordsman}
enum Abilities {Nothing, Dash, Slime}

@export var name: Names = Names.Goon
@export var speed: int = 5
@export var maxHealth: int = 20
@export var ability: Abilities = Abilities.Nothing
@export var NOTCONFIGURED: bool = true
