\name{profile.game}
\alias{profile.game}
\title{Likelihood profiles for fitted strategic models}
\usage{\method{profile}{game}(fitted, which=1:p, steps=5, dist=3, report=TRUE, ...)
}
\description{Calculate profile likelihood to assess convergence of a model.}
\details{Likelihood profiling can help determine if a model fit failed to reach a
global maximum, which can be an issue (especially for the
\code{\link{ultimatum}} model).  The process of profiling is as follows: a
parameter selected to be profiled is fixed at certain values spaced around
its originally estimated value, while the log-likelihood is maximized with
respect to the other parameters in the model.  For models with large numbers
of observations or parameters, profiling may take a long time, as \eqn{p
\times (2s + 1)}{p * (2s + 1)} models will be fit (p: number of parameters;
s: number of steps).

The function will issue a warning if a model fit in profiling has a
log-likelihood exceeding that of the original model.  This means the
original fit failed to reach a global maximum, and any inferences based on
the fitted model are invalid.  If this occurs, refit the model, passing the
\code{profile.game} output to the fitting function's \code{profile} argument
(as in the example below).  The new fit will use the coefficients from the
profile fit with the highest log-likelihood as starting values.  

The function is based loosely on \code{\link{profile.glm}} in the \pkg{MASS}
package.  However, that function focuses on the calculation of exact
confidence intervals for regression coefficients, whereas this one is for
diagnosing non-convergence.  Future versions of the \pkg{games} package may
incorporate the confidence interval functionality as well.}
\value{A list of data frames, each containing the estimated coefficients
across the profiled values for a particular parameter.  The first column of
each data frame is the log-likelihood for the given fits.  The returned
object is of class \code{c("profile.game", "profile")}.}
\seealso{\code{\link{plot.profile.game}} for plotting profiled likelihoods}
\author{Brenton Kenkel (\email{brenton.kenkel@gmail.com})}
\arguments{\item{fitted}{a fitted model of class \code{game}.}
\item{which}{integer vector giving the indices of the parameters to be
profiled.  The default is to use all parameters.  Parameters that were held
fixed in the original fitting are ignored if selected.}
\item{steps}{number of steps to take (in each direction) from the original
value for each parameter to be profiled.}
\item{dist}{number of standard errors the last step should be from the
original parameter value.}
\item{report}{logical: whether to print status bar (for complex models or
those with many parameters, profiling can be lengthy)}
\item{...}{other arguments to be passed to the fitting function (see
\code{\link{maxLik}}).}
}
\examples{data(student_offers)

## a model that does not converge to global max
f1 <- offer + accept ~ gender1 | gender2
m1 <- ultimatum(f1, maxOffer = 100, data = student_offers, s2 = 1)

p1 <- profile(m1)  ## issues warning
plot(p1)

## refit model with better starting values
m2 <- ultimatum(f1, maxOffer = 100, data = student_offers, s2 = 1, profile = p1)
p2 <- profile(m2)
plot(p2)

logLik(m1)
logLik(m2)  ## improved}

