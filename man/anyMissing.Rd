\name{anyMissing}
\alias{anyMissing}

\title{ Check for Missing Values. }
\description{
  Check if there exist any missing values.
}
\usage{
anyMissing(x)
}

\arguments{
  \item{x}{ data object }
}
\details{
  Returns TRUE, if there are any NA's.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[base:NA]{is.na}}, \code{link{chkMissing}} }

\examples{
x <- c(1, 4, NA, 0, 5)
anyMissing(x)
# [1] TRUE
}

\keyword{ utilities }
