% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unwrap.R
\name{unwrap}
\alias{unwrap}
\alias{unparens}
\title{unwrap}
\usage{
unwrap(x, left, right = left, n_pairs = Inf)

unparens(x, n_pairs = Inf)
}
\arguments{
\item{x}{character vector}

\item{left}{left character to remove}

\item{right}{right character to remove. Only removed if position is after \code{left}}

\item{n_pairs}{number of character pairs to remove}
}
\value{
character vector with pairs removed
}
\description{
Remove pair(s) of characters from a string. The pair(s) to be removed
can be at any position within the string.
}
\examples{
# by default, removes all matching pairs of left and right
x <- c("a", "(a)", "((a))", "(a) b", "a (b)", "(a) (b)" )
data.frame( x, unparens(x), check.names = FALSE )

# specify n_pairs to remove a specific number of pairs
x <- c("(a)", "((a))", "(((a)))", "(a) (b)", "(a) (b) (c)", "(a) (b) (c) (d)")
data.frame( x,
            "n_pairs=1"   = unparens(x, n_pairs = 1),
            "n_pairs=2"   = unparens(x, n_pairs = 2),
            "n_pairs=3"   = unparens(x, n_pairs = 3),
            "n_pairs=Inf" = unparens(x), # the default
            check.names = FALSE )

# use unwrap() to specify any pair of characters for left and right
x <- "A string with some \\\\emph{latex tags}."
unwrap(x, "\\\\emph{", "}")

# by default, only pairs are removed. Set a character to "" to override.
x <- c("a)", "a))", "(a", "((a" )
data.frame(x, unparens(x),
  'left=""' = unwrap(x, left = "", right = ")"),
  check.names = FALSE)

# make your own functions like this
# markdown bold
unbold <- function(x) unwrap(x, "**")
bold <- function(...) wrap(paste(...), "**")
(x <- (p("make a word", bold("bold"))))
unbold(x)
}
\seealso{
\code{\link{wrap}}
}
