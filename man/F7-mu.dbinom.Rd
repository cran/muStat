\name{mu.dbinom}
\alias{mu.dbinom}

\title{ Binomial Distribution }

\description{
  Probability mass function (density) of the binomial distribution.
}

\usage{
mu.dbinom(x, size, prob, log = FALSE)
}

\arguments{
  \item{x}{ 
    vector of quantiles. Missing values (\code{NA}s) are allowed. 
    }
  \item{size}{ 
    vector of (positive integer) numbers of coin flips for 
    which the Binomial distribution measures the number of heads. 
    }
  \item{prob}{ 
    vector of probabilities of a head. If \code{length(x)} is larger 
    than 1, then \code{length(x)} random values are returned. 
    }
  \item{log}{ 
    logical; if \code{TRUE}, probabilities p are given as log(p). 
    }
}

\details{
\preformatted{
mu.dbinom <- function(x, size, prob, log=FALSE)
  if (size==0) 1 else dbinom(x, size, prob, log=FALSE)
} 
}

\value{
  Returns the density of bin(size, prob) at x.
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}, 
  Tingting Song \email{ttsong@gmail.com}
}
  
\seealso{ \code{\link[stats:Binomial]{dbinom}} }

\examples{
dbinom(100, 10, 3/10, log=FALSE)
}

\keyword{distribution}
