# should also calculate the value of an action by how it rotates the board so that you move good items away from opponent
# identify the best action for your opponent by calculating from its perspective. add that to the value of each possible action. only if it is attainable by the enemy.
extends Node


func calc_score(inventory: Array) -> int:
	var score:int = 0
	
	score += small_score(inventory[Global.Items.SMALL_SESAME])
	score += large_score(inventory[Global.Items.LARGE_SESAME])
	score += chive_score(inventory[Global.Items.CHIVE])
	score += egg_score(inventory[Global.Items.EGG])
	score += shrimp_score(inventory[Global.Items.SHRIMP])
	score += turnip_score(inventory[Global.Items.TURNIP])
	score += shumai_score(inventory[Global.Items.SHUMAI])
	score += steamed_score(inventory[Global.Items.STEAMED])
	# special plates TODO
	score += chopstick_score(inventory[Global.Items.CHOPSTICK])
	
	return score

# outside numbers needed are the full inventories and distances to a dish
func expected_value(bowl: int, inventory:Array, perspective:Global.Players) -> float:
	var value:float = 0
	
	var hypothetical_inventory = inventory.duplicate(true) # not sure if this is necessary, but need to make deep copy
	if bowl != -1:
		hypothetical_inventory[Global.bowls[bowl].current_item] += 1
		hypothetical_inventory[Global.Items.CHOPSTICK] -= Global.distances[perspective][bowl]
		hypothetical_inventory[Global.Items.CHOPSTICK] += Global.chopsticks[bowl].chopsticks
	
	value += mod_small_value(hypothetical_inventory[Global.Items.SMALL_SESAME])
	value += mod_large_value(hypothetical_inventory[Global.Items.LARGE_SESAME])
	value += mod_chive_value(hypothetical_inventory[Global.Items.CHIVE])
	value += mod_egg_value(hypothetical_inventory[Global.Items.EGG])
	value += mod_shrimp_value(hypothetical_inventory[Global.Items.SHRIMP])
	value += mod_turnip_value(hypothetical_inventory[Global.Items.TURNIP])
	value += mod_shumai_value(hypothetical_inventory[Global.Items.SHUMAI])
	value += mod_steamed_value(hypothetical_inventory[Global.Items.STEAMED])
	# special plates TODO
	
	value += mod_chopstick_value(hypothetical_inventory[Global.Items.CHOPSTICK], perspective)

	return value - calc_score(Global.inventories[perspective])


## 1 point each
func small_score(quant:int) -> int:
	assert(quant >= 0)
	return quant

## 2 points each
func large_score(quant:int) -> int:
	assert(quant >= 0)
	return quant * 2

## 4 points per set of 2
func chive_score(quant:int) -> int:
	assert(quant >= 0)
	return int(quant/2) * 4

## 1 point for 1, 2 points for 2, 5 points for 3, 9 points for 4, 15 points for 5+
func egg_score(quant:int) -> int:
	assert(quant >= 0)
	match quant:
		0:
			return 0
		1:
			return 1
		2:
			return 2
		3:
			return 5
		4:
			return 9
		_:
			return 15

## 7 points per set of 3
func shrimp_score(quant:int) -> int:
	assert(quant >= 0)
	return int( quant / 3 ) * 7	# can also calculate using modulo. subtract modulus then divide.

## 2 points each if odd amount
func turnip_score(quant:int) -> int:
	assert(quant >= 0)
	if quant % 2:
		return quant * 2
	return 0

## 12 points per set of 4
func shumai_score(quant:int) -> int:
	assert(quant >= 0)
	return int( quant / 4 ) * 12

# steamed bun scoring. current implementation is simple but sometimes wrong.
# better but unimplemented. a priority queue would be much better
# var steamed_counter: Array[Array] = []
# for i in 13:
# steamed_counter.append([])
func steamed_score(quant:int) -> int:
	assert(quant >= 0)
	var steamed_max = 0
	var steamed_min = 0
	var score:int = 0
	
	for player in Global.num_players:
		if Global.inventories[player][Global.Items.STEAMED] > steamed_max:
			steamed_max = Global.inventories[player][Global.Items.STEAMED]
		if Global.inventories[player][Global.Items.STEAMED] < steamed_min:
			steamed_min = Global.inventories[player][Global.Items.STEAMED]
	if quant >= steamed_max:
		score += 3
	if quant <= steamed_min:
		score += -3
	return score

## 1 point per set of 2
func chopstick_score(quant:int) -> int:
	assert(quant >= 0)
	return int( quant / 2 )



func mod_small_value(quant:int) -> float:
	return small_score(quant)

func mod_large_value(quant:int) -> float:
	return large_score(quant)

func mod_chive_value(quant:int) -> float:
	return chive_score(quant)

# bonus for more eggs on the board and in inventory. no bonus if already have 5.
func mod_egg_value(quant:int) -> int:
	return egg_score(quant)

func mod_shrimp_value(quant:int) -> float:
	return shrimp_score(quant)

func mod_turnip_value(quant:int) -> float:
	return turnip_score(quant)

func mod_shumai_value(quant:int) -> float:
	return shumai_score(quant)

func mod_steamed_value(quant:int) -> float:
	return steamed_score(quant)

# adds a bonus to their value so that they are less likely to get used up. bonus decays over time.
func mod_chopstick_value(chopstick_count:int, perspective:Global.Players) -> float:
	return chopstick_score(chopstick_count) * (1 + (12 - foods_possessed(perspective)) * .3)

func foods_possessed(player:Global.Players) -> int:
	var count = 0
	for n in 8:
		count += Global.inventories[player][n]
	print(Global.player_string(player) + str(count))
	return count
