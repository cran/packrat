% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/packrat.R
\name{restore}
\alias{restore}
\title{Apply the most recent snapshot to the library}
\usage{
restore(
  project = NULL,
  overwrite.dirty = FALSE,
  prompt = interactive(),
  dry.run = FALSE,
  restart = !dry.run
)
}
\arguments{
\item{project}{The project directory. When in packrat mode, if this is
\code{NULL}, then the directory associated with the current packrat project
is used. Otherwise, the project directory specified is used.}

\item{overwrite.dirty}{A dirty package is one that has been changed since the
last snapshot or restore. Packrat will leave these alone by default. If you
want to guarantee that \code{restore} will put you in the exact state
represented by the snapshot being applied, use \code{overwrite.dirty =
TRUE}.}

\item{prompt}{\code{TRUE} to prompt before performing potentially destructive
changes (package removals or downgrades); \code{FALSE} to perform these
operations without confirmation.}

\item{dry.run}{If \code{TRUE}, compute the changes to your packrat state that
would be made if a restore was performed, without actually executing them.}

\item{restart}{If \code{TRUE}, restart the R session after restoring.}
}
\description{
Applies the most recent snapshot to the project's private library.
}
\details{
\code{restore} works by adding, removing, and changing packages so that the
set of installed packages and their versions matches the snapshot exactly.

There are three common use cases for \code{restore}:
\itemize{
\item \strong{Hydrate}: Use \code{restore} after copying a project to a new machine
to populate the library on that machine.
\item \strong{Sync}: Use \code{restore} to apply library changes made by a
collaborator to your own library. (In general, you want to run \code{restore}
whenever you pick up a change to \code{packrat.lock})
\item \strong{Rollback}: Use \code{restore} to undo accidental changes made
to the library since the last snapshot.
}

\code{restore} cannot make changes to packages that are currently loaded. If
changes are necessary to currently loaded packages, you will need to restart
\R to apply the changes (\code{restore} will let you know when this is
necessary). It is recommended that you do this as soon as possible, because
any library changes made between running \code{restore} and restarting \R
will be lost.
}
\note{
\code{restore} can be destructive; it will remove packages that were
  not in the snapshot, and it will replace newer packages with older versions
  if that's what the snapshot indicates. \code{restore} will warn you before
  attempting to remove or downgrade a package (if \code{prompt} is
  \code{TRUE}), but will always perform upgrades and new installations
  without prompting.

  \code{restore} works only on the private package library created by
  packrat; if you have other libraries on your path, they will be unaffected.

  The \code{restart} parameter will only result in a restart of R when the R
  environment packrat is running within makes available a restart function
  via \code{getOption("restart")}.

  To install packages hosted in private repositories on GitHub, GitLab, and
  Bitbucket, you must either set the option
  \code{packrat.authenticated.downloads.use.renv} to \code{TRUE} and ensure
  that \code{curl} is available on your system, or ensure that the
  \code{httr} package is available in your R library.

  In addition, you must make credentials for your provider available in the
  appropriate environment variable(s): \code{GITHUB_PAT}, \code{GITLAB_PAT},
  and/or \code{BITBUCKET_USERNAME} and \code{BITBUCKET_PASSWORD}. These
  environment variables are hidden from package installation subprocesses.

  Packrat does not support installation from enterprise instances of GitHub,
  GitLab, or Bitbucket.

  Packrat selects a \code{tar} binary with the following heuristic: If a
  \code{TAR} environment variable exists, Packrat will use that. Otherwise,
  it will either look for a \code{tar} binary on the \code{PATH} on Unix, or
  look for the system \code{tar} on Windows. If no binary is found in those
  locations, it will use R's internal \code{tar} implementation, which may
  cause errors with long filenames.
}
\seealso{
\code{\link{snapshot}}, the command that creates the snapshots
  applied with \code{restore}.

  \code{\link{status}} to view the differences between the most recent
  snapshot and the library.
}
