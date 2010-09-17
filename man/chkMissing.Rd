\name{chkMissing}
\alias{chkMissing}
\title{ Check Missing Data }
\description{
  chkMissing always returns TRUE in R.  If in Splus, it returns a 
  logical value, indicating if there exsist NA's in data
}
\usage{
chkMissing(...)
}

\arguments{
  \item{\dots}{ object to be tested }
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[base:NA]{is.na}}, \code{link{anyMissing}}  }

\examples{
x <- c(1, 4, NA, 0, 5)
chkMissing(x)
# [1] TRUE
}
\keyword{ utilities }
