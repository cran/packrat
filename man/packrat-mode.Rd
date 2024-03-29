% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/packrat-mode.R
\name{packrat-mode}
\alias{packrat-mode}
\alias{packrat_mode}
\alias{on}
\alias{off}
\title{Packrat Mode}
\usage{
packrat_mode(
  on = NULL,
  project = NULL,
  auto.snapshot = get_opts("auto.snapshot"),
  clean.search.path = FALSE
)

on(
  project = NULL,
  auto.snapshot = get_opts("auto.snapshot"),
  clean.search.path = TRUE,
  print.banner = TRUE
)

off(project = NULL, print.banner = TRUE)
}
\arguments{
\item{on}{Turn packrat mode on (\code{TRUE}) or off (\code{FALSE}). If omitted, packrat mode
will be toggled.}

\item{project}{The directory in which packrat mode is launched -- this is
where local libraries will be used and updated.}

\item{auto.snapshot}{Perform automatic, asynchronous snapshots?}

\item{clean.search.path}{Detach and unload any packages loaded from non-system
libraries before entering packrat mode?}

\item{print.banner}{Print the packrat banner when entering / exiting packrat mode?
The packrat banner informs you of the new packrat mode state, as well as the library
path in use.}
}
\description{
Use these functions to switch \code{packrat} mode on and off. When within
\code{packrat} mode, the \R session will use the private library generated
for the current project.
}
