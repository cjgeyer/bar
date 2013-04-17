\name{bar}
\alias{bar}
\alias{print.bar}
\title{Regression Models}
\concept{regression}
\description{
  Toy part of regression model function (class example)
}
\usage{
bar(formula, data)

\method{print}{bar}(x, \ldots)
}
\arguments{

  \item{formula}{a symbolic description of the model to be fit.  See
    \code{\link{lm}}, \code{\link{glm}}, and 
    \code{\link{formula}} for discussions of the R formula mini-language.}

  \item{data}{an optional data frame containing the variables
    in the model.  If not found in \code{data}, the variables are taken
    from \code{environment(formula)}, typically the environment from
    which \code{bar} is called.}

  \item{x}{an object of class \code{"bar"} to print.}
  \item{\ldots}{other arguments to the print function (none of which are used).}

}
\value{

  For \code{bar} an object of class \code{"bar"} which is a list with
  the following components:

  \item{x}{the model matrix}
  \item{y}{the response vector}
}
\examples{
library(bar)
data(stackloss)
bar(stack.loss ~ Air.Flow + poly(Water.Temp, degree = 2),
    data = stackloss)
}
\keyword{models}
\keyword{regression}
