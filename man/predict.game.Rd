\name{predict.game}
\alias{predict.game}
\title{Predicted probabilities for strategic models}
\usage{\method{predict}{game}(object, ...)

\method{predict}{egame12}(object, newdata, probs=c("outcome", "action"),
na.action = na.pass, ...)
\method{predict}{egame122}(object, newdata, probs=c("outcome", "action"),
na.action = na.pass, ...)
\method{predict}{egame123}(object, newdata, probs=c("outcome", "action"),
na.action = na.pass, ...)
\method{predict}{ultimatum}(object, newdata, na.action = na.pass, ...)}
\description{Makes predicted probabilities from a strategic model.}
\details{This method uses a fitted strategic model to make predictions for a new
set of data.  Useful for cross-validating or for graphical analysis.

For many uses, such as analyzing the marginal effect of a particular
independent variable, the function \code{\link{predProbs}} will be more
convenient.}
\alias{predict.game}
\alias{predict.egame12}
\alias{predict.egame122}
\alias{predict.egame123}
\alias{predict.ultimatum}
\value{A data frame of predicted probabilities.}
\seealso{\code{\link{predProbs}} provides a more full-featured and
user-friendly wrapper, including plots and confidence bands.}
\author{Brenton Kenkel (\email{brenton.kenkel@gmail.com})}
\arguments{\item{object}{a fitted model of class \code{game}.}
\item{newdata}{data frame of values to make the predicted probabilities for.
If this is left empty, the original dataset is used.}
\item{probs}{whether to provide probabilities for outcomes (e.g., L, RL, or
RR in \code{egame12}) or for actions (e.g., whether 2 moves L or R given
that 1 moved R).}
\item{na.action}{how to deal with \code{NA}s in \code{newdata}}
\item{...}{other arguments, currently ignored.}
}

