extends Node2D

var gifts_inventory = ["potted_plant", "cat_plush"]
var gifts_points = {
	"potted_plant" = 15,
	"cat_plush" = 10,
	"haj_plush" = 15,
	"stew" = 20,
}
var points

func evaluatePoints() -> int:
	var totalPoints = 0
	
	for key in gifts_points:
		if gifts_inventory.has(key):
			totalPoints += gifts_points[key]
		#print("Key: ", key, ", Value: ", value)
	return totalPoints

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(str(evaluatePoints()))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
