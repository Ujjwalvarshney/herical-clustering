library("readxl")
getwd()
setwd("C:/Users/ujjwa/Downloads")
input=read_excel("University_Clustering.xlsx",1)
library("dplyr")
View(input)
mydata=input[1:25,c(1,3:8)]
View(mydata)
glimpse(mydata)
normalise_data=scale(mydata[,2:7])#[scalling is neccesary  because every unit is diffrent ]
View(normalise_data)
d=dist(normalise_data,method = "euclidean")
fit<-hclust(d,method="complete")
group=cutree(fit,k=5)
plot(fit,hang=-1)
group
rect.hclust(fit,k=5,border="red")
membership=as.matrix(group)
final=data.frame(mydata,membership)
View(final)
final1=final[,c(ncol(final),1:(ncol(final)-1))]

