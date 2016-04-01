#import data 
x <- read.table(file="DNAmet.txt",header=T,sep="\t")　

head(x)
# a b c d e
#1 PYROXD2 HPSE2 LOXL4 ABCC2 KAZALD1
#2 ENTPD7 ENTPD7 HPSE2 SH3PXD2A BTRC
#3 BLOC1S2 SCD ENTPD7 VWA2 FBXW4
#4 FAM178A FGF8 ABCC2 ADARB2 NOLC1
#5 FBXW4 ABLIM1 SCD CHST15 ELOVL3
#6 KCNIP2 ECHDC3 NDUFB8 DOCK1 SH3PXD2A

# making a list matrix by using elements in group a,b,c,d,e. 
#Each group represents a specific gene mutation and each element in each group represents a specific gene expressed in a specific group

 a <- as.matrix(x[,1])
 b <- as.matrix(x[,2][1:1135])
 c <- as.matrix(x[,3][1:4064])
 d <- as.matrix(x[,4][1:761])
 e <- as.matrix(x[,5][1:2450])

# making Venn diagram between a,b,c groups

  data <- list(a,b,c)
  library(gplots) 
  venn(data)

# making Venn diagram with more than 4 elements）
  data2 <- list(a,b,c,d)
  venn(data2)

# extracting gene names in the intersect between group a, b, c

 t1 <- intersect(a,intersect(b,c))
 t1 <- as.matrix(t1)
