pairing.lab<-function(sorted.data,r,f)
{
  sorted<-sorted.data
  sort<-sorted
i<-1
paired<-list()
x<-matrix(nrow = 6)
while( nrow(sort[[r]])>=3&nrow(x)==6)
{
  x<-sort[[r]][i,]
  a<-which.max(sort[[r]]$site!=sort[[r]]$site[i])
  x<-rbind.data.frame(x,sort[[r]][a,])
  b<-which.max(sort[[r]]$site!=sort[[r]]$site[i]&
                 sort[[r]]$site!=sort[[r]]$site[a])
  x<-rbind.data.frame(x,sort[[r]][b,])
  c<-which.max(sort[[f]]$site!=sort[[r]]$site[i]&
                 sort[[f]]$site!=sort[[r]]$site[a]
               &sort[[f]]$site!=sort[[r]]$site[b])
  x<-rbind.data.frame(x,sort[[f]][c,])
  
  d<-which.max(sort[[f]]$site!=sort[[r]]$site[i]
               &sort[[f]]$site!=sort[[r]]$site[a]
               &sort[[f]]$site!=sort[[r]]$site[b]
               &sort[[f]]$site!=sort[[f]]$site[c])
  x<-rbind.data.frame(x,sort[[f]][d,])
  
  e<-which.max(sort[[f]]$site!=sort[[r]]$site[i]
               &sort[[f]]$site!=sort[[r]]$site[a]
               &sort[[f]]$site!=sort[[r]]$site[b]
               &sort[[f]]$site!=sort[[f]]$site[c]
               &sort[[f]]$site!=sort[[f]]$site[d])
  x<-rbind.data.frame(x,sort[[f]][e,])

    sort[[r]]<-sort[[r]][-c(i,a,b),]
    sort[[f]]<-sort[[f]][-c(c,d,e),]
    paired<-append(paired,list(x))
}
o<-NULL
for(i in 1:length(paired))
{
  if(any(duplicated(paired[[i]]$site),na.rm = TRUE)==TRUE
     |any(is.na(paired[[i]]$site))==TRUE)
  {
    o<-c(o,i)
  }
}
paired<-paired[-o]
return(paired)
}


