\name{endfunction}
\alias{endfunction}

\title{ End a Function }
\description{
  endfunction will return an invisible NULL, which
  could mark the end of a function.
}
\usage{
endfunction(text)
}

\arguments{
  \item{text}{ any input }
}

\value{
  Always returns NULL, which will not be printed.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[base]{invisible}} }

\examples{
endfunction(f)
}

\keyword{ utilities }
