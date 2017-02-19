
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

