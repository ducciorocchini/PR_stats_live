# Code for visualizing sat images in R

library(terra)
library(imageRy)

# to install GitHub packages
library(devtools)
# or library((remotes)
devtools::install_github("ducciorocchini/imageRy")

# importing data
im.list()

# sentinel bands
# https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/bands/

b2 <- im.import("sentinel.dolomites.b2.tif")

cl <- colorRampPalette(c("cyan","chocolate","chartreuse"))(1000)
plot(b2, col=cl)

cl <- colorRampPalette(c("cyan","chocolate","chartreuse"))(100)
plot(b2, col=cl)

cl <- colorRampPalette(c("cyan","chocolate","chartreuse"))(3)
plot(b2, col=cl)

# multiframe
par(mfrow=c(1,3))

cl <- colorRampPalette(c("cyan","chocolate","chartreuse"))(1000)
plot(b2, col=cl)

cl <- colorRampPalette(c("cyan","chocolate","chartreuse"))(100)
plot(b2, col=cl)

cl <- colorRampPalette(c("cyan","chocolate","chartreuse"))(3)
plot(b2, col=cl)

# replot b2 with a different color ramp palette
https://sites.stat.columbia.edu/tzheng/files/Rcolor.pdf

dev.off()
cl <- colorRampPalette(c("cyan","chocolate","chartreuse","hotpink","maroon4","slategray4"))(100)
plot(b2, col=cl)

setwd("~/Desktop")
# setwd("C://")
pdf("mygraph.pdf")
cl <- colorRampPalette(c("cyan","chocolate","chartreuse","hotpink","maroon4","slategray4"))(100)
plot(b2, col=cl)
dev.off()

png("mygraph.png")
cl <- colorRampPalette(c("cyan","chocolate","chartreuse","hotpink","maroon4","slategray4"))(100)
plot(b2, col=cl)
dev.off()


