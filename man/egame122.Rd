\name{egame122}
\alias{egame122}
\title{Strategic model with 4 terminal nodes}
\usage{egame122(formulas, data, subset, na.action, link=c("probit", "logit"),
    type=c("agent", "private"), startvals=c("sbi", "unif", "zero"),
    fixedUtils, sdformula, sdByPlayer=FALSE, boot=0, bootreport=TRUE,
    ...)
}
\description{Fits a strategic model with four terminal nodes, as in the game illustrated
below in \dQuote{Details}.}
\details{The model corresponds to the following extensive-form game:
\preformatted{
.        ___ 1 ___
.       /         \
.      /           \
.   2 /             \ 2
.    / \           / \
.   /   \         /   \
.  /     \       /     \
. u11    u12    u13    u14
. 0      u22    0      u24}

For additional details on any of the function arguments or options, see
\code{\link{egame12}}.  The only difference is that the right-hand side of
\code{formulas} must have six components (rather than four) in this case.}
\value{An object of class \code{c("game", "egame122")}.  See
\code{\link{egame12}} for a description of the \code{game} class.}
\author{Brenton Kenkel (\email{brenton.kenkel@gmail.com}) and Curtis
S. Signorino}
\arguments{\item{formulas}{a list of six formulas, or a \code{Formula} object with six
right-hand sides.  See \dQuote{Details} and \dQuote{Examples}.}
\item{data}{a data frame.}
\item{subset}{an optional logical vector specifying which observations from
\code{data} to use in fitting.}
\item{na.action}{how to deal with \code{NA}s in \code{data}.  Defaults to
the \code{na.action} setting of \code{\link{options}}.  See
\code{\link{na.omit}}}
\item{link}{whether to use a probit (default) or logit link structure,}
\item{type}{whether to use an agent-error (\dQuote{agent}, default) or
private-information (\dQuote{private}) stochastic structure.}
\item{startvals}{whether to calculate starting values for the optimization
from statistical backwards induction (\dQuote{sbi}, default), draw them from
a uniform distribution (\dQuote{unif}), or to set them all to 0
(\dQuote{zero})}
\item{fixedUtils}{numeric vector of values to fix for u11, u12, u13, u14,
u22, and u24.  \code{NULL} (the default) indicates that these should be
estimated with regressors, not fixed.}
\item{sdformula}{an optional list of formulas or a \code{\link{Formula}}
containing a regression equation for the scale parameter.  See
\code{\link{egame12}} for details.  This option is ignored unless
\code{fixedUtils} or \code{sdformula} is specified.}
\item{sdByPlayer}{logical: if scale parameters are being estimated (i.e.,
\code{sdformula} or \code{fixedUtils} is non-\code{NULL}), should a separate
one be estimated for each player?}
\item{boot}{integer: number of bootstrap iterations to perform (if any).}
\item{bootreport}{logical: whether to print status bar during bootstrapping.}
\item{...}{other arguments to pass to the fitting function (see
\code{\link{maxBFGS}})}
}
\examples{data(data_122)

## the formula:
fr1 <- y ~ x1 + x2 | x3 + f1 | 0 | x4 + x5 | z1 + z2 | z3 + f2
##     ^   ^^^^^^^   ^^^^^^^   ^   ^^^^^^^   ^^^^^^^   ^^^^^^^
##     y     u11       u12    u13    u14       u22       u24

m1 <- egame122(fr1, data = data_122)
summary(m1)

## dummy specification of the dependent variable
fr2 <- update(Formula(fr1), a1 + a2 ~ .)
m2 <- egame122(fr2, data = data_122)
summary(m2)

## estimation of scale parameters
fr3 <- y ~ x1 | x2 | 0 | x3 | z1 | z2
m3 <- egame122(fr3, data = data_122, sdformula = ~ x4 + z3 - 1)
summary(m3)

m4 <- egame122(fr3, data = data_122, sdformula = ~ x4 - 1 | z3 - 1, sdByPlayer = TRUE)
summary(m4)

## fixed utilities
utils <- c(0.25, -0.25, 0, 0.25, 0.5, -0.5)
m5 <- egame122(y ~ 1, data = data_122, fixedUtils = utils)
summary(m5)

m6 <- egame122(y ~ 1, data = data_122, fixedUtils = utils, sdByPlayer = TRUE)
summary(m6)}

