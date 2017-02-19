\name{anova.bar}
\alias{anova.bar}
\title{Analysis of Deviance for Bar Model Fits}
\usage{
\method{anova}{bar}(object, \dots, tolerance = .Machine$double.eps^0.75)
}
\description{
  Compute an analysis of deviance table for two or more bar model
  fits (except we can't really because this is a toy package).
  The only functionality this function has is checking for correct
  model nesting.
}
\arguments{
  \item{object, \dots}{objects of class \code{"bar"}, typically
    the result of a call to \code{\link{bar}}.}
  \item{tolerance}{tolerance for comparing nesting of model matrices.}
}
\value{
  Should be an object of class \code{"anova"} inheriting from
  class \code{"data.frame"}.
  But since we don't actually do analysis of deviance, we just return
  \code{invisible(NULL)}.
}
\seealso{
  \code{\link{bar}} and \code{\link{anova}}.
}
\examples{
2 + 2
}
\keyword{models}
\keyword{regression}

