\name{len}
\alias{len}

\title{ Length of an Object }
\description{
  Get the length of vectors (including lists) and factors, 
  and of any other object for which a method has been defined. 
}

\usage{
len(...)
}

\arguments{
  \item{\dots}{ object }
}
\details{
  len() cannot reset the length of a vector, while length() could.
}
\value{
  For vectors (including lists) and factors the length is the number 
  of elements. 
  For an environment it is the number of objects in the environment, 
  and NULL has length 0. 
  For expressions and pairlists (including language objects and 
  dotlists) it is the length of the pairlist chain. 
  All other objects (including functions) have length one: 
  note that for functions this differs from S.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\examples{
len(c(1:20))
}

\keyword{ utilities }
