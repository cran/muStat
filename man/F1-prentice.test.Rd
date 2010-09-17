\name{prentice.test}

\alias{prentice.test}
\alias{mu.friedman.test}
\alias{mu.kruskal.test}
\alias{mu.wilcox.test}

\encoding{latin1}

\title{Prentice (Friedman/Wilcoxon/Kruskal) Rank Sum Test}

\description{
  Performs a generalized Friedman rank sum test with replicated blocked
  data or, as special cases, a Kruskal-Wallis rank sum test on data 
  following a one-way layout or a Wilcoxon rank sum test following 
  a one-way layout with only two groups.
}

\usage{
prentice.test(y, groups, blocks = NULL, 
  score = "rank", blkwght = "prentice", condvar = TRUE, 
  alternative = "two.sided", mu = 0, paired = FALSE, 
  exact = NULL, correct = FALSE, df = -1, warn = 0, optim = TRUE)        
mu.wilcox.test(y, groups, blocks = NULL, score = "rank",
  paired = FALSE, exact = TRUE, correct = TRUE, ...)    
mu.kruskal.test(y, groups, blocks, \dots )
mu.friedman.test(y, groups, blocks, \dots )
}


\arguments{

  \item{y}{
    a numeric vector of data values, 
    \code{NA}s are used to compute block weights with incomplete block 
    data (see \code{blkwght}), but will be removed with one-way designs. 
    Blocks with observations in only one group will be removed. 
    \code{Inf}s are allowed, and are not removed as they are rankable.
    Required.
    }
  \item{groups}{ 
    factor or category object of the same length as \code{y}, giving 
    the group (treatment) for each corresponding element of \code{y}. 
    \code{NA}s are allowed and observations with \code{NA} in 
    \code{groups} will be used for scoring other observations, 
    treating them as if they were observations in an additional 
    (fictional) group. 
    If not a factor or category object, it will be coerced to one.
    Required.
    }
    
  \item{blocks}{
    factor or category object of the same length as \code{y}, giving 
    the block membership for each corresponding element of \code{y}. 
    Observations with \code{NA} in \code{blocks} will be removed. 
    If not a factor or category object, it will be coerced to one. 
    }
  \item{score}{
    character or function object, giving the score function to be 
    used. If \code{NULL}, \code{y} is assumed to already have been 
    scored, e.g., by marginal likelihood scores (Wittkowski 1992) 
    or u-scores (Wittkowski 2004) for multivariate data. If a 
    function, it is applied to the ranks of \code{y} (Lehmann, 1951), 
    if character,
    \itemize{
      \item \code{"rank"} or \code{"wilcoxon"} are equivalent 
        to the default,
      \item \code{"normal"} or \code{"vanderwaerden"} are \dots  
      \item \dots (to be continued) 
      } 
    }
      \item{blkwght}{ 
    character object indicating the weights to apply to \code{blocks} 
    depending on the ratio between planned size (including \code{NA}s) 
    and observed size (excluding \code{NA}s). Options are
    \itemize{
      \item \code{"prentice"},
      \item \code{"klotz"},
      \item \code{"skillingsmack"},
      \item \code{"rai"}
      } 
    see Wittkowski (1988) and Alvo-Cabilio (2005) for details. 
    }
  \item{condvar}{ 
    if \code{FALSE}, the variance is conditional on 
    (\dQuote{corrected for}) 
    the observed ties, otherwise, the variance is the expected 
    variance in the absence of ties, see Wittkowski (1988, 1998) 
    and Randles (2001) for details. 
    }
  \item{df}{
    if \code{-1}, the degrees of freedom are computed from the 
    observed data, if \code{0}, the degrees of freedom are computed 
    from the planned number of groups, if \code{>0}, the parameter 
    value is taken as the degrees of freedom. 
    }
  \item{alternative}{
    character string, one of\code{"greater"}, \code{"less"} or 
    \code{"two.sided"}, indicating the specification of the alternative 
    hypothesis. For Wilcoxon test only.
  }

  \item{mu}{
    a single number representing the value of the mean or difference 
    in means specified by the null hypothesis. 
    }
  \item{paired}{ 
    if \code{TRUE}, the Wilcoxon signed rank test is computed. 
    The default is the Wilcoxon rank sum test. 
    }
  \item{exact}{ 
    if \code{TRUE} the exact distribution for the test statistic 
    is used to compute the p-value if possible.
    }
  \item{correct}{
    if \code{TRUE} a continuity correction is applied to 
    the normal approximation for the p-value. 
    }
  \item{warn}{ 
    no warnings will be given if \code{warn} is \code{-1} }
  \item{optim}{ 
    if \code{FALSE}, the generic algorithm (see Algorithm) is always 
    used, for testing and teaching purposes only
    if \code{TRUE}, faster algorithms are used when available.
    }

  \item{\dots}{
    further arguments to be passed to or from methods.
    }
}

