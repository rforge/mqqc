\name{grepSubsetControl}
\alias{grepSubsetControl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
grepSubsetControl(grepVec, obj, mode = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{grepVec}{
%%     ~~Describe \code{grepVec} here~~
}
  \item{obj}{
%%     ~~Describe \code{obj} here~~
}
  \item{mode}{
%%     ~~Describe \code{mode} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (grepVec, obj, mode = 1) 
{
    if (length(grepVec) > 0) {
        if (is.vector(obj)) {
            obj <- obj[-grepVec]
        }
        if (is.matrix(obj)) {
            if (mode == 1) {
                obj <- obj[-grepVec, ]
            }
            if (mode == 2) {
                obj <- obj[, -grepVec]
            }
        }
    }
    return(obj)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
