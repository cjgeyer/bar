
 library(bar)

 #### try with data frame #####

 data(stackloss)
 bar(stack.loss ~ Air.Flow + poly(Water.Temp, degree = 2),
    data = stackloss)
 
 #### try without data frame #####

 x <- 1:30
 y <- x + rnorm(length(x))
 bar(y ~ x + I(x^2))

 #### try partially with and partially without #####

 y <- rnorm(nrow(stackloss))
 bar(y ~ Air.Flow + poly(Water.Temp, degree = 2),
    data = stackloss)

