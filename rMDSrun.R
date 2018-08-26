#!/usr/bin/env Rscript

## This is a script for performing simple MDS in R. This maybe expanded to cover more advanced cases of running MDS with larger datasets
mydata <- read.table("datafile", sep=" ")
dwib <- dist(mydata)
fit <- cmdscale(dwib,eig=TRUE, k=2)
sink('mdsMidOutputY')
fit
sink()

x <- fit$points[,1]
y <- fit$points[,2]
png("mygraph.png")
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", main="Metric MDS", type="n")
text(x, y, labels = levels(mydata$V1), cex=.7)
dev.off()

