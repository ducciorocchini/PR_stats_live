# Calculating spectral indices from satellite images

library(terra)
library(imageRy)
library(viridis)

im.list()

mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# 1 = NIR
# 2 = red
# 3 = green

par(mfrow=c(1,2))
im.plotRGB(mato1992, r=1, g=2, b=3, title='NIR on red component')
im.plotRGB(mato2006, r=1, g=2, b=3, title='NIR on red component')

# Exercise: plot 6 images
# first row: 1992 and 2006 NIR in the red component
# second row: 1992 and 2006 NIR in the green component
# third row: 1992 and 2006 NIR in the blue component

par(mfrow=c(3,2))
im.plotRGB(mato1992, r=1, g=2, b=3, title='NIR on red component')
im.plotRGB(mato2006, r=1, g=2, b=3, title='NIR on red component')
im.plotRGB(mato1992, r=2, g=1, b=3, title='NIR on green component')
im.plotRGB(mato2006, r=2, g=1, b=3, title='NIR on green component')
im.plotRGB(mato1992, r=3, g=2, b=1, title='NIR on blue component')
im.plotRGB(mato2006, r=3, g=2, b=1, title='NIR on blue component')

par(mfrow=c(1,2))
im.plotRGB(mato1992, r=3, g=2, b=1, title='NIR on blue component')
im.plotRGB(mato2006, r=3, g=2, b=1, title='NIR on blue component')

# spectral indices
dvi1992 = mato1992[[1]] - mato1992[[2]]
# or
dvi1992 = mato$matogrosso~2219_lrg_1 - mato1992$matogrosso~2219_lrg_2
dvi1992 <- im.dvi(mato1992, 1, 2)

dev.off()
plot(dvi1992)

dvi2006 <- im.dvi(mato2006, 1, 2)

par(mfrow=c(1,2))
plot(dvi1992)
plot(dvi2006)

# using the viridis package
par(mfrow=c(1,2))
plot(dvi1992, col=magma(100))
plot(dvi2006, col=magma(100))

# using the viridis package
par(mfrow=c(1,2))
plot(dvi1992, col=magma(3))
plot(dvi2006, col=magma(3))

# range of images
dev.off()
plot(mato2006[[1]])
# range: 0-255; 256 values -> 8 bit image

# range of DVI for 8 bit images
# NIR - red
# minimum: 0 - 255 = -255
# maximum: 255 - 0 = 255
# DVI will range from -maxrefl to +maxrefl

# range of DVI for 3 bit images
# 0-7, 8 values
# -7 <= DVI <= 7

# 8 bit
# minimum NDVI (0-255)/(0+255) = -1
# maximum NDVI (255-0)/(255+0) = 1

# 3 bit
# minimum NDVI (0-7)/(0+7) = -1
# maximum NDVI (7-0)/(7+0) = 1

# NDVI
ndvi1992 <- im.ndvi(mato1992, 1, 2)
ndvi2006 <- im.ndvi(mato2006, 1, 2)
par(mfrow=c(1,2))
plot(ndvi1992, col=mako(100))
plot(ndvi2006, col=mako(100))

par(mfrow=c(2,2))
plot(dvi1992, col=mako(100))
plot(dvi2006, col=mako(100))
plot(ndvi1992, col=mako(100))
plot(ndvi2006, col=mako(100))







