\name{stdev}
\alias{stdev}

\title{ Standard Deviation }
\description{
  stdev computes the standard deviation of the values in x. 
  If na.rm is TRUE then missing values are removed before computation 
  proceeds. If x is a matrix or a data frame, 
  a vector of the standard deviation of the columns is returned. 
  If unbiased is TRUE then the sample standard deviation is returned, 
  else the population standard deviation is returned.
}
\usage{
stdev(x, na.rm, unbiased)
}

\arguments{
  \item{x}{ a numeric vector, matrix or data frame }
  \item{na.rm}{ logical value indicating if missing values should be removed. }
  \item{unbiased}{ whether to return biased or unbiased standard deviation }
}

\value{
  Standard deviation of x.
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\seealso{ \code{\link[stats]{sd}}, \code{\link[stats:cor]{var}} }

\examples{
x <- c(1, 4, NA, 0, 5)
stdev(x, na.rm=TRUE, unbiased=TRUE)
# [1] 2.380476
stdev(x, na.rm=TRUE, unbiased=FALSE)
# [1] 1.904381
}

\keyword{ univar }
