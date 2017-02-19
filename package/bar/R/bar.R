
bar <- function(formula, data) {

    stopifnot(inherits(formula, "formula"))

    # If you want to have the options("na.action") work as usual
    # comment the following two lines out.
    # These are for packages for which NA values in predictors
    # or response make no sense whatsoever and the only sensible
    # action is to tell the user to deal with them.
    oldopt <- options(na.action = na.fail)
    on.exit(options(oldopt))

    if (missing(data)) {
        barf <- lm(formula, method = "model.frame")
    } else {
        stopifnot(inherits(data, "data.frame"))
        barf <- lm(formula, data = data, method = "model.frame")
    }
    x <- model.matrix(formula, data = barf)
    y <- model.response(barf)
    return(structure(list(x = x, y = y), class = "bar"))
}

print.bar <- function(x, ...) {
    #### Doesn't have to be called as generic.  Can be called directly.
    #### Hence the first check.
    stopifnot(inherits(x, "bar"))
    cat("have data on", length(x$y), "individuals\n")
    cat("have", ncol(x$x), "predictors (columns of model matrix)\n")
    cat("with names:\n")
    print(colnames(x$x))
    invisible(x)
}

