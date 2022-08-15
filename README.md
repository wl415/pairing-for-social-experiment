# pairing-for-social-experiment
includes several files. Datas requires columns "site", "geno", and "sex". "site" is used over "nest" even in lab reared insects as this means one code can sort both lab and wild data. 

sorting.data() takes in filtered data and sort it according to genotype and sex, within each combination, the individuals are sorted by width with ascending order. 

pairing.lab(data.sorted,r,f) paires the rth and fth list in data sorted into nests of six with 3 from each list, without any individuals in a nest sharing the same site. r should be the index of the list with less of row. It returns a list of nests. pairing.wc() does the same, except it does not take into account of the site. with pairing.wc, the nests given should have less variation in width. 

check(paired.data, percentage=0.2) checks whether the range of each nest is less than percentage*mean of the data, it gives range and means of each nests that exceeded the limit

when the list of nests are written into a .csv file, it can be retrived  by using the function paired.data()
