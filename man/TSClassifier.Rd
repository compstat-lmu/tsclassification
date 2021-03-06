% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TSClassifier.R
\docType{data}
\name{TSClassifier}
\alias{TSClassifier}
\title{Time Seriess Classifier}
\format{An object of class \code{R6ClassGenerator} of length 24.}
\usage{
TSClassifier
}
\description{
Allows training and predicting on time-series classification data.
Internally writes the data to an \code{.arff} file and reads it from
the command line in the Java Virtual Machine.
In some cases, the memory of the JVM is not sufficient.
In this case, the memory for the JVM can be set e.g. to 2 GB by setting
\code{options(java.options = "-Xmx2048m")} before loading the package.
}
\details{
Expects the data to either be a \code{\link{data.frame}} or a \code{\link{character}} path to a
data set in the \strong{'.arff'} format. In case a \code{data.frame} is provided, the
data is saved to '.$model_path' and then read into the JVM from there.
The target variable's name is assumed to be 'target'.
}
\section{Methods}{

\itemize{
\item new(classifier, model_path): Initialize the class.
\item train(data, target, par_vals, data_path): Delegates to \code{\link{train_tsc}}.
\item predict(newdata): Delegates to \code{\link{predict_tsc}}.
\item resample(data, target, par_vals, data_path): Delegates to \code{\link{resample_tsc}}.
\item cleanup(): Remove saved model files.
}
}

\section{Fields}{

\itemize{
\item classifier: \code{character(1)} \cr
Classifier to use, see \code{?tsc_classifiers} for a list of available classifiers.
\item target: \code{character(1)} \cr
Target variable.
\item data: \code{character(1)} | \code{\link{data.frame}} \cr
Either a path to the dataset or a data.frame that should be saved to disk
for modeling. In case a \code{data.frame} is provided, the dataset is saved to disk
via \code{data_to_path}.
\item newdata: \code{character(1)} | \code{\link{data.frame}} \cr
Data to predict on. See \code{data}.
\item par_vals: \code{\link{list}} \cr
Named list of hyperparamter_values.
\item data_path: \code{character(1)} \cr
Save path for the data.
\item target_levels: \code{\link{character}} \cr
Levels of the target variable, if a data.frame is supplied.
\item model_path: \code{character(1)} \cr
Path to store the resulting model to. Default \code{NULL} creates and stores to
a temporary file.
\item trained: \code{logical(1)} \cr
Was the model trained?
}
}

\examples{
  data = data.frame(matrix(rnorm(300), nrow = 30))
  data$class = factor(sample(letters[1:2], 10, replace = TRUE))
  tsc = TSClassifier$new("timeseriesweka.classifiers.BOSS")
  tsc$train(data[1:15,], target = "class", par_vals = list(setMaxEnsembleSize = 1))
  p = tsc$predict(data[10:20,])
}
\keyword{datasets}
