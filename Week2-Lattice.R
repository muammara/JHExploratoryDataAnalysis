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
# ggplot as layers
g<-ggplot(mpg,aes(displ,hwy))   #Specifying the data mapping
summary(g)
print(g) # produce error, does not know lines or points or etc
p<-g+geom_point()
print(p)
p+geom_smooth()
p+geom_smooth(method="lm")
p+geom_smooth()+facet_grid(.~drv)
p+geom_smooth()+facet_grid(fl~drv)
p+geom_smooth()+xlab("X Axis")+ylab("Y Axis") +ggtitle("Title") + labs(title="Test Labs")
p<-g+geom_point()+theme_grey()
p<-g+geom_point()+theme_bw()
# theme(legend.position="none) ???
p
p<-g+geom_point(color="green")+theme_bw()
p
p<-g+geom_point(aes(color=drv))+theme_bw() #Wrapping with aes() for variables
p
p<-g+geom_point(aes(color=drv), size=4)+theme_bw() 
p
p<-g+geom_point(aes(color=drv), size=4,alpha=1/2)+theme_bw()
p
g+geom_point(aes(color=fl))+labs(x="DISPL")+labs(title="hwy vs displ")+facet_grid(.~drv)+geom_smooth(method="lm",size=2,se=FALSE)+theme_bw(base_family="Times")
p
## Limiting the Y-axis
testdata<-data.frame(x=1:100,y=rnorm(100))
testdata[50,2] <-100
with(testdata, plot(x,y,type="l"))
with(testdata, plot(x,y,type="l", ylim=c(-3,3)))
g<-ggplot(testdata,aes(x,y))
g+geom_line()
g+geom_line()+coord_cartesian(ylim=c(-3,3))
# Cut(data, points) return factor that can be used in plots
#quantile() can be used with it 
#facetwrap(x~y,nrow=2,ncol=4) for pannels








