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

png("mygraph.png")
par(mfrow=c(2,2))
cl <- colorRampPalette(c("cyan","chocolate","chartreuse","hotpink","maroon4","slategray4"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("chartreuse","firebrick","cyan"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("black","grey","light grey"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("seagreen","seagreen1","seagreen2","seagreen3","seagreen4"))(100)
plot(b2, col=cl)
dev.off()

# Exercise: put all the images in the same column
png("mygraph.png")
par(mfrow=c(4,1))
cl <- colorRampPalette(c("cyan","chocolate","chartreuse","hotpink","maroon4","slategray4"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("chartreuse","firebrick","cyan"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("black","grey","light grey"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("seagreen","seagreen1","seagreen2","seagreen3","seagreen4"))(100)
plot(b2, col=cl)
dev.off()

# Exercise: put all the images in the same column
pdf("mygraph.pdf")
par(mfrow=c(4,1))
cl <- colorRampPalette(c("cyan","chocolate","chartreuse","hotpink","maroon4","slategray4"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("chartreuse","firebrick","cyan"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("black","grey","light grey"))(100)
plot(b2, col=cl)
cl <- colorRampPalette(c("seagreen","seagreen1","seagreen2","seagreen3","seagreen4"))(100)
plot(b2, col=cl)
dev.off()

# Importing the other Sentinel-2 bands
im.list()

# green band - 550nm
dev.off()
b3 <- im.import("sentinel.dolomites.b3.tif")

# red band - 665nm
b4 <- im.import("sentinel.dolomites.b4.tif")

# NIR band - 842nm
b8 <- im.import("sentinel.dolomites.b8.tif")

# stack
sent <- c(b2, b3, b4, b8)
plot(sent)

pairs(sent)

cl <- colorRampPalette(c("black","grey","light grey"))(100)
plot(sent, col=cl)

# Plotting the whole image in colors
# stack
# 1 = blue band (b2)
# 2 = green band (b3)
# 3 = red band (b4)
# 4 = NIR band (b8)

par(mfrow=c(1,2))
im.plotRGB(sent, r=3, g=2, b=1, title="Natural color image") # natural color image
im.plotRGB(sent, r=4, g=3, b=2, title="False color image") # natural color image

par(mfrow=c(2,2))
im.plotRGB(sent, r=4, g=3, b=2, title="False color image") # natural color image
im.plotRGB(sent, r=4, g=3, b=1, title="False color image") # natural color image
im.plotRGB(sent, r=4, g=2, b=1, title="False color image") # natural color image
im.plotRGB(sent, r=4, g=1, b=2, title="False color image") # natural color image

dev.off()

# NIR ontop of the green component
im.plotRGB(sent, r=4, g=3, b=2, title="False color image") # natural color image
im.plotRGB(sent, r=3, g=4, b=2, title="False color image") # natural color image
im.plotRGB(sent, r=3, g=2, b=4, title="False color image") # natural color image

# Example of band combination with other sets
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")

# 1 = NIR
# 2 = red
# 3 = green

im.plotRGB(mato, r=1, g=2, b=3, title="False color image")
im.plotRGB(mato, r=2, g=1, b=3, title="False color image")
im.plotRGB(mato, r=2, g=2, b=1, title="False color image")
