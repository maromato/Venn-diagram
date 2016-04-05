#import data 
x <- read.table(file="DNAmet.txt",header=T,sep="\t")　

head(x)
# IDH2hyper	WT1hyper	CEBPahyper	TET2Hyper	IDH1Hyper	DNMT3Ahyper
#1 PYROXD2 HPSE2 LOXL4 ABCC2 KAZALD1
#2 ENTPD7 ENTPD7 HPSE2 SH3PXD2A BTRC
#3 BLOC1S2 SCD ENTPD7 VWA2 FBXW4
#4 FAM178A FGF8 ABCC2 ADARB2 NOLC1
#5 FBXW4 ABLIM1 SCD CHST15 ELOVL3
#6 KCNIP2 ECHDC3 NDUFB8 DOCK1 SH3PXD2A

# making a list matrix by using elements in group IDH2hyper, WT1hyper, CEBPahyper, TET2Hyper, IDH1Hyper, DNMT3Ahyper. 
#Each group represents a specific gene mutation and each element in each group represents a specific gene hypermethylated in a specific group

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
 
#extracting gene names in the intersect (a,b) but not in intersect(a,b,c)

 t2 <- intersect(a,b)
 t2 <- as.matrix(t2)
 nrow(t2) #to check if number of the genes in this group is correct
 obj <- !(t2[,1] %in% t1[,1])
 t3 <- t2[obj,]
 t3 <- as.matrix(t3) 
 nrow(t3) #to check if number of the genes in this group is correct
