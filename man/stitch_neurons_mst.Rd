% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neuron.R
\name{stitch_neurons_mst}
\alias{stitch_neurons_mst}
\title{Stitch multiple fragments into single neuron using minimum spanning tree}
\usage{
stitch_neurons_mst(x, threshold = Inf, k = 10L)
}
\arguments{
\item{x}{Fragments that could be a \code{\link{neuronlist}} containing
multiple neurons or a single neuron with multiple unconnected subtrees.}

\item{threshold}{The threshold distance above which new vertices will not be
connected (default=\code{Inf} disables this feature). This parameter
prevents the merging of vertices that are so far away from the main neuron
that they are likely to be spurious.}

\item{k}{The number of nearest neighbours to consider when trying to merge
different clusters.}
}
\value{
A single \code{neuron} object containing all input fragments.
}
\description{
Stitch multiple fragments into single neuron using minimum spanning tree
}
\details{
The neurons are joined using the minimum spanning tree i.e. the tree
  that minimises the sum of edge weights (here, the Euclidean distance). The
  neuron is rooted in the largest cluster; if this cluster contained the
  original root of the neuron, then this should be retained.

  Note that when a threshold length is used, it must be specified in the same
  units (microns, nm etc) as the neuron being stitched.

  If you wish to process a neuronlist containing multiple neurons each of
  which must have all their subtrees stitched then you must use
  \code{\link{nlapply}} to process the list iteratively.
}
\examples{
n=Cell07PNs[['ECA34L']]
# find the tree with the 10 most important branches
n_main=simplify_neuron(n, n = 10)
# and the complement
n_branches=simplify_neuron(n, n = 10, invert = TRUE)

# plot the inputs
plot(n_main, col='red', WithNodes=FALSE)
plot(n_branches, col='blue', add=TRUE, WithNodes=FALSE)

# join the two fragments back together again
# first make a neuronlist containing the two fragments
nl=neuronlist(n_main, n_branches)
# and stitch those
n_stitched=stitch_neurons_mst(nl)

\dontrun{
# look at the neurons in 3D - they appear identical in this case
plot3d(n, alpha=.5, col='cyan', WithNodes=FALSE)
plot3d(n_stitched, alpha=.5, col='red', WithNodes=FALSE)
}

## second example neuron containing multiple sub trees
n=Cell07PNs[['ECA34L']]
# remove a single vertex, breaking the neuron in two
# note that the root (purple node) has moved 
np=prune_vertices(n, 105)
plot(np)

# now stitch the broken neuron back together again
nph=stitch_neurons_mst(np)
# note that the root remains the same as the input neuron (np)
plot(nph)
}
\seealso{
\code{\link{simplify_neuron}}, \code{\link{spine}},
  \code{\link{ngraph}}, \code{igraph::\link[igraph]{mst}}
}
\author{
Sridhar Jagannathan \email{j.sridharrajan@gmail.com}
}
