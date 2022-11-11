library(clusterGeneration)

#Data simulation scenario 1: 

#three clusters of equal size, with moderate separation;  
#two non-noisy variables (representing some cranial measurements- e.g., cranial capactiy and supraorbital torus thickness),
##I chose two variables that are less likely to be directly related (rather than something like cranial capacity and cranial length);
#no outliers;
#3 replicates;
#covMethod is eigen, but I won't set eigenvalues myself;
#all other arguments will be set to default. 

genRandomClust(3, sepVal = 0.01, numNonNoisy = 2, numNoisy = 0, fileName = "scen1")

#Data simulation scenario 2: 

#three clusters of equal size, with the highest degree separation; 
#two non-noisy variables, no noisy variables; 
#no outliers; 
#1 replicate; 
#covMethod is eigen, values are set to default; 
#all other arguments will be set to default. 

genRandomClust(3, sepVal = 0.99, numNonNoisy = 2, numNoisy = 0, numReplicate = 1, fileName = "scen2")

b <- read.delim("https://raw.githubusercontent.com/raneyej/clustergen/master/scen2_1.mem", sep = " ", header = FALSE, col.names = "cluster")
head(b)
#read in the .mem file
#When header is set to 'true' by default, R reads the first line of the .mem file as the header and not an observation. I set header to false so that the .mem and .dat files have the same number of lines and can be bound. 

d <- read.delim("https://raw.githubusercontent.com/raneyej/clustergen/master/scen2_1.dat", sep = " ", )
head(d)
tail(d)
tail(c)
#read in the .dat file

plot2_data <- cbind(d, b)
head(plot2_data)
#bind the two files to plot according to cluster 

library(ggplot2)

my_colors <- c("red", "blue", "green")

scen2_plot <- ggplot(plot2_data, aes(x = x1, y = x2, color = as.factor(cluster))) +geom_point() +scale_color_manual(values = c("blueviolet", "seagreen2", "orchid1")) + labs(title = "3 clusters, sepVal = 0.99", color = "Cluster") + xlab("Variable 1") + ylab("Variable 2")
scen2_plot

scen1_dat_fixed <- read.delim("https://raw.githubusercontent.com/raneyej/clustergen/master/scen1_1.dat", sep = " ")
scen1_mem_fixed <- read.delim("https://raw.githubusercontent.com/raneyej/clustergen/master/scen1_1.mem", sep = " ", header = FALSE, col.names = "cluster")

plot1_data <- cbind(scen1_dat_fixed, scen1_mem_fixed)
head(plot1_data)


scen1_plot <- ggplot(plot1_data, aes(x = x1, y = x2, color = as.factor(cluster))) +geom_point() +scale_color_manual(values = c("hotpink", "turquoise2", "slateblue1")) + labs(title = "3 clusters, sepVal = 0.01", color = "Cluster") + xlab("Variable 1") + ylab("Variable 2")
scen1_plot

scen1_dat_fixed <- read.delim("https://raw.githubusercontent.com/raneyej/clustergen/master/scen1_1.dat", sep = " ") #read in .dat file 
scen1_mem_fixed <- read.delim("https://raw.githubusercontent.com/raneyej/clustergen/master/scen1_1.mem", sep = " ", header = FALSE, col.names = "cluster") #read in .mem file, set heading to false, add column name 'cluster'

plot1_data <- cbind(scen1_dat_fixed, scen1_mem_fixed) #column binding variable values with the cluster they belong to 
head(plot1_data)

library(ggplot2)
scen1_plot <- ggplot(plot1_data, aes(x = x1, y = x2, color = as.factor(cluster))) +geom_point() +scale_color_manual(values = c("hotpink", "turquoise2", "slateblue1")) + labs(title = "3 clusters, sepVal = 0.01", color = "Cluster") + xlab("Variable 1") + ylab("Variable 2")