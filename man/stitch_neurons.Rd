% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neuron.R
\name{stitch_neurons}
\alias{stitch_neurons}
\title{Stitch multiple fragments into single neuron using nearest endpoints}
\usage{
stitch_neurons(x, prefer_soma = TRUE, sort = TRUE, warndist = 1000)
}
\arguments{
\item{x}{A neuronlist containing fragments of a single neuron}

\item{prefer_soma}{When TRUE (the default) the fragment tagged as the soma
will be used as the master neuron.}

\item{sort}{When TRUE (the default) the fragments will be sorted by the
number of nodes they contain before stitching.}

\item{warndist}{If distance is greater than this value, create a warning.}
}
\value{
A single \code{neuron} object containing all input fragments.
}
\description{
Stitch multiple fragments into single neuron using nearest endpoints
}
\details{
Neurons will be ordered by default such the largest (by node count)
  neuron with a soma tag is the \code{master} neuron - i.e. the one
  containing the root node. Fragments are joined recursively in this sort
  order each time simply picking the closest fragment to the current
  \emph{master}. Closest is here defined by the distance between nearest
  endpoints.
}
\examples{
\dontrun{
dl1_main=simplify_neuron(dl1neuron, n = 1, invert = FALSE)
dl1_branches=simplify_neuron(dl1neuron, n = 1, invert = TRUE)
dl1_branches1=simplify_neuron(dl1_branches, n = 1, invert = FALSE)
dl1_branches2=simplify_neuron(dl1_branches, n = 1, invert = TRUE)
dl1_fragment <- list(dl1_main,dl1_branches1,dl1_branches2)
dl1_fragment <- as.neuronlist(dl1_fragment)
dl1_whole = stitch_neurons(dl1_fragment)
}
}
\seealso{
\code{\link{stitch_neuron}}
}
\author{
Gregory Jefferis \email{jefferis@gmail.com}
}
