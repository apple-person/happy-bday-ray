extends Node

signal got_gun
signal got_rabbits
signal got_carrots
signal got_gifts
signal got_hint

signal sleep_or_cook

var sleep := false

func get_ready_quest():
	Objectives.set_objective("get ready for the day!", "press space to interact with objects")
	await got_gun
	
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
	get_hints()

func get_hints():
	Objectives.set_objective("figure out what Ray likes!", "find at least one hint from the home.")
	await got_hint
	Objectives.complete_objective()
	
	await get_tree().create_timer(3.0).timeout
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
		pass
	else:
		get_stew_quest()
	
	
func get_stew_quest():
	Objectives.set_objective("i need carrots for stew...", "...should head to the supermarket...")
	await got_carrots
	Objectives.complete_objective()
	
	Objectives.set_objective("i should make some special rabbit stew.", "hunting time!!1!")
	await got_rabbits
	Objectives.complete_objective()
	
	await get_tree().create_timer(3.0).timeout
	true_ending()

func true_ending():
	Objectives.set_objective(" ", " ")
	await got_carrots
	Objectives.complete_objective()
	await get_tree().create_timer(3.0).timeout
