# ISC: improved spectral clustering

## Overview

ISC is an improved spectral clustering method for clustering
single-cell data that is based on both similarities and dissimilarities between cells. The method first measures the similarity/dissimilarity among cells, then constructs the incidence matrix by fusing similarity matrix with dissimilarity matrix, and, finally, uses the eigenvalues of the incidence matrix to perform dimensionality reduction and employs the K-means algorithm in the low dimensional space to achieve clustering.

## Main functions

Improved_spectral_clustering.m: Main ISC method consisting of the three steps

SpearMatrix.m: Quantifying pairwise similarities and dissimilarities

spectral_clustering.m: Extracting feature vectors for K-means clustering

evaluate.m: evaluate the performance of the clustering method

## Example data files

norm_515_data.mat: processed single-cell gene expression dataset

cell_515_type.mat: true cell type label
