sorting.data<-function(data.filtered)
{
sorted<-list()
for(i in levels(filter$geno))
{
  for(j in levels(filter$sex))
  {
    q<-list(filter[filter$geno==i & filter$sex == j,])
    if(nrow(q[[1]])>0)
    {
      sorted<-append(sorted,q)
      names(sorted)[length(sorted)] <- paste(i,j)
    }
  }
}
for(i in 1:length(sorted))
{
 sorted[[i]]<-sorted[[i]][order(sorted[[i]]$width),]
}
return(sorted)
}