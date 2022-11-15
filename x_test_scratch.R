library(clusterGeneration)
genRandomClust(3, sepVal = 0.01, numNonNoisy = 2, numNoisy = 0, numReplicate = 1, fileName = "scenx")

x_mem <- read.delim("/Users/emilyraney/Desktop/clustergen-master/clustergen/scenx_1.mem", header = FALSE, sep = " ")
head(x_mem)

x_dat <- read.delim("/Users/emilyraney/Desktop/clustergen-master/clustergen/scenx_1.dat", sep = " ")
head(x_dat)

x_p_data <- cbind(x_dat, x_mem)
head(x_p_data)

library(ggplot2)
x_plot <- ggplot(x_p_data, aes(x = x1, y = x2, color = as.factor(V1))) + geom_point() + scale_color_manual(values = c("plum1", "mediumorchid1", "purple2")) + labs(title = "3 clusters, sepVal = 0.01", color = "Cluster") + xlab("Variable 1") + ylab("Variable 2")
x_plot
