This is a toy R package to serve as an example for statistical computing
classes.

One purpose is to show how a regression like function (takes a formula and
fits a model) constructs the model matrix from the formula.  All of the
code worth looking at is in the file [`bar.R`](package/bar/R/bar.R).
The rest is just boilerplate to make a valid R package.

Another purpose is to show how methods of the generic function `anova` can
check that models are nested (as is required for validity of most tests of
model comparison).

It does not illustrate other aspects of formula fitting packages.  For how
the generic functions summary, predict, confint, anova and work, see the source
code for summary.lm, predict.lm, confint.lm, anova.lm, or the analogous
with glm instead of lm.

However, I have written a [gist](https://gist.github.com/cjgeyer/2056ae760b6cf696b551a9542b73d21d) about some of the the things you need to know to write a regression-like package.
