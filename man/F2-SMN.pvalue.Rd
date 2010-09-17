\name{SMN.pvalue}

\alias{SMN.pvalue}
\alias{TDT.pvalue}
\alias{DMM.pvalue}
\alias{MCN.pvalue}

\title{Stratified McNemar (TDT, sign) test for association studies}

\description{
  Performs an asymptotic or exact stratified McNemar/sign test  
  using a notation adopted to genetic association studies.
}
\usage{
SMN.pvalue(pP,qP, pX=0,qX=0, pQ=0,qQ=0, wP=0.25,wQ=0.25, exact=NULL)
TDT.pvalue(pP,qP, pX,xX,qX, pQ,qQ,               exact=FALSE)
DMM.pvalue(pP,qP,    xX,           condvar=TRUE, exact=FALSE)
MCN.pvalue(pP,qP,                                exact=FALSE)
}

\arguments{

  \item{pP}{
    a numeric value, 
    number of children homozygous for allele \dQuote{P} (\dQuote{PP})
    among parents of mating types \dQuote{PP} and \dQuote{PQ}.
    Corresponds to \dQuote{a} or \dQuote{0/1} in a classical 
    \eqn{2 \times 2}{\code{2x2}} table.
    Required.}
  \item{qP}{ 
    a numeric value, 
    number of heterozygous children (\dQuote{PQ})
    among parents of mating types \dQuote{PP} and \dQuote{PQ}.
    Corresponds to \dQuote{c} or \dQuote{1/0} in a classical 
    \eqn{2 \times 2}{\code{2x2}} table.
    Required.}
        
  \item{pX}{
    a numeric value, 
    number of children homozygous for allele \dQuote{P} (\dQuote{PP})
    among parentso of mating types \dQuote{PQ} and \dQuote{PQ} 
    (both heterozygous).  Corresponds to \dQuote{a} or \dQuote{0/1} in 
    a classical \eqn{2 \times 2}{\code{2x2}} table.}
  \item{xX}{ 
    a numeric value, 
    number of heterozygous children (\dQuote{PQ})
    among parentso of mating types \dQuote{PQ} and \dQuote{PQ} 
    (both heterozygous).  Corresponds to the sum of \dQuote{b} and 
    \dQuote{d} or \dQuote{0/0} and \dQuote{1/1} in a classical
    \eqn{2 \times 2}{\code{2x2}} table.}
  \item{qX}{ 
    a numeric value, 
    number of children homogzygous for allele \dQuote{Q} (\dQuote{QQ})
    among parentso of mating types \dQuote{PQ} and \dQuote{PQ} 
    (both heterozygous).  Corresponds to \dQuote{c} or \dQuote{1/0} in 
    a classical \eqn{2 \times 2}{\code{2x2}} table.}

  \item{qQ}{ 
    a numeric value, 
    number of heterozygous children (\dQuote{PQ})
    among parents of mating types \dQuote{PQ} and \dQuote{QQ}.
    Corresponds to \dQuote{c} or \dQuote{1/0} in a classical
    \eqn{2 \times 2}{\code{2x2}} table.}
  \item{pQ}{
    a numeric value, 
    number of children homozygous for allele \dQuote{Q} (\dQuote{QQ})
    among parents of mating types \dQuote{PQ} and \dQuote{QQ}.
    Corresponds to \dQuote{c} or \dQuote{0/1} in a classical
    \eqn{2 \times 2}{\code{2x2}} table.}
 
  \item{wP}{
    relative weight to be assigned to children with one \dQuote{PP} 
    parent. Default: \code{.25}.}
  \item{wQ}{
    relative weight to be assigned to children with one \dQuote{QQ} 
    parent. Default: \code{.25}.}
  
  \item{condvar}{ 
    if \code{FALSE}, the variance is conditional on 
    (\dQuote{corrected for}) 
    the observed ties, otherwise, the variance is the expected 
    variance in the absence of ties, see Wittkowski (1988, 1998) 
    and Randles (2001) for details. }
  \item{exact}{
    if \code{TRUE}, the exact p-value is computed
    unless the product of block sizes exceets \code{10^6},
    if \code{NULL}, the exact p-value is computed
    if the sum of block sizes is below \code{100},
    if \code{FALSE}, the exact p-value is never computed. }
}

\value{
  \item{p.value}{
    the asymptotic or exact p-value of the test.}
}

\section{Null Hypothesis}{
  The null hypothesis is that for any two observations chosen randomly 
  from the same block (parental mating type), the probability that it 
  falls into the first category (\dQuote{PP}, \dQuote{PP}, or 
  \dQuote{PQ}, respectively) is the same as the probability that it 
  falls into the second category (\dQuote{PQ}, \dQuote{QQ}, or 
  \dQuote{QQ}, respectively). 
}
\section{Test Assumptions}{
  Except for \code{TDT.pvalue}, 
  the children are assumed to be randomly chosen from the population 
  of children born to parents with the same parental mating type.
  The asymptotic p.value should be interpreted carefully. It is only a 
  large-sample approximation whose validity increases with the size of 
  the smallest of the groups and/or the number of blocks. 
}
\details{
  \code{TDT.pvalue} is given for historical purposes only. It should
  be deprecated, because it is based on the unrealistic assumption 
  that the individual \emph{alleles} (rather than \emph{children}) are 
  randomly chosen from the population of transmitted alleles. 

  Choosing weights \code{(wP, wQ)}  as \code{(.00, .50)} or 
  \code{(.50, .00)} maximises the sensitivity of the test to detect
  dominant or recessive alleles, respectivel.
}

