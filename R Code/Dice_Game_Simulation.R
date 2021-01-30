# ECS 132: Probability and Statistical Modeling for Computer Science
# Homework #1 Problem 1 Part 3 
# By: Suryakiran Santhosh

# Write a function with call form: simjj(d,nreps)
# that will simulate nreps repetitions of the game, for general values of d. 
# The return value will be an R list, with components winner, prize and loserDots, each of which is a vector of length nreps, 
# showing winners, winners' prize money and losers' number of dots. 
# (E.g. if Jack wins and Jill has accumulated 3 dots by then, then loserDots is 3.)


# this is the main simulation of the game. This function creates "notebook"
simjj <- function(d,nreps){
    # declare a sequence of length=nreps with all elements being initialized to 0 ; (from = 0, to = 0, length.out=nreps)
    winners <- seq(from = 0,to = 0, length.out = nreps)
    prize <- seq(from = 0, to = 0, length.out = nreps)
    loser_dots <- seq(from = 0, to = 0, length.out = nreps)

    for(trial in 1:nreps){
        Jill <- 0L  # Total number of dots rolled by Jill
        Jack <- 0L  # Total number of dots rolled by Jack

        while((Jill < d) & (Jack < d)){
            Jill <- Jill + sample(1:6, size = 1, replace = TRUE)  # replace =  TRUE means repeat of same value can occur 
            if(Jill < d){
                Jack <- Jack + sample(1:6, size = 1, replace = TRUE)
            }
        }

        # input data into notebook
        if(Jill >= d){
            winners[trial] <- "Jill"
            prize[trial] <- Jill
            loser_dots[trial] <- Jack
        }else if(Jack >= d){
            winners[trial] <- "Jack"
            prize[trial] <- Jack
            loser_dots[trial] <- Jill
        }
    }   
    return(list("Winners" = winners, "Prize" = prize, "loserDots" = loser_dots))
}


prob_jill_wins <- function(notebook){
    "
    notebook <- list(winners, prize, loser's_dot)
    Calculates the probability of Jill winning in any nunmber of turns 
    "
    
    winners <- notebook[1]
    event <- 0
    nreps <- lengths(winners)
    for(i in 1:nreps){
        if(winners[[1]][i] == "Jill"){
            event <- event + 1
        }
    }
    return(event/nreps)
}


# calculates the probability of Jill winning on her second turn
simjj1b <- function(d, nreps){
    "
    d <- number of dots needed by player to win the game
    nreps <- # of trials in the experiment
    ----------------------------------------------------
    simjj1b will recreate simulation, do not need to call simjj(d,nreps) before calling simjj1b(d,nreps)
    "

    # variable declaration
    winners <- seq(from = 0, to = 0, length.out = nreps)  # stores winner of each trial
    winners_turns <- seq(from = 0, to = 0, length.out = nreps)  # stores the # of turns the winner need to win
    probability <- 0  
    event_occurence <- 0  # number of times in experiment when Jill wins with 2 turns
 
    # Each trial of experiment
    for(trial in 1:nreps){
        Jill <- 0  # stores running total of Jill's dots
        Jack <- 0  # stores running total of Jack's dots
        turns <- 0

        # game loop
        while((Jill < d) & (Jack < d)){
            Jill <- Jill + sample(1:6, size = 1,replace = TRUE)
            turns = turns + 1
            if(Jill < d){
                Jack <- Jack + sample(1:6, size = 1, replace = TRUE)
            }
        }

        # input data into notebook
        winners_turns[trial] <- turns
        if(Jill >= d){
            winners[trial] <- "Jill"
            
        }else if(Jack >= d){
            winners[trial] <- "Jack"
        }     
    }

    # calculate the probability taht Jill wins on her second turn
    for(i in 1:nreps){
        if((winners[i] == "Jill") & (winners_turns[i] == 2)){
            event_occurence = event_occurence + 1
        }
    }
    probability <- event_occurence / nreps
    return(probability) 
}


# calculates the probability of the difference between winner's and loser's dots being 1
simjj1c <- function(notebook){
    "
    notebook <- list(winners, prize, loser's_dot)
    Calculates the probability of the difference between winner's and loser's dots being 1
    "
    winner_dots <- notebook[2]
    loser_dots <- notebook[3]
    nreps <- lengths(notebook[1])
    event <- 0
    for(i in 1:nreps){
        if(abs(winner_dots[[1]][i] - loser_dots[[1]][i]) == 1){
            event = event + 1
        }
    }
    return(event / nreps)
}


# calculates the probability that Jill wins $6 
simjj1d <- function(notebook){
    "
    notebook <- list(winners, prize, loser's_dot)
    calculates the probability that Jill wins $6 
    "
    winners <- notebook[1]
    prize <- notebook[2]
    event <- 0
    nreps <- lengths(notebook[1])
    for(trial in 1:nreps){
        if((winners[[1]][trial] == "Jill") & (prize[[1]][trial]) == 6){
            event = event + 1
        }
    }
    return(event / nreps)

}


main <- function(){
    d <- 4
    nreps <- 100000
    notebook <- simjj(d, nreps)  # returns a list with each element being an array

    # Problem 1 Part A Simulation: --> ESSENTIALLY PROBLEM 1 PART E ANSWER
    print(simjj(d, nreps))  # prints out array in each element of list
    print(prob_jill_wins(notebook))  # P(Jill Winning) ~= 0.71

    # Problem 1 Part B Check:
    print(simjj1b(d, nreps))  # prints probability of Jill winning on her second turn, P(Jill winning in 2 turns) ~= 0.208

    # Problem 1 Part C Check: P(Diff = 1) ~= 0.04
    print(simjj1c(notebook))  # prints probability of the difference between winner's dots and loser's dots being 1 

    # Problem 1 Part D Check:  P(prize = 6 | Jill Wins) ~= 0.209
    print(simjj1d(notebook))  # given Jill wins, find probability that Jill wins $6 
}

main()