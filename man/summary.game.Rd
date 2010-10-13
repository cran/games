\name{summary.game}
\alias{summary.game}
\title{Summarize a strategic model object}
\usage{\method{summary}{game}(object, useboot=TRUE, ...)
}
\description{The default method for summarizing a \code{game} object.}
\details{Forms the standard regression results table from a fitted strategic model.
Normally used interactively, in conjunction with
\code{\link{print.summary.game}}.}
\value{an object of class \code{summary.game}, containing the coefficient
matrix and other information needed for printing}
\seealso{\code{\link{print.summary.game}}}
\author{Brenton Kenkel (\email{brenton.kenkel@gmail.com})}
\arguments{\item{object}{a fitted model of class \code{game}}
\item{useboot}{logical: use bootstrap estimates (if present) to construct
standard error estimates?}
\item{...}{other arguments, currently ignored}
}

