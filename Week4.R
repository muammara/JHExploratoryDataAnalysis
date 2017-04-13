# Hierarichal Clustering 4-1, 4-2, 4-3
# Deciding the distance and how to merge points
# Distances Euclidean, correlation, Manhatten
set.seed(1234)
par(mar=c(0,0,0,0))
x<-rnorm(12,mean=rep(1:3,each=4),sd=.2)
y<-rnorm(12,mean=rep(c(1,2,1), each=4),sd=.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+.05,y+.05,lables=as.character(1:12))

dataFrame<-data.frame(x=x,y=y)
distxy<-dist(dataFrame)
hClustering <-hclust(distxy)
plot(hClustering)
myplclust<-function(hclust,lab=hclust$labels,lab.col=rep(1,length(hclust$labels)),hang=0.1,...){
        ##modifictionofplclustforplottinghclustobjects*incolour*!
        ##CopyrightEvaKFChan2009
        ##Arguments:
        ## hclust: hclustobject
        ## lab: acharactervectoroflabelsoftheleavesofthetree
        ## lab.col: colourforthelabels;NA=defaultdeviceforegroundcolour
        ## hang: asinhclust&plclust
        ##Sideeffect:
        ## Adisplayofhierarchicalclusterwithcolouredleaflabels.
        y<-rep(hclust$height,2);x<-as.numeric(hclust$merge)
        y<-y[which(x<0)];x<-x[which(x<0)];x<-abs(x)
        y<-y[order(x)];x<-x[order(x)]
        plot(hclust,labels=FALSE,hang=hang,...)
        text(x=x,y=y[hclust$order]-(max(hclust$height)*hang),
             labels=lab[hclust$order],col=lab.col[hclust$order],
             srt=90,adj=c(1,0.5),xpd=NA,...)
}

dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

# Taking the columns as two points and the rows as the same above
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)
#Kmean example
set.seed(1234)
x<-rnorm(12,mean=rep(1:3, each=4), sd=.2)
y<-rnorm(12,mean=rep(c(1,2,1),each=4),sd=.3)
dataFrame<-data.frame(x=x,y=y)
KM<-kmeans(dataFrame,3)
names(KM)
plot(dataFrame,col=KM$cluster,pch=20,cex=2)
points(KM$centers,col=1:3,pch=3,cex=3)

#Coloring

colors()
pal<-colorRamp(c("red","blue"))  #returning a function 2 or 3 args
pal(0)
pal(1)
pal(.5)
pal(seq(0,1,len=10))
pal<-colorRampPalette(c("red","blue"))  #returning a function 2 or 3 args
pal(2)
pal(12)
# Sequential Pallettes (numbers), Diverging (variance), Qualitative (factors or catgorical)
install.packages("RColorBrewer")
library(RColorBrewer)
cols<-brewer.pal(3,"BuGn")   #Only usueful function and use ?brewer.pal to know 
cols
pal<-colorRampPalette(cols)
image(volcano,col=pal(20))

x<-rnorm(10000, mean=.9,sd=.4)
y<-rnorm(10000)
plot(x,y)
smoothScatter(x,y)
# rgb(r,g,b,alpha)
x<-rnorm(4000);y<-rnorm(4000)
plot(x,y,pch=19,cex=2)
plot(x,y,pch=19,cex=2,col=rgb(0,0,0,.2))  #transparency
        
        







