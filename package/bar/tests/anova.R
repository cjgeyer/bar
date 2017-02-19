
 library(bar)

 # make up data
 set.seed(42)
 n <- 100
 x1 <- rnorm(n)
 x2 <- 0.5 * x1 + sqrt(1 - 0.5^2) * rnorm(n)
 y <- x1 + x2 + rnorm(n)

 # fit some models
 out1 <- bar(y ~ x1 + x2)
 out2 <- bar(y ~ poly(x1, x2, degree = 2))
 out3 <- bar(y ~ poly(x1, x2, degree = 3))

 # try anova
 anova(out1, out2, out3)

 # try really different formula
 out2.too <- bar(y ~ x1 + x2 + I(x1^2) + I(x2^2) + I(x1*x2))
 anova(out1, out2.too, out3)

 # now for some errors
 try(anova(out1, out3, out2))

 out2.foo <- out2
 out2.foo$y[1] <- 42
 try(anova(out1, out2.foo, out3))
