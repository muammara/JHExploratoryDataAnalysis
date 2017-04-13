
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
YEAR<-unique(NEI$year)
PM25<-with(NEI,tapply(Emissions, year,sum))
png("plot1.png",width=480,height=480)
par(mfrow=c(1,1))
plot(as.factor(YEAR),PM25, pch=20,cex=4,col="green", ylab="PM2.5",xlab="Year", main="Mean PM2.5",type="p")        
dev.off()
