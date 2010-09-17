\name{is.inf}
\alias{is.inf}

\title{ Infinite }
\description{
  is.inf returns a vector of the same length as the input object, 
  indicating which elements are infinite (not missing). 
}
\usage{
is.inf(...)
}

\arguments{
  \item{\dots}{ object to be tested }
}
\details{
  is.infinite returns a vector of the same length as x the jth element 
  of which is TRUE if x[j] is infinite (i.e., equal to one of Inf or 
  -Inf). This will be false unless x is numeric or complex. 
  Complex numbers are infinite if either the real and imaginary part is.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ ~~objects to See Also as \code{\link[base]{is.finite}}}
\examples{
is.inf(Inf)
# [1] TRUE
is.inf(NA)
# [1] FALSE
is.inf(1)
# [1] FALSE
}

\keyword{ utilities }
