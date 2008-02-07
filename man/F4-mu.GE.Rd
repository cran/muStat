\name{mu.GE}
\alias{mu.GE}

\title{ GE Matrix }

\description{
  \code{mu.GE} returns a matrix with each element denoting the logical 
  value if one value is greater than or equal to another.
}
\usage{
mu.GE(x, y=x)
}

\arguments{
  \item{x}{ data matrix, variables as columns }
  \item{y}{ second data matrix, optional }
}
\details{
  The (i,j) entry of GE matrix is 1 if 
  \eqn{x_i \geq y_j}{\code{x_i >= y_j}}, 0 otherwise.  
  The square matrix GE is stored by column in a vector.
}
\value{
  a vector which contains the GE matrix.
}

\section{Algorithm}{
\preformatted{ 
mu.GE <- function(x, y=x) {
  <\dots>
  if (length(y)>1)
    apply(rbind(x,y),2,mu.GE,nrow(x))
  else 
    as.numeric(NAtoZer(outer(x[1:y],x[-(1:y)],">=")))
}
}
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}, 
  Tingting Song \email{ttsong@gmail.com}
}
  
\examples{
a <- c(4, 2, 5, 1, 4, NA, 6)
mu.GE(a)
}
\keyword{univar}
\keyword{nonparametric}
