# Knapsack Problem
This program solves knapsack problem with dynamic programming method. Knapsack problem is known problem in computer science. Problems looks like that: If you have bag and items, how would you choose these items for making the bag's value to maximum? Bag has capacity and items have mass. 

###How it works?
Before the running algorithm, program takes bag's capacity and items' mass and value. After that, creates a matrix with the number of items x capacity and fills this matrix with 0 (zero). PS: program inserts one extra row for algorithm.

Program takes the item and tries to fit the cell via comparing item's mass (`mass_of_items[i]`) and current row's index (`j`). If it doesn't fit, writes previous cell's value (`bag[i-1][j]`) to current cell (`bag[i][j]`). If it fits, checks that if there is an item fitting with it (`bag[i-1][j-mass_of_items[i]]`). If there is, sums this item's mass with itself's and compares with previous cell's value (`bag[i-1][j]`). If it is greater than previous cell's value, writes the sum to current cell, if it isn't, writes previous cell's value.

Last value of the matrix (`bag[number_of_items][capacity]`) gives us the maximum value that fits the bag. After the finding maximum value, program finds items that gives that value.