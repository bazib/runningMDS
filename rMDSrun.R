#!/usr/bin/env Rscript

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

