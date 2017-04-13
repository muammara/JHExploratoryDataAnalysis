# 
install.packages("ggplot2")
#qplot() is similar to plot()
# aesthetics (size, shape and color), geoms (points and lines)
# Once again the factor is importatn
library(datasets)
library(ggplot2)
str(mpg)
qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg,col=drv)
qplot(displ,hwy,data=mpg,shape=drv)
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
qplot(displ,hwy,data=mpg,col=drv,geom=c("point","smooth"))
qplot(displ,hwy,data=mpg,geom=c("smooth"))
qplot(displ,hwy,data=mpg,geom=c("smooth"),method="lm")

#One variable will plot histogram
qplot(hwy,data=mpg)
qplot(hwy,data=mpg,fill=drv)
qplot(hwy,data=mpg,geom="density")
qplot(hwy,data=mpg,geom="density",color=fl)
#facests
qplot(displ,hwy,data=mpg,facets= . ~ drv) # two variables separated by ~
qplot(displ,hwy,data=mpg,facets=  drv ~ .) # two variables separated by ~
qplot(hwy,data=mpg, facets=.~drv)
