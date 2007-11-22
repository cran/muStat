\name{mu.rank}

\alias{mu.rank}
\alias{mu.rank.nna}

\title{ Ranks of Data }

\description{
  Returns a vector of the (mid-) ranks of the input.
}

\usage{
mu.rank(x, na.last = TRUE, na.rm=Inf)
mu.rank.nna(x)
}

\arguments{
  \item{x}{ numeric vector. Missing values (\code{NA}) are allowed for
    \code{mu.rank} but not for \code{mu.rank.nna} }
  \item{na.last}{ vector with one element. 
    If \code{TRUE}, \code{NA}s are put last, 
    if \code{FALSE}, \code{NA}s are put first,
    if \code{NA}, \code{NA}s are handled according to \code{na.rm};
    \code{"keep"} is equivalent to \code{NA} and \code{na.rm} = F.} 
  \item{na.rm}{ logical flag, indicating if missing values (\code{NA}) 
    should be removed (\code{TRUE}) or not (\code{FALSE}) in the output. 
    If \code{NA}, \code{NA}s in \code{x} are not allowed and 
    \code{na.last} is ignored. The default for \code{na.rm}
    is \code{TRUE} if \code{na.last = NA} and \code{FALSE} else. }
}

\details{
  \code{mu.rank} is faster than \code{rank}. The treatment of missing
  values is controlled by both \code{na.last} and \code{na.rm}.
}

\value{
  the ranks; i.e., the \code{i}-th value is the rank of \code{x[i]}. 
  In case of ties, average ranks is returned.
}

\author{
  Knut M. Wittkowski \email{kmw@rockefeller.edu}, 
  Tingting Song \email{ttsong@gmail.com}
}
  
\seealso{ \code{\link[base]{rank}} }

\examples{
a <- c(4, 2, 5, 1, 4, NA, 6)
mu.rank(a) # default: na.last=TRUE, na.rm=FALSE
# [1] 3.5 2.0 5.0 1.0 3.5 7.0 6.0
mu.rank(a,na.last=NA) # default: na.rm=TRUE
# [1] 3.5 2.0 5.0 1.0 3.5     6.0
mu.rank(a,na.last=NA,na.rm=FALSE)
#     3.5 2.0 5.0 1.0 3.5  NA 6.0

# Spearman's rank correlation between two sets of testscores 
a <- c(4, 2, 5, 1, 4, NA, 6)
b <- c(4, 2, 5, NA, 4, 5, 6)

cor(a, b, if(is.R()) "complete.obs" else "available") 
# [1] 0.8241688
cor(a, b, if(is.R()) "pairwise.complete.obs" else "omit")
# [1] 1

cor(rank(a), rank(b))
# [1] 0.1651446
cor(mu.rank(a, na.last=NA, na.rm=FALSE),
    mu.rank(b, na.last=NA, na.rm=FALSE), 
    if(is.R()) "complete.obs" else "available")
# [1] 0.8523852 
cor(mu.rank(a, na.last=NA, na.rm=FALSE),
    mu.rank(b, na.last=NA, na.rm=FALSE), 
    if(is.R()) "pairwise.complete.obs" else "omit")
# [1] 0.9953452
cor(rank(a[!is.na(a*b)]), rank(b[!is.na(a*b)]))
# [1] 1
}

\keyword{nonparametric}
