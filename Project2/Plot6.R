library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
Baltimore<-subset(NEI,fips=="24510")
Baltimore<-transform(Baltimore, type=as.factor(type))
LA<-subset(NEI,fips=="06037")
LA<-transform(LA, type=as.factor(type))
Motor<-as.character(SCC[grep("^Onroad",SCC$Data.Category),][,1])  # The SCC code for the Motor related pm25
bMotor <- Baltimore[Baltimore$SCC %in% Motor,]
lMotor<- LA[LA$SCC %in% Motor,]
both<-bMotor
both<-rbind(both,lMotor)
both<-transform(both, fips=as.factor(fips))
both$fips<-factor(both$fips,labels= c("Los Angeles","Baltimore"))
png("plot6.png",width=960,height=480)
ggplot(both,aes(x=as.factor(year),y=Emissions,fill=fips))+ stat_summary(fun.y=mean,geom="bar") +facet_wrap(~fips) +labs(title="LA vs Baltimore Motor PM2.5 Emissions 1999-2008") +xlab(label="Years")
dev.off()
