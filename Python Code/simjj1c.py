"""
ECS 132: Probability and Statistical Modeling for Computer Science
Winter 2021, 1/17/2021
Homework #1 Part C
"""


from random import randint


def simjj1c(notebook: dict(tuple)) -> float:
    counter = 0
    nreps = len(notebook)

    for i in range(nreps):
        if abs(notebook[i][1] - notebook[i][2]) == 1:
            counter += 1

    return counter / nreps
