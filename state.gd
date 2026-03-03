extends Node

var can_interact: bool = true

var met_ray: bool = false
var rabbit_amount: int = 0
var has_carrots: bool = false
var has_gun: bool = false

var temp_inventory = []
var gifts_inventory = []
var totalPoints = 0

const gifts_points = {
	"strange_plant" = 15,
	"cactus" = 10,
	"cat_plush" = 15,
	"haj_plush" = 10,
	"stew" = 30,
}

func evaluatePoints() -> void:
	for key in gifts_points:
		if gifts_inventory.has(key):
			totalPoints += gifts_points[key]
		#print("key: ", key, ", value: ", value)
