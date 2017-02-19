
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

anova.bar <- function(object, ..., tolerance = .Machine$double.eps^0.75) {

    objectlist <- list(object, ...)

    if (length(objectlist) < 2)
        stop("must compare two or more models")
    # I know anova.lm and anova.glm do something with just one
    # but what they do is often statistical nonsense just something
    # for naive users to make fools of themselves with

    if (! all(sapply(objectlist, function(x) inherits(x, "bar"))))
        stop("some arguments not of class \"bar\"")

    nmodels <- length(objectlist)

    # check that all models have the same response

    responses <- lapply(objectlist, function(o) o$y)
    sameresp <- sapply(responses, function(y) identical(y, responses[[1]]))
    if (! all(sameresp))
        stop("not all models have same response vector")

    # check that models are nested, that is,
    # column spaces of model matrices are nested vector spaces

    modelmatrices <- lapply(objectlist, function(o) o$x)
    qrlist <- lapply(modelmatrices, qr)
    for (i in 2:nmodels) {
        modmat1 <- modelmatrices[[i - 1]]
        qr2 <- qrlist[[i]]
        resid1 <- qr.resid(qr2, modmat1)
        norm.modmat1 <- apply(modmat1, 2, function(x) sqrt(sum(x^2)))
        norm.resid1 <- apply(resid1, 2, function(x) sqrt(sum(x^2)))
        if (any(norm.resid1 / norm.modmat1 > tolerance))
            stop("model matrices not nested\nmodel ",
                i - 1, " and model ", i)
    }

    cat("Cannot do tests because we haven't really fit models.\n")
    cat("Have verified models are nested.\n")
    invisible(NULL)
}

