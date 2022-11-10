library(clusterGeneration)

#Data simulation secenario 1: 
#A small sample size (mirroring actual fossil data sample size) of thirty observations; 
#three clusters of equal size, with moderate separation;  
#two non-noisy variables (representing some cranial measurements- e.g., cranial capactiy and supraorbital torus thickness),
##I chose two variables that are less likely to be directly related (rather than something like cranial capacity and cranial length);
#no outliers;
#3 replicates;
#covMethod is eigen, but I won't set eigenvalues myself;
#all other arguments will be set to default. 

genRandomClust(3, sepVal = 0.01, numNonNoisy = 2, numNoisy = 0, fileName = "scen1")

