require(neuralnet)
library(neuralnet)
data <- read.csv('D:/Term 3/Deep Learning/Datasets/dividendinfo.csv', header=TRUE)
attach(data)
str(data)

scaleddata<-scale(data)
normalize<- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
maxmindata<-as.data.frame(lapply(data,normalize))

trainset<- maxmindata[1:150, ]
testset<- maxmindata[151:200, ]

library(neuralnet)
nn <- neuralnet(dividend~fcfps+earnings_growth+de+mcap+current_ratio, data = trainset, hidden=10000, linear.output = FALSE, threshold = 0.01)
nn$result.matrix
plot(nn)

nn$result.matrix

#Single layer = HIdden =3
#Multi layer = Hidden=c(4,2)

#hidden = c(4,2,1)

#feed forward model
#the mathematical propogations are very difficult

