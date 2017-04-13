# #######################
#   Lecture 2-3         #                
########################
boxplot(x,y)
polution<-read.csv(file="e:/ds/EXP//avgpm25.csv",colClasses=c("numeric","character","factor","numeric","numeric"))
head (polution)
summary(polution$pm25)
#Diff plots
boxplot(polution$pm25,col="blue")
hist(polution$pm25,col="green")
rug(polution$pm25)
#breaks
hist(polution$pm25,col="green",breaks=100)
#Overlay
boxplot(polution$pm25,col="blue")
abline(h=12) # Drawing a line in the boxplot
#Overlay Chart
hist(polution$pm25,col="green")
abline(v=12,lwd=2)
abline(v=median(polution$pm25),lwd=3,col='magenta')
#barplot
barplot(table(polution$region),col="wheat",main="Number Of Countries in Each Region")
# #######################
#   Lecture 2-4         #                
########################
boxplot(pm25~region,data=polution,col="red")  # Two Dimensional plots
par(mfrow=c(2,1),mar=c(4,4,2,1))
hist(subset(polution,region=="east")$pm25,col="green")
hist(subset(polution,region=="west")$pm25,col="green")
with(polution,plot(latitude,pm25))
abline(h=12,lwd=2,lty=2)
with(polution,plot(latitude,pm25,col=region))
# Two charts
par(mfrow=c(1,2),mar=c(5,4,2,1))
with(subset(polution, region=="west"), plot(latitude,pm25,main="West", col=region))
with(subset(polution, region=="east"), plot(latitude,pm25,main="East", col=region))
# #######################
#   Lecture 2-5         #                
########################
#Base plotting system, you draw and add things one by one
#You add a box, col, points, lines, etc..
#plot function then annotate the plot
# the issue is that you can't go back, you also have to control everything if you dont like the default value
library(datasets)
data(cars)        
with(cars, plot(speed, dist))
#lattice system is in the lattice system
#Every plot is constructed by one function, i.e, xyplot , bwplot
#Constructed all at once. Most of the preperation is done automatically for you
#You cant add after plotting
library(lattice)
#ggplot2
#in between, you can add as base system, and automatically calculate preperation
library(ggplot2)
data(mpg)
qplot(displ,hwy,data=mpg)
# #######################
#   Lecture 2-6,7      #                
########################
# Base plotting is the most common used plotting system
?par()
library(datasets)
with(airquality,plot(Wind,Month))
#pch,lty,lwd,col,xlab,ylab
#par() bg,las,mfrow,mfcol,mar,bg,laspat
par("mar") #gets the default values.
lines(),points(), title(), text(), axis(), mtext() # Adds to the plot
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month!==5),points(Wind,Ozone,col="red"))
legend("topright",pch=1,col=c("blue","red"), legend=c("May", "Other Months"))
model <-lm(Ozone~Wind, airquality)
abline(model)
par(mfrow=c(1,3),bg="white",mar=c(4,4,2,2),oma=c(0,0,2,0))  #Outer margin for main title
with(airquality,{
        plot(Wind,Ozone,main="Ozone vs Wind")
        plot(Solar.R,Ozone, main="Ozone and Solar")
        plot(Temp, Ozone, main="Ozone and Temperature")
        mtext("Ozone and Weather in NY city", outer=TRUE)
        
})

#######################################
# Lecture 2-8
#######################################
example(points)
?gl()
plot(x,y,type="n")
x=rnorm(100)
y=rnorm(100)+x
g<-gl(2,50,labels=c("Male","Female"))
points(x[g == "Male"],y[g=="Male"],pch=20,col="green")
points(x[g == "Female"],y[g=="Female"],pch=19,col="blue")
library(help="datasets")













        




