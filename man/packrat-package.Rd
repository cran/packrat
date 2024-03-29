% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/packrat.R
\docType{package}
\name{packrat-package}
\alias{packrat}
\alias{packrat-package}
\title{Packrat: Reproducible dependency management}
\description{
Packrat is a tool for managing the \R packages your project depends on in
an isolated, portable, and reproducible way.
}
\details{
Use packrat to make your \R projects more:

\itemize{
\item \strong{Isolated}: Installing a new or updated package for one project
won't break your other projects, and vice versa. That's because packrat gives
each project its own private package library.
\item \strong{Portable}: Easily transport your projects from one computer to
another, even across different platforms. Packrat makes it easy to install the
packages your project depends on.
\item \strong{Reproducible}: Packrat records the exact package versions you
depend on, and ensures those exact versions are the ones that get installed
wherever you go.
}

Use \code{\link{init}} to create a new packrat project,
\code{\link{snapshot}} to record changes to your project's library, and
\code{\link{restore}} to recreate your library the way it was the last time you
(or anyone!) took a snapshot.

Using these simple functions and sharing packrat's files lets you collaborate
in a shared, consistent environment with others as your project grows and
changes, and provides an easy way to share your results when you're done.
}
\section{Anatomy of a packrat project}{


A packrat project contains a few extra files and directories. The
\code{\link{init}} function creates these files for you, if they don't
already exist.

\describe{
  \item{\code{packrat/lib/}}{Private package library for this project.}
  \item{\code{packrat/src/}}{Source packages of all the dependencies that
packrat has been made aware of.}

  \item{\code{packrat/packrat.lock}}{Lists the precise package versions that were used
to satisfy dependencies, including dependencies of dependencies. (This file
should never be edited by hand!)}

  \item{\code{.Rprofile}}{Directs \R to use the private package
library (when it is started from the project directory).}
}
}

\section{Using packrat with version control}{


Packrat is designed to work hand in hand with Git, Subversion, or any other
version control system. Be sure to check in the \code{.Rprofile},
\code{packrat.lock} files, and everything under
\code{packrat/src/}. You can tell your VCS to ignore \code{packrat/lib/} (or
feel free to check it in if you don't mind taking up some extra space in your
repository).
}

\examples{
\dontrun{
# Create a new packrat project from an existing directory of \R code
init()

# Install a package and take a snapshot of the new state of the library
install.packages("TTR")
snapshot()

# Accidentally remove a package and restore to add it back
remove.packages("TTR")
restore()
}

}
\seealso{
Useful links:
\itemize{
  \item \url{https://github.com/rstudio/packrat}
  \item Report bugs at \url{https://github.com/rstudio/packrat/issues}
}

}
\author{
Posit Software, PBC
}
