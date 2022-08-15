pairing.wc<-function(data.sorted,r,f)
{
  sorted<-data.sorted
  sort<-data.sorted
i<-1
paired<-list()
while(i < nrow(sort[[r]]))
{
  if(i+2<=nrow(sort[[r]]))
  {
    qq<-sort[[r]][i:(i+2),]
    z<-mean(qq$width)
    a<-abs(sort[[f]]$width-z)
    xx<-data.frame()
    for(j in 1:3)
    {
      w<-which.min(a)
      xx<-rbind.data.frame(xx,sort[[f]][w,])
      a<-a[-w]
      sort[[f]]<-sort[[f]][-w,]
    }
    q<-list(rbind.data.frame(qq,xx))
    paired<-append(paired,q)
  }
  i<-i+3
}
return(paired)
}
