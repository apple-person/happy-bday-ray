extends Node

signal ready_for_day
signal got_gun
signal got_rabbits
signal got_carrots
signal got_stew

signal got_gifts
signal got_hint

signal sleep_or_cook

var bed_made := false
var hints_found := false 
var sleep := false 
var alt_end := false 
var ray := false 
var yay := false

func get_ready_quest():
	Objectives.set_objective("get ready for the day!", "make your bed. press space to interact with objects")
	await ready_for_day
	
	Objectives.complete_objective()
	bed_made = true
	await get_tree().create_timer(3.0).timeout
	get_hints()

func get_hints():
	Objectives.set_objective("figure out what Ray likes!", "find at least one hint. press z to check your inventory.")
	await got_hint
	Objectives.complete_objective()
	
	await get_tree().create_timer(3.0).timeout
	hints_found = true
	get_gifts_quest()

func get_gifts_quest():
	Objectives.set_objective("get some gifts for Ray!", "there are a few shops around town...")
	await got_gifts
	
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	choice_quest()

func choice_quest():
	Objectives.set_objective("missions done!", "head back to bed or make some food in the kitchen.")
	await sleep_or_cook
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	
	if sleep:
		ending()
	else:
		get_stew_quest()
	
func get_stew_quest():
	Objectives.set_objective("i need carrots for stew...", "...should head to the supermarket...")
	await got_carrots
	Objectives.complete_objective()
	
	await get_tree().create_timer(3.0).timeout
	
	if not State.has_gun:
		Objectives.set_objective("hm... special rabbit stew?", "...but i need my gun.")
		await got_gun
		Objectives.complete_objective()
	
	await get_tree().create_timer(3.0).timeout
	
	Objectives.set_objective("hunt rabbits", "head to the forest, and equip gun is available in your inventory.")
	await got_rabbits
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	
	Objectives.set_objective("cook", "head to the kitchen and cook.")
	await got_stew
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	
	Objectives.set_objective("go to bed.", "all missions done...")
	await sleep_or_cook
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	
	ending()

func ending():
	ray = true 
	var cutscene = load("res://scenes/home/cutscene.tscn")
	get_tree().change_scene_to_packed(cutscene)
	
func aaa():
	get_tree().change_scene_to_file("res://screens/end_screen.tscn")