\section{Algorithm}{
\preformatted{
SMN.pvalue <- function(pP,qP, pX=0,qX=0, pQ=0,qQ=0, 
      wP=.25,wQ=.25, exact=NULL) {
  M <- function(P,X,Q, wP,wQ, e = 1, op = "+", f = function(x) x) {
    O3 <- function(X,Y,Z,Op) matrix(outer(outer(X,Y,Op),Z,Op))
    O3(wP^e*f(P), (1-wP-wQ)^e*f(X), wQ^e*f(Q), op) }

  exact <- (dP<-pP-qP)+(dX<-pX-qX)+(dQ<-pQ-qQ)<100 
            && is.null(exact) || exact
  if (((nP<-pP+qP)*(nX<-pX+qX)*(nQ<-pQ+qQ)>10^6) || !exact )
    return( 1-pchisq(
      M(dP,dX,dQ, wP,wQ)^2/              # Eq. (1) in Wittkowski (2002)
      M(nP,nX,nQ, wP,wQ, 2),1)[1])       # Eq. (2) in Wittkowski (2002)
  else {
    tb <- cbind(
      M(nP,nX,nQ, wP,wP, 0,"*", function(n) mu.dbinom(0:n, n, .5)),
      M(nP,nX,nQ, wP,wQ, 1,"+", function(n) (0:n)-(n:0) )^2)
    return(1-sum(tb[tb[,2]<c(M(dP,dX,dQ, wP,wQ)^2),1])) }
}
}
}

\references{
  Dixon, W.J., Mood, A.M. (1946) 
    \emph{J Am Statist Assoc} \bold{41}: 557-566 
  
  McNemar, Q (1947) 
    \emph{Psychometrica} \bold{12}: 153-157 
  
  Dixon, W.J., Massey, F.J.J. (1951) 
    \emph{An Introduction to Statistical Analysis}. New York, NY: McGraw-Hill
  
  Wittkowski, K. M. (1988) 
    \emph{Journal of the American Statistical Association}, \bold{83}: 1163-1170. 
  
  Wittkowski, K. M. (1998) 
    \emph{Biometrics}, \bold{54}: 789-C791
  
  Spielman, R.S., McGinnis, R.E., Ewens, W.J. (1993) 
    \emph{Am J Hum Genet} \bold{52}: 506-516. 
  
  Wittkowski, K.M., Liu, X. (2002) 
    \code{Hum Hered} \bold{54}: 157-164, \bold{58}: 59-62 
}

\author{Knut M. Wittkowski \email{kmw@rockefeller.edu}}

\seealso{
  \code{\link[stats]{friedman.test}},
  \code{\link[stats]{binom.test}},
  \code{\link[stats]{chisq.test}},
  \code{\link[stats]{mcnemar.test}},
  \code{\link[stats]{mantelhaen.test}}
}

\examples{

SMN.pvalues <- function(n, wP = 0.25, wQ = 0.25) {
  print(SMN.pvalue(
    n[1,1],n[1,2], n[2,1], n[2,3], n[3,2],n[3,3], wP, wQ, exact = FALSE))
  print(SMN.pvalue(
    n[1,1],n[1,2], n[2,1], n[2,3], n[3,2],n[3,3], wP, wQ, exact = TRUE))
}
TDT.pvalues <- function(n){
  print(TDT.pvalue(
    n[1,1],n[1,2], n[2,1],n[2,2],n[2,3], n[3,2],n[3,3], exact = FALSE))
  print(TDT.pvalue(
    n[1,1],n[1,2], n[2,1],n[2,2],n[2,3], n[3,2],n[3,3], exact = TRUE))
}   

  wP <- 0.25;  wQ <- 0.25

  n <- matrix(c(
      1,3,0,   wP, 
      1,0,1,(1-wP-wQ), 
      0,3,1,      wQ), ncol=4, byrow=TRUE)

  SMN.pvalues(n)
  TDT.pvalues(n)

  n[3,2] <- 1
  n[3,3] <- 3;  SMN.pvalues(n);  TDT.pvalues(n)

  n[2,2] <- 1;  SMN.pvalues(n);  TDT.pvalues(n)

  n[2,2] <- 3;  TDT.pvalues(n)
  n[2,2] <- 2;  TDT.pvalues(n)
  n[2,3] <- 3;  TDT.pvalues(n)

  SMN.pvalues(n, .25, .25)
  SMN.pvalues(n, .00, .50)
  SMN.pvalues(n, .50, .00)
}

\keyword{htest}
\keyword{multivariate}
\keyword{nonparametric}
