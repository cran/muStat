\name{RCRng}
\alias{RCRng}

\title{ Data Extract }
\description{
  Returns first and last emelments of a data object.
}
\usage{
RCRng(n)
}

\arguments{
  \item{n}{ data object }
}

\value{
  An vector which contains first and last values of x.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\examples{
   matrixB <- matrix(100:1,ncol=100,nrow=100)
   RCRng(matrixB)
   # [1] 100   1
}

\keyword{ utilities }