\details{
  \code{prentice.test} is approximately twice as fast as 
  \code{friedman.test} or \code{kruskal.test}. In some cases, the 
  Kruskal-Wallis test reduces to the Wilcoxon Rank-sum test. 
  Thus, \code{prentice.test} allows the additional parameters 
  \code{mu}, \code{paired}, \code{exact}, and \code{correct}, 
  to be entered, and passed. To ensure consistency of the results
  between \code{wilcox.test} and \code{kruskal.test},
  the default for \code{correct} is \code{FALSE} in either case.
}

\value{
  A list with class \code{"htest"} containing the following components:
  \item{statistic}{
    the value of chi-squared statistic, 
    with \code{names} attribute \code{"statistic: chi-square"}. 
    See section DETAILS for a definition. 
    }
  \item{parameter}{
    the degrees of freedom of the asymptotic chi-squared distribution 
    associated with \code{statistic}. Component \code{parameters} has 
    \code{names} attribute \code{"df"}.
    }
  \item{p.value}{
    the asymptotic or exact p-value of the test.
    }
  \item{method}{
    a character string giving the name of the method used.
    }
  \item{data.name}{
    a character string (vector of length 1) containing the actual names
    of the input arguments \code{y}, \code{groups}, and \code{blocks}.
    }
}

\section{Null Hypothesis}{
  The null hypothesis is that for any two observations chosen randomly 
  from the same block, the probability that the first is larger than 
  the second is the same as the probability that it is smaller. 
}
\section{Test Assumptions}{
  The errors are assumed to be independent and identically distributed. 
  The returned p.value should be interpreted carefully. It is only a 
  large-sample approximation whose validity increases with the size of 
  the smallest of the groups and/or the number of blocks. 
}

\section{Algorithm}{
\preformatted{
prentice.test <- function(
  y,
  groups,
  blocks  = NULL,
  score   = "rank",       # NULL: y already scored
  blkwght = "prentice",   # block weights
  <...>)
{
  <...>

  m  <- xTable(blocks,groups)
  <...>
  p  <- dim(m)[2]-1 # planned number of groups

  y.ok   <- <...>

  y      <- y     [y.ok]
  groups <- groups[y.ok]
  blocks <- blocks[y.ok]
  M  <- xTable(blocks,groups)

  <...>

  mi <- rowSums(m)
  Mi <- rowSums(M)
  Wi <- switch(tolower(blkwght),
    prentice      = (mi+1),    
    klotz         = (Mi+1),    
    skillingsmack = sqrt(Mi+1),
    rai           = (Mi+1)/Mi, 
    <...>)
  Bijk <- Wi[blocks]

  Tijk <- Centered(
    Score(FUNByIdx(y,blocks,wRank,na.any=FALSE)/(Mi[blocks]+1)),
    blocks, Mi) * Bijk
  T1 <- qapply(Tijk,groups,sum)

  A0i2 <- (1/(Mi-1))*qapply(Tijk^2,blocks,sum)
  V0   <- structure(dim=c(P,P), A0i2 \%*\% (
            t(apply(M,1,   function(x,P) diag(x))) - (1/Mi) *
            t(apply(M,1,MC(function(x) outer1(x),list(outer1=outer1))))))
  V1   <- ginv(V0)

  W    <- as.numeric(T1 \%*\% V1 \%*\% T1)      
  df.W <- attr(V1,"rank")                       
  p.W  <- 1 - pchisq(W, df.W)
}
}
}

\references{
  Friedman, M. (1937) 
    \emph{Journal of the American Statistical Association}, \bold{32}: 675-701.
      
  Lehmann, E. L. (1951) 
    \emph{Annals of Mathematical Statistics}, \bold{22}: 165-179.
      
  Kruskal, W. H. and Wallis, W. A. (1952) 
    \emph{Journal of the American Statistical Association}, \bold{47}: 583-631.
      
  Hajek, J. and Sidak, Z. (1967) 
    \emph{Theory of rank tests}, New York, NY: Academic.
      
  Hollander, M. and Wolfe, D. A. (1973). 
    \emph{Nonparametric Statistical Methods}. New York, NY: John Wiley.
  
  Lehmann, E. L. (1975). 
    \emph{Nonparametrics: Statistical Methods Based on Ranks}. Oakland, CA: Holden-Day.
  
  Prentice, M. J. (1979) 
    \emph{Biometrika}, \bold{66}: 167-170.
  
  Wittkowski, K. M. (1988) 
    \emph{Journal of the American Statistical Association}, \bold{83}: 1163-1170. 
  
  Alvo, M. and Cabilio, P. (2005) 
    \emph{Canadian Journal of Statistics-Revue Canadienne De Statistique}, \bold{33}: 115-129.
  
  Wittkowski, K. M. (1992) 
    \emph{Journal of the American Statistical Association}, \bold{87}: 258.
  
  Wittkowski, K. M. (1998) 
    \emph{Biometrics}, \bold{54}: 789¡§C791.
    
  Randles, H. R. (2001) 
    \emph{The American Statistician}, \bold{55}: 96-101.
    
  Wittkowski, K. M., Lee, E., Nussbaum, R., Chamian, F. N. and Krueger, J. G. (2004) 
    \emph{Statistics in Medicine}, \bold{23}: 1579-1592.
}
\author{Knut M. Wittkowski \email{kmw@rockefeller.edu}}

