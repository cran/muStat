\name{muS2RC-package}
\alias{muS2RC-package}
\alias{muS2RC}
\docType{package}
\title{
Splus to R Compatibility for package muStat
}
\description{
muR2SC contains functions that are needed by package muStat
and either have different definitions in R and Splus,
or defined in Splus while not in R.
}
\details{
\tabular{ll}{
Package: \tab muS2RC\cr
Type: \tab Package\cr
Version: \tab 1.6.0\cr
Date: \tab 2010-09-17\cr
License: \tab GPL (>= 2)
}
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}, 
  Tingting Song \email{ttsong@gmail.com}

Maintainer: Tingting Song \email{ttsong@gmail.com}
}


\examples{
x <- c(1, 4, NA, 0, 5)
anyMissing(x)
# [1] TRUE
chkMissing(x)
# [1] TRUE
which.na(x)
# [1] 3
stdev(x, na.rm=TRUE, unbiased=TRUE)
# [1] 2.380476
stdev(x, na.rm=TRUE, unbiased=FALSE)
# [1] 1.904381

c <- 5
ifelse1(c>=0, 1, -1)
# [1] 1
is.inf(Inf)
# [1] TRUE
is.inf(NA)
# [1] FALSE
is.inf(1)
# [1] FALSE

is.number(32)
# [1] TRUE
is.number(matrix(1:20, nrow=2))
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
# [1,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
# [2,] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE  TRUE
is.number(list(matrix(1:20, nrow=2), 1:4))
# [1] TRUE TRUE
is.number('s')
# [1] TRUE

f1 <- function(x, y) x+y
f2 <- MC(function(x, y) x*y, list(f1=f1))
}

\keyword{ package }
