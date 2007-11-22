\name{NAtoZer}
\alias{NAtoZer}

\title{ Dealing With Missing Values }
\description{
  Any missing values in input data will be converted to 0.
}
\usage{
NAtoZer(x)
}

\arguments{
  \item{x}{ data object }
}

\value{
  Returns the input data object x with all missing values replaced by 0.
}
\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}
}

\examples{
NAtoZer(c(2, 4, NA, 5))
# [1] 2 4 0 5
}

\keyword{multivariate}
