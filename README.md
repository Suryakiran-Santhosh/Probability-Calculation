# Probability-Calculation
This repository contains simulations that were written in Python and R to calculate the probability of certain events occuring.

Let's consider a simple game with two participants--Jack and Jill--the two players alternate taking turns rolling a single die. The first one to reach a total of at least d dots wins, with the prize being  $. "p" being it total number of dots rolled to get win. Due to the fact that Jack is a gentlemen he lets Jill rolls first.
  
    Example: 
    Say we set d to 7, and Jill rolls a 4. Jack then roles a 3, Jill rolls a 2, and finally Jack rolls a 5. Jack wins, with a prize of $8.
  
# Function:
    1.) simjj(d, nreps) : function simulates nreps repetitions of the game, for general values of d. Tracks the winner, the prize, and the loser's dot total. These values are returned from a Python Hash Map and R list. 
    2.) simjj1b(d, nreps) : function simulates nreps repetitions of the game. Then calculates and returns the probability of Jill(the first player) winning on her second turn.
          -> return type is a double or floating point number
    3.) simjj1c(notebook) : function that calculates the probability of the difference between winner's and loser's dots being 1
    4.) simjj1d(notebook) : function that calculates the probability that Jill wins $6 given that the 10 o'clock news reported Jill Won
