\name{sq.array}
\alias{sq.array}
\alias{sq.matrix}

\title{ Produce Square Array or Square Matrix }
\description{
  Convert input data to a square array or a square matrix.
}
\usage{
sq.array(x)
sq.matrix(x)
}

\arguments{
  \item{x}{ 
    data object.  If \code{x} is a vector, length of \code{x} should 
    be a square number. Otherwise, the second dimension of x should 
    be a square number.
    }
}

\value{
  A square matrix with elements coming from \code{x}.
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}
}

\examples{
sq.matrix(1:25)
sq.array(matrix(1:50, ,2))
}

\keyword{multivariate}
