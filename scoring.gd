# should also calculate the value of an action by how it rotates the board so that you move good items away from opponent
# identify the best action for your opponent by calculating from its perspective. add that to the value of each possible action. only if it is attainable by the enemy.
extends Node


func calc_score(inventory: Array) -> int:
	
	var score:int = 0
	
	# small sesame
	score += inventory[Global.Items.SMALL_SESAME]
	# large sesame
	score += inventory[Global.Items.LARGE_SESAME] * 2
	# chive
	score += int(inventory[Global.Items.CHIVE]/2) * 4
	# egg tart
	match inventory[Global.Items.EGG]:
		0:
			pass
		1:
			score += 1
		2:
			score += 2
		3:
			score += 5
		4:
			score += 9
		_:
			score += 15
	score += int( inventory[Global.Items.SHRIMP] / 3 ) * 7	# can also calculate using modulo. subtract modulus then divide.
	# turnip
	if inventory[Global.Items.TURNIP] % 2:
		score += inventory[Global.Items.TURNIP] * 2
	int( inventory[Global.Items.SHUMAI] / 4 ) * 12
	# steamed bun scoring. current implementation is simple but sometimes wrong.
	var steamed_max = 0
	var steamed_min = 0
	for player in Global.num_players:
		if Global.inventories[player][Global.Items.STEAMED] > steamed_max:
			steamed_max = Global.inventories[player][Global.Items.STEAMED]
		if Global.inventories[player][Global.Items.STEAMED] < steamed_min:
			steamed_min = Global.inventories[player][Global.Items.STEAMED]
	if inventory[Global.Items.STEAMED] == steamed_max:
		score += 3
	if inventory[Global.Items.STEAMED] == steamed_min:
		score -= 3
	# better but unimplemented. a priority queue would be much better
	# var steamed_counter: Array[Array] = []
	# for i in 13:
	# steamed_counter.append([])
	# special plates TODO
	# chopstick
	score += chopstick_value(inventory[Global.Items.CHOPSTICK])
	
	return score


func chopstick_value(chopstick_count:int) -> int:
	return int( chopstick_count / 2 )


# adds a bonus to their value so that they are less likely to get used up. bonus decays over time.
func chopstick_bonus_value(chopstick_count:int, foods_possessed:int) -> float:
	return ((chopstick_value(chopstick_count) * (1 + (12 - foods_possessed) * .5)) - chopstick_value(chopstick_count))
