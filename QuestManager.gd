extends Node

signal ready_for_day
signal got_gun
signal got_rabbits
signal got_carrots
signal got_gifts
signal got_hint

signal sleep_or_cook

var bed_made := false
var hints_found := false 
var sleep := false 

func get_ready_quest():
	Objectives.set_objective("get ready for the day!", "press space to interact with objects")
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
	
	if sleep:
		normal_ending()
	else:
		get_stew_quest()
	
	
func get_stew_quest():
	Objectives.set_objective("i need carrots for stew...", "...should head to the supermarket...")
	await got_carrots
	Objectives.complete_objective()
	
	Objectives.set_objective("i should make some special rabbit stew.", "...but i need my gun.")
	if not State.has_gun:
		await got_gun
	Objectives.complete_objective()
	
	Objectives.set_objective("hunt rabbits", "hunting time!!1! head to the forest!")
	await got_rabbits
	Objectives.complete_objective()
	
	await get_tree().create_timer(3.0).timeout
	true_ending()

func true_ending():
	Objectives.set_objective(" ", " ")
	await got_carrots
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	
func normal_ending():
	pass
