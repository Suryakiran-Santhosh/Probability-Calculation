"""
ECS 132: Probability and Statistical Modeling for Computer Science
By: Suryakiran Santhosh
Homework #1 Problem 1 Part D Simulation Check

Prompt:
The 10 O'Clock News reports that Jill won, but doesn't say what her prize was.
Find the probability that her prize was $6.
"""


def simjj1d(notebook: dict(tuple())) -> float:
    # notebook = dict(tuple(winners, prize, loserDots))
    event_counter = 0  # counts number of occurrence of events
    nreps = len(notebook)

    # calculate the probability that Jill wins and her prize is $p
    for i in range(nreps):
        if (notebook[i][0].lower() == "jill") and (notebook[i][1] == 6):
            event_counter += 1

    # calculate and return the probability
    return (event_counter/nreps)
