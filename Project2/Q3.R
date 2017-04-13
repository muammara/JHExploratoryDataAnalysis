
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("summarySCC_PM25.rds")
NEI<-transform(NEI, type=as.factor(type))
YY<-unique(NEI$year)
PM25<-numeric(0)

for (i in YY){
        PM25<-c(PM25,sum(subset(NEI,year==i & fips=="24510")[4]))
        
}


#plot(YY,PM25, pch=20,cex=4,col="green", ylab="PM2.5",xlab="Year", main="Total PM2.5")        
png("Proj2Q2.png",width=480,height=480)
plot(YY,PM25, pch=20,cex=4,col="green", ylab="PM2.5",xlab="Year", main="Total PM2.5 in Baltimore City")        
dev.off()