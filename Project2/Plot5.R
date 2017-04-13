library(ggplot2)
NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
Baltimore<-subset(NEI,fips=="24510")
Baltimore<-transform(Baltimore, type=as.factor(type))
Motor<-as.character(SCC[grep("^Onroad",SCC$Data.Category),][,1])  # The SCC code for the Motor related pm25
bMotor <- Baltimore[Baltimore$SCC %in% Motor,]
png("plot5.png",width=480,height=480)
ggplot(bMotor,aes(x=as.factor(year),y=Emissions))+stat_summary(fun.y=mean,geom="bar")+xlab(label="Years")+labs(title = "Baltimore Motor Vehichle Emissions")
dev.off()
