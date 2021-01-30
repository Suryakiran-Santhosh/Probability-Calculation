"""
ECS 132: Probability and Statistical Modeling for Computer Science
By: Suryakiran Santhosh
Homework #1 Problem 1 Part D Simulation Check

Prompt:
Find P(Jill wins, taking 2 turns to do so).
"""


import random


def sim1d(d: int, p: int, nreps: int) -> float:
    notebook = dict()
    event_counter = 0  # counts number of occurrence of events

    # trials of experiment
    for i in range(nreps):
        Jill, Jack = 0, 0  # stores total in trial
        winner, rolls = "", 0
        while Jill < d and Jack < d:
            rolls += 1
            Jill += random.randint(1, 6)

            if Jill < d:
                Jack += random.randint(1, 6)

        # determine winner and prize amount
        if Jill >= d:
            winner = "Jill"
        elif Jack >= d:
            winner = "Jack"

        # write trial results to notebook
        notebook[i] = tuple((winner, rolls))

    # calculate the probability that Jill wins and her prize is $p
    for i in range(nreps):
        if (notebook[i][0] == "Jill") and (notebook[i][1] == p):
            event_counter += 1

    # calculate and return the probability
    return (event_counter/nreps)
