% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{data_to_path}
\alias{data_to_path}
\title{Dump a data.frame to a .arff file.}
\usage{
data_to_path(data, target = "target", data_path = NULL,
  step = "train")
}
\arguments{
\item{data}{\code{\link{data.frame}} | \code{\link{character}} \cr
Either a \code{data.frame} containing the data, or the file path.
In the latter case, nothing happens and the file path is only checked for consistency.}

\item{target}{\code{\link{character}} \cr
Target variable.}

\item{data_path}{\code{\link{character}} \cr
Path to save data to. If NULL, a temporary file is created.}

\item{step}{\code{\link{character}} \cr
Step in the procedure, either "train or "test".
Some additional steps are performed in case "train".}
}
\value{
The file path
}
\description{
Saves a data.frame to an arff, so it can be used for the time-series
classifier.
}
\examples{
  data = data.frame(matrix(rnorm(300), nrow = 30))
  data$class = factor(sample(letters[1:2], 10, replace = TRUE))
  data_to_path(data, target = "class", data_path = tempfile(), step = "train")
}
