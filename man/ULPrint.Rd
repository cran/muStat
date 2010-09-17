
\name{ULPrint}
\alias{ULPrint}

\title{ Print Data }
\description{
  Prints a data object according to the specified size.
}
\usage{
ULPrint(aData, nRows=10, nCols=10, Title="")
}

\arguments{
  \item{aData}{ data }
  \item{nRows}{ no. of rows to print }
  \item{nCols}{ no. of cols to print }
  \item{Title}{ title of output}
}

\value{
   aData is printed according to nRows and nCols
}

\author{ Knut M. Wittkowski \email{kmw@rockefeller.edu} }

\examples{
   matrixA <- matrix(1:100, nrow=100, ncol=100)
   ULPrint(matrixA)
   #   [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
 # [1,]    1    1    1    1    1    1    1    1    1     1
 # [2,]    2    2    2    2    2    2    2    2    2     2
 # [3,]    3    3    3    3    3    3    3    3    3     3
 # [4,]    4    4    4    4    4    4    4    4    4     4
 # [5,]    5    5    5    5    5    5    5    5    5     5
 # [6,]    6    6    6    6    6    6    6    6    6     6
 # [7,]    7    7    7    7    7    7    7    7    7     7
 # [8,]    8    8    8    8    8    8    8    8    8     8
 # [9,]    9    9    9    9    9    9    9    9    9     9
 # [10,]   10   10   10   10   10   10   10   10   10    10
 # ...
}

\keyword{ utilities }
