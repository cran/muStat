\name{is.number}
\alias{is.number} 

\title{ Check Values }
\description{
  Returns TRUE if the value is finite or infinite, 
  i.e., is neither missing (NA) nor not-a-number (Nan).
  It replicates the same behavior of the homonymous S+ function.
}
\usage{
is.number(...)
}

\arguments{
  \item{\dots}{ numeric vector }
}
\details{
  is.number is TRUE if the value is finite or infinite, i.e., 
  is neither missing ( NA) nor not-a-number ( NaN). 
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\examples{
is.number(32)
# [1] TRUE
is.number(matrix(1:20, nrow=2))
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
# [1,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [2,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
is.number('s')
# [1] FALSE
}

\keyword{ utilities }
