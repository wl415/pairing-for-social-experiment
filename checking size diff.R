check<-function(a,percentage = 0.2)
{
  for(k in 1:length(a))
  {
    diff<-(max(a[[k]]$width)-min(a[[k]]$width))
    mean<-mean(a[[k]]$width)
    if(diff>percentage*mean)
    {
      print(k)
      print(a[[k]])
      print(diff)
      print(mean)
    }
  }
}