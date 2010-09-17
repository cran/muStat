\name{which.na}
\alias{which.na}

\title{ Determine Which Values are Missing Values }
\description{
  which.na returns an integer vector describing which values in the 
  input vector, if any, are missing
}
\usage{
which.na(x)
}

\arguments{
  \item{x}{ a data object }
}

\value{
  integer vector containing indices of elements in x which are missing.
  If there are no missing values, the functions return an integer vector
  of length 0 ( numeric(0)).
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[base:NA]{is.na}} }

\examples{
x <- c(1, 4, NA, 0, 5)
which.na(x)
# [1] 3
}

\keyword{ utilities }
