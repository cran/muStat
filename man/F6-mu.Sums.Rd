\name{mu.Sums}

\alias{mu.Sums}
\alias{mu.wScr}
\alias{mu.score}
\alias{mu.weight}

\title{ u-Scores and Weights }
\description{
  mu.Sums computes u-scores and weights from a partial ordering.
}

\usage{
mu.Sums(GE, dsgn=1, wght=TRUE)
mu.wScr  (x, y=NULL, frml=NULL, dsgn=1, wght=TRUE) 
mu.score (x, y=NULL, frml=NULL, dsgn=1, wght=FALSE) 
mu.weight(x, y=NULL, frml=NULL, dsgn=1, wght=TRUE)
}

\arguments{
  \item{GE}{partial ordering}
  \item{x}{data matrix, variables as columns}
  \item{y}{data matrix, variables as columns}
  \item{frml}{
    see \code{\link{mu.AND}},}
  \item{dsgn}{design of the experiment.}
  \item{wght}{logical flag, if weights should be calculated.}
}

\value{
  \item{score}{u-scores}
  \item{weight}{weights}
  \item{nBelow}{number of observations that are inferior}
  \item{nAbove}{number of observations that are superior}
  \item{nEqual}{number of observations that are equivalent}
}

\section{Algorithm}{
\preformatted{
mu.Sums <- function(GE, dsgn=1, wght=TRUE) {
    ICW <- function(GE,dsgn) {
        wgt <- colSums(GE|t(GE))        # 0: orig NA, 1: like NA, >1: no NA
        sqrt(wgt*(wgt>1)/if (dsgn!=1) colSums(dsgn) else nrow(GE))
    }
    GE <- sq.matrix(GE)
    nE <- colSums(GE*t(GE)) 
    nA <- colSums(GE) - nE
    nB <- rowSums(GE) - nE
	weight <- ifelse1(wght, ICW(GE,dsgn), rep(1, length(nE)))
	list(score  = (nB-nA) * ifelse(weight==0,NA,1),
		weight = weight,
		nBelow = nB,
		nAbove = nA,
		nEqual = nE)       
}

mu.wScr <- function(x, y=NULL, frml=NULL, dsgn=1, wght=TRUE) 
	mu.Sums(mu.AND(mu.GE(x, y), frml), dsgn=dsgn, wght=wght)

mu.score  <- function(x, y=NULL, frml=NULL, dsgn=1, wght=FALSE) 
	mu.Sums(mu.AND(mu.GE(x, y), frml), dsgn=dsgn, wght=wght)$score

mu.weight <- function(x, y=NULL, frml=NULL, dsgn=1, wght=TRUE) 
	mu.Sums(mu.AND(mu.GE(x, y), frml), dsgn=dsgn, wght=wght)$weight
}
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}, 
  Tingting Song \email{ttsong@gmail.com}
}
  
\examples{
mu.Sums(mu.GE(1:100))
a.1 <- 1:10
a.2 <- 3:12
b <- c(1:5,2:6)
mu.wScr(cbind(a.1,a.2,b), frml="((1,2),3)")
}

\keyword{nonparametric}
