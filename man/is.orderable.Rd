\name{is.orderable}
\alias{is.orderable}

\title{ If a value can be ordered }
\description{
  is.orderable() returns !is.na()
}
\usage{
is.orderable(x)
}

\arguments{
  \item{x}{ object to be tested }
}
\details{
  is.orderable(x) works elementwise when x is a list. 
}
\value{
  is.orderable returns a logical vector of the same attribute
  as its argument x
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[base:NA]{is.na}}}

\examples{
x <- c(1, 4, NA, 0, 5)
is.orderable(x)
# [1]  TRUE  TRUE FALSE  TRUE  TRUE
}
\keyword{ manip }
