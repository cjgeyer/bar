This is a toy R package to serve as an example for the statistical computing
class (Stat 8054) at the University of Minnesota School of Statistics.

The purpose is to show how a regression like function (takes a formula and
fits a model) constructs the model matrix from the formula.  All of the
code worth looking at is in the file [`bar.R`](package/bar/R/bar.R).
The rest is just boilerplate to make a valid R package.

It does not illustrate other aspects of formula fitting packages.  For how
the generic functions summary, predict, confint, anova work, see the source
code for summary.lm, predict.lm, confint.lm, anova.lm, or the analogous
with glm instead of lm.
