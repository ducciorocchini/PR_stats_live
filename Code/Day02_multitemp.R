# Code for multitemporal analysis

library(terra)
library(imageRy)
library(ggplot2)

im.list()

EN_01 <- im.import("EN_01.png")
EN_01 <- filp(EN_01)
EN_13 <- im.import("EN_13.png")
