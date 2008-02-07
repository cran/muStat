\name{mu.AND}
\alias{mu.AND}

\title{ Pairwise AND }

\description{
  \code{mu.AND} aggregates vectors of pairwise orderings created by 
  \code{mu.GE } in a hierarchical fashion.
}

\usage{
mu.AND(GE, frml=NULL)
}

\arguments{
  \item{GE}{ 
    matrix each column of which corresponds to one
    variable anddescribes pairwise orderings
    }
  \item{frml}{ 
    formula describing the hierarchical structure of the variables
    }
}

\value{
  \code{mu.AND} returns a vector of the same length as the columns of 
  \code{GE}, with information about pairwise orderings aggregated 
  according to \code{frml}.
}

\section{Algorithm}{
\preformatted{
mu.AND <- function(GE, frml=NULL) {
  <\dots>
  if (is.null(frml)) {
    <\dots>
    GE  <- sq.array(GE)
    AND <- GE[,,1]^0
    nNA <- AND[,1]*0
    for (i in 1:dim(GE)[3]) {
      nNA <- nNA + diag(GEi <- GE[,,i])
      AND <- AND * (GEi + (1-GEi)*(1-t(GEi))) }
    return(as.numeric(AND * ((c(nNA)\%o\%c(nNA))>0))) }

  tkn <- unlist(strsplit(frml,""))
  nok <- attr(regexpr("[0-9,()]+",frml),"match.length")
  <\dots>
  tmp <- matrix(0, dim(GE)[1]+1, <\dots>)
  FstFree <- function(tmp) match(TRUE, tmp[1,]==0, nomatch=0)

  level <- i <- 0
  while ((i <- i+1) <= nok) {
    switch( tkn[i],
      "(" = level <- level + 1,
      "," = next,
      ")" = { tmp[1, use <- (tmp[1,]==level)] <- 0
              tmp[, FstFree(tmp)] <- c(level <- level-1, mu.AND(tmp[-1, use]))},
      { num <- as.numeric(substring(
               frml,i,i<-i-1+regexpr("[,)]",substring(frml,i+1)))
        <\dots>
        tmp[,FstFree(tmp)] <- c(level, GE[, num]) } ) }
  return(tmp[-1,1])
}
}
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}, 
  Tingting Song \email{ttsong@gmail.com}
}

\examples{
mu.AND(mu.GE(matrix(1:60, , 3)))
a.1 <- 1:10
a.2 <- 3:12
b <- c(1:5,2:6)
mu.AND(mu.GE(cbind(a.1,a.2,b)), frml="((1,2),3)")
}

\keyword{multivariate}
