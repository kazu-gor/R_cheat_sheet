
library(rgl, pos=18)
library(nlme, pos=19)
library(mgcv, pos=19)
scatter3d(maxt~meanh+meant, data=kishou, surface=FALSE, residuals=TRUE, 
  bg="white", axis.scales=TRUE, grid=TRUE, ellipsoid=FALSE)

