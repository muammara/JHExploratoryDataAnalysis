library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
Coal<-SCC[grep("Coal",SCC$SCC.Level.Three),]
g<-NEI[NEI$SCC %in% Coal$SCC,]
png("plot4.png",width=480,height=480)
ggplot(g,aes(x=as.factor(year),y=Emissions))+stat_summary(fun.y=mean,geom="bar")+xlab(label="Years")
dev.off()
