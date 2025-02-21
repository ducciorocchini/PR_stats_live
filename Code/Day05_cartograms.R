# Using cartograms to distort maps

library(cartogram)
library(sf)
library(tmap)

data("World")
afr <- World[World$continent == "Africa", ]

# project the map
afr <- st_transform(afr, 3395)
worldn <- st_transform(World, 3395)

# construct cartogram
afr_cont <- cartogram_cont(afr, "pop_est", itermax = 5)
worldn_cont <- cartogram_cont(worldn, "pop_est", itermax = 5)

# plot it
tm_shape(afr_cont) + tm_polygons("pop_est", style = "jenks") +
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))

tm_shape(worldn_cont) + tm_polygons("pop_est", style = "jenks") +  
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))

#------------
# Additional potential analysis of interest out of the course:

# Otherwise: distort on population and color as footprint
tm_shape(worldn_cont) + tm_polygons("footprint", style = "jenks") +  
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))

# Footprint genefal:
worldn_cont <- cartogram_cont(worldn, "footprint", itermax = 5)
tm_shape(worldn_cont) + tm_polygons("footprint", style = "jenks") +  
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))

# Wirth style=pretty with the footprint you will see the two north south parts of the planet 
tm_shape(worldn_cont) + tm_polygons("footprint", style = "pretty") +  
  tm_layout(frame = FALSE, legend.position = c("left", "bottom"))




