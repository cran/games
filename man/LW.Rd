\name{LW}
\alias{LW}
\title{Lambert's W}
\usage{LW(x)
}
\description{Solves for W in the equation \eqn{W e^W = x}{W * exp(W) = x}.}
\details{The function is based on the code given in Barry et al. (1995).  It is used
to calculate fitted values for the \code{\link{ultimatum}} model.

If negative values of \code{x} are supplied, \code{NaN}s will likely be
returned.}
\value{Solutions to Lambert's W for each value in \code{x}.}
\references{D.A. Barry, P.J. Culligan-Hensley, and S.J. Barry.  1995.  "Real
Values of the W-Function."  \emph{ACM Transactions on Mathematical Software}
21(2):161--171.}
\author{Curt Signorino (\email{curt.signorino@rochester.edu})}
\arguments{\item{x}{vector of values to solve for.}
}
\examples{x <- rexp(10)
w <- LW(x)
all.equal(x, w * exp(w))}

