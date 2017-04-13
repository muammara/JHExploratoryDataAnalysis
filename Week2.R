#       3-1, 3-2
#        Lattice Package
# You have to create everything ahead of time
#xyplot(), bwplot(), histogram(), stiplot()
#dotplot(), splom(), levelplot(), coutourplot()
#I think it is good when you have a factor variable (pannel) and two other variables
# to plot.. For example a panel per month with Ozone and Wine each
library(lattice)
library(grid)
library(datasets)
xyplot(Ozone~Wind,data=airquality)
transform(airquality,Month=factor(Month))
xyplot(Ozone~Wind | Month, data=airquality)
xyplot(Ozone~Wind | Month, data=airquality,layout=c(5,1))
# There is an object that can be returned and saved if needed
# Month is a factor that split the graphs to pannels
p<-xyplot(Ozone~Wind | Month, data=airquality,layout=c(1,5))
print(p)
str(p); class(p)
# Now how to customize pannel  
f<-rep(1:0,each=50)
f<-factor(f,labels=c("Group1","Group2"))
x=rnorm(100);y=rnorm(100,nmean=2,sd=1)
xyplot(x~y|f)
xyplot(x~y|f, panel=function(x,y,...){
        panel.xyplot(x,y,...)
        panel.abline(h=median(x),lty=2)
        panel.lmline(x,y,col=2)
        
})









