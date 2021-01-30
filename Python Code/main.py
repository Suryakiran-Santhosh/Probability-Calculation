"""
ECS 132: Probability and Statistical Modeling for Computer Science
Winter 2021
1/17/2021
Homework #1 Part E:

Prompt:
simjj(d,nreps)
that will simulate nreps, repetitions of the game, for general values of d.
The return value will be an R list,with components winner, prize, and loserDots,
each of which is a vector of length nreps, showingwinners, winners' prize money and losers' number of dots. 
(E.g. if Jack wins and Jill has accumulated 3dots by then, then loserDots is 3.)
"""

import simjj
import simjj1b
import simjj1c
import simjj1d


def main():
    dots, trial = 4, 1000000  # test case, probability should be approximately 71.5%
    # runs simulation and creates notebook of experiment
    notebook = simjj.simjj(dots, trial)

    # calculates and prints the probability of Jill winning
    print(simjj.probability_jill(notebook))

    # calculates and prints the probability that Jill wins in her second roll
    print(simjj1b(dots, 2, trial))

    # calculate and prints the probability that difference between winner's dots and loser's dots is 1
    print(simjj1c.simjj1c(notebook))

    # Find the probability that Jill wins $6
    print(simjj1d.simjj1d(notebook))  # should return approximately: 0.208


if __name__ == "__main__":
    main()
