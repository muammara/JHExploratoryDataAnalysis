pm0 <-read.table("e:/DS/EXP/pm25_data/RD_501_88101_1999-0.txt",sep="|",comment.char="#",header=FALSE,na.strings="")
dim(pm0)
head(pm0)
f99<-"e:/DS/EXP/pm25_data/RD_501_88101_1999-0.txt"
f12<-"e:/DS/EXP/pm25_data/RD_501_88101_2012-0.txt"
cnames<-readLines(f99,1)
cnames
cnames<-strsplit(cnames,"|",fixed=TRUE)
cnames
names(pm0)<-cnames[[1]] # character vector cnames[1] is list, and also c
head(pm0)
names(pm0)<-make.names(names(pm0))
head(pm0)
x0<-pm0$Sample.Value
class(x0)
str(x0)
summary(x0)
mean(is.na(x0)) #logical Vectors give you T over Total
pm1<-read.table(f12,sep="|",comment.char="#")
head(pm1)
cnames<-strsplit(readLines(f12,1),"|",fixed=TRUE)
cnames
names(pm1)<-cnames[[1]]
names(pm1)
names(pm1)<-make.names(names(pm1))
names(pm1)
x1<-pm1$Sample.Value
summary(x1)
class(x1)
str(x1)
dim(pm1)
mean(is.na(x1))
summary(x0);summary(x1)
boxplot(x0,x1)
sum(x1 > 900,na.rm=TRUE)




