\name{ifelse1}
\alias{ifelse1}

\title{ Conditional Data Selection }
\description{
  Places values into an object according to the logical values in test. 
}
\usage{
ifelse1(test, x, y, ...)
}

\arguments{
  \item{test}{ logical object. Missing values (NA) are allowed }
  \item{x}{ action to be taken if test is TRUE }
  \item{y}{ action to be taken if test is FALSE }
  \item{\dots}{ other }
}
\details{
  NA values in test cause NAs in the result.  Compared with ifelse()
  in Splus, the length of test in ifelse1() is 1, which means ifelse1()
  will do only one test.
}
\value{
  x or y depending on test.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[base:Control]{if}}, \code{\link[base]{ifelse}} }

\examples{
c <- 5
ifelse1(c>=0, 1, -1)
# [1] 1
}

\keyword{ utilities }
