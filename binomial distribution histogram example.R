
bindat<-rbinom(10000,50,.9)
binseq<-seq(20,60,1)
#plot
hist(bindat,breaks=binseq,xlab="N successes")
#Check with theorectical curve
lines(binseq,1e+4*dbinom(binseq,50,0.9),col="green")
