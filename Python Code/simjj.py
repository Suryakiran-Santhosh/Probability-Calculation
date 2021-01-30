"""
ECS 132: Probability and Statistical Modeling for Computer Science
Winter 2021
1/17/2021
Homework #1 Part E:

Prompt:
simjj(d,nreps)
that will simulate nreps, repetitions of the game, for general values of d.
The return value will be an R list,with components winner, prize, and loserDots,
each of which is a vector of length nreps, showing winners, winners' prize money and losers' number of dots.
(E.g. if Jack wins and Jill has accumulated 3dots by then, then loserDots is 3.)
"""


import random


def probability_jill(notebook: dict) -> float:
    counter = 0
    for key, val in notebook.items():
        if val[0].lower() == "jill":
            counter += 1
    return counter / len(notebook)


def roll() -> int:
    return random.randint(1, 6)


def simjj(d: int, nreps: int) -> dict[int, tuple[str, int, int]]:
    # hash table to keep track of each trial of experiment
    notebook = dict()

    # experiment loop w/ each iteration being a
    for i in range(nreps):
        jill, jack = 0, 0
        winner = ""
        prize = 0
        loser_dots = 0
        jill_roll, jack_roll = 0, 0  # each roll of the dice

        while jill < d and jack < d:
            jill_roll += roll()
            if jill < d:
                jack_roll += roll()

        if jill > jack:
            winner = "Jill"
            loser_dots = jack
            prize = jill
        elif jack > jill:
            winner = "Jack"
            loser_dots = jill
            prize = jack

        notebook[i] = tuple((winner, loser_dots, prize))
    return notebook