\seealso{
  \code{\link[stats]{wilcox.test}},  
  \code{\link[stats]{kruskal.test}},
  \code{\link[stats]{friedman.test}},
  \code{\link[base]{rank}},
  \code{\link[stats]{aov}}
}

\examples{

# friedman.test examples

  treatments <- factor(rep(c("Trt1", "Trt2", "Trt3"), each=4))
  people <- factor(rep(c("Subj1", "Subj2", "Subj3", "Subj4"), 3))
  y <- c(0.73,0.76,0.46,0.85,0.48,0.78,0.87,0.22,0.51,0.03,0.39,0.44)
  print(   friedman.test(y, treatments, people))
  print(mu.friedman.test(y, treatments, people))

  # Now suppose the data is in the form of a matrix, 
  #   rows are people and columns are treatments.
  # Generate 'ymat' and the factor objects: 

  ymat <- matrix(c(0.73,0.76,0.46,0.85,0.48,0.78,0.87,0.22,0.51,
        0.03,0.39,0.44), ncol=3)
  bl <- factor(as.vector(row(ymat)))
  gr <- factor(as.vector(col(ymat)))   
  print(   friedman.test(ymat, gr, bl))  # same answer as above 
  print(mu.friedman.test(ymat, gr, bl))

# kruskal.test examples

  # Data from Hollander and Wolfe (1973), p. 116 
  holl.y <- c(2.9,3.0,2.5,2.6,3.2,3.8,2.7,4.0,2.4,2.8,3.4,3.7,2.2,2.0)
  holl.grps <- factor(c(1,1,1,1,1,2,2,2,2,3,3,3,3,3), 
      labels=c("Normal Subjects","Obstr. Airway Disease","Asbestosis"))
  print(   kruskal.test(holl.y, holl.grps))
  print(mu.kruskal.test(holl.y, holl.grps))
      
  # Now suppose the data is in the form of a table already,  
  # with groups in columns; note this implies that group 
  # sizes are the same. 

  tab.data <- matrix(c(.38,.58,.15,.72,.09,.66,.52,.02,.59,.94,
        .24,.94,.08,.97,.47,.92,.59,.77), ncol=3)
  tab.data

  y2 <- as.vector(tab.data) 
  gr <- factor(as.vector(col(tab.data)))   # Groups are columns 
  print(   kruskal.test(y2, gr))
  print(mu.kruskal.test(y2, gr))

# wilcox.test examples
  
  x <- c(8.2, 9.4, 9.6, 9.7, 10.0, 14.5, 15.2, 16.1, 17.6, 21.5)
  y <- c(4.2, 5.2, 5.8, 6.4, 7.0, 7.3, 10.1, 11.2, 11.3, 11.5)
  print(   wilcox.test(x,y))
  print(mu.wilcox.test(x,y))
  print(   wilcox.test(x,y, exact=FALSE))
  print(mu.wilcox.test(x,y, exact=FALSE))
  print(   wilcox.test(x,y, exact=FALSE, correct=FALSE))
  print(mu.wilcox.test(x,y, exact=FALSE, correct=FALSE))
  xy <- c(x,y)
  groups <- c(rep(1,length(x)),rep(2,length(y)))
  print(prentice.test(xy,groups,exact=FALSE, correct=FALSE))

# compare speed

  if (is.R()) sys.time <- function (...) system.time(...)
  
  n <- 1000
  data <- runif(30*n)
  grps <- c(rep(1,10*n),rep(2,8*n),rep(3,12*n))

  print(sys.time(    kruskal.test( data,grps)              ))
  print(sys.time( mu.kruskal.test( data,grps,optim=FALSE)  ))
  print(sys.time(    prentice.test(data,grps)              ))

  data <- runif(600)
  grps <- rep(1:6,each=100)
  blks <- rep(1:100,length.out=length(data))

  print(sys.time(    friedman.test(data,grps,blks)             ))
  print(sys.time( mu.friedman.test(data,grps,blks,optim=FALSE) ))
  print(sys.time(    prentice.test(data,grps,blks)             ))

  data <- runif(50000)
  grps <- rep(1:2,each=25000)
  Wx <- data[grps==1]
  Wy <- data[grps==2]

  print(sys.time(    wilcox.test(Wx,Wy)                    ))
  print(sys.time( mu.wilcox.test(Wx,Wy,optim=FALSE)        ))
  print(sys.time(    prentice.test(data,grps)              ))
}

\keyword{htest}
\keyword{multivariate}
\keyword{nonparametric}
