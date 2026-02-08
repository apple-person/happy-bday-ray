extends Node

var can_interact: bool = true

var met_ray: bool = false
var rabbit_amount: int = 0
var has_carrots: bool = false

var temp_inventory = []
var gifts_inventory = []

const gifts_points = {
	"potted_plant" = 15,
	"cat_plush" = 10,
	"haj_plush" = 15,
	"stew" = 20,
}

func evaluatePoints() -> int:
	var totalPoints = 0
	
	for key in gifts_points:
		if gifts_inventory.has(key):
			totalPoints += gifts_points[key]
		#print("key: ", key, ", value: ", value)
	return totalPoints
