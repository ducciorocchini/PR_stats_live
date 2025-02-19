# Using ggplot2 to show change in time

Once a dataframe has been built with thwe following code:

``` r
library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

# build the table
# columns:
cover <- c("forest","human")
perc1992 <- c(83,17)
perc2006 <- c(45,55)
finalt <- data.frame(cover, perc1992, perc2006)
```

We can build graphs with ggplot2 using both histograms and images:

``` r
p1 <- ggplot(finalt, aes(x=cover, y=perc1992, color=cover)) +
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p2 <- ggplot(finalt, aes(x=cover, y=perc2006, color=cover)) +
  geom_bar(stat="identity", fill="white") +
  ylim(c(0,100))

p1 + p2

p1 / p2

(p1 | p2 | p1) /
      p2

# ggplot2
im.list()

mato <- im.import("matogrosso_ast_2006209_lrg.jpg")
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

p3 <- im.ggplot(mato, 1)
p4 <- im.ggplot(mato1992, 1)

(p1 | p2 | p1) /
      p3

(p4 | p1) /
(p3 | p2)
```

> Notice that the satellite images can be plotted with the imageRy package thanks to the im.ggplot() function.

The resulting output will be something like:

<img width="1440" alt="Screenshot 2025-02-19 at 11 23 42" src="https://github.com/user-attachments/assets/c992d98b-a2f3-44de-bf8e-560c327ffc0f" />


