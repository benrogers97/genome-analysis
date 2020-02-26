#Basic Data Objects

#Vectors: ordered collections of the same data type 
SNPs <- c("AA","AA","GG","AG","AG","AA","AG","AA","AA","AA","AG")
SNPs

#Factors: a vector whose elements can take on one of a specific set of values eg. M or F
SNPs_cat<- factor(SNPs)
SNPs_cat

#Tables: we can use the TABLE function to make a table of the factors
table(SNPs_cat)
plot(SNPs_cat)

as.numeric(SNPs_cat)

#matrices: two dimensional structures with data of the same type 
Day1 <- c(2,4,6,8)
Day2 <- c(3,6,9,12)
Day3 <- c(1,4,9,16)
A <- cbind(Day1, Day2, Day3)
A
B <- rbind(Day1, Day2, Day3)
B
#to add a row you can use rbind or cbind with the vector representing the row and the matrix
Day4 <- c(5,10,11,20)
C <- rbind(B, Day4)
C
#can do operations on the matrix;
A*10
#extracting submatrix consisting of the first and third column
A[ ,c(1,3)]
#now the second and fourth rows
A[c(2,4), ]
#a matrix can be transposed using the function t 
t(A)
#Data frames: two dimensional structures with different data types. The data,frame() function can combine vectors and factors into a single frame

Gene1 <- c(2,4,6,8)
Gene2 <- c(3,6,9,12)
Gene3 <- c(1,4,9,16)
Gene <- c("Day 1", "Day 2", "Day 3", "Day 4")
RNAseq <- data.frame(Gene1, Gene2, Gene3, row.names = Gene)

RNAseq$Gene3
plot(RNAseq$Gene1, RNAseq$Gene3)

#adding columns to dataframe
RNAseq$Gene4 <- c(5,10,15,20)
RNAseq
#or...
RNAseq[, "Gene5"] <- c(1,2,3,3)
#to add a row use rbind 
RNAseq["Day 4",] <- rbind(10,14,20,22,3)

#checking on object types
x=1
str(x)
a="ATGCCCTGA"
str(a)
str(B)
str(RNAseq)

#IMPORTING DATA

#read.table(): used to load CSV files into R by reading a file in table format and creating a dataframe from it
read.table("file.csv", header=TRUE, sep=",")
read.table("file.txt", header=TRUE, sep="/t")

SNP_table <- read.table("23andMe_example_cat25.txt", header = TRUE, sep = "\t")
SNP_table

names(SNP_table)
str(SNP_table)
levels(SNP_table$genotype)
dim(SNP_table)
class(SNP_table)
SNP_table
head(SNP_table, n=10)
tail(SNP_table, n=5)
help(read.table)
SNP_table$chromosome <- as.factor(SNP_table$chromosome)
str(SNP_table) 


SNP_table$chromosome <- as.integer(SNP_table$chromosome)
str(SNP_table)

#Exercises 

#Exercise 1: add, subtract, muliply and divide the  following two vectors (1,3,6,9,12) and (1,0,1,0,1)


x <- c(1,3,6,9,12)
y <- c(1,0,1,0,1)

x+y
x-y
x*y
x/y

#Exercise 2 Create 3 different vectors from (0,1,2,3), ("aa","bb","cc","dd") and ("aa",1,"bb",2). Use str() to determine what data types each vector holds.

exercise2v1 <- c(0,1,2,3)
exercise2v2 <- c("aa","bb","cc","dd")
exercise2v3 <- c("aa",1,"bb",2)
str(exercise2v1)
str(exercise2v2)
str(exercise2v3)

#exercise 3: Create a matrix of the data: genotype 1 ("AA", "AA", "AG", "GG", "GG"), genotype 2 ("AA", "AA", "GG", "GG", "GG"). Display the matrix. Use the table function (as in the above examples) to show the total number of each genotype.
genotype1 <- c("AA","AA","AG","GG","GG")
genotype2 <- c("AA","AA","GG","GG","GG")

C <- cbind(genotype1, genotype2)
C
table(C)

#Exercise 4:Create a dataframe of the following experiment in samples were collected every 2 minutes starting at t = 0. treatment 1 (0,1,2,3,4), treatment 2 (0,2,4,6,8), treatment 3 (0,3,6,9,12). Display the dataframe. Plot treatment 3 vs. time (you will need to load time as a column rather than a row name)

treatment1 <- c(0,1,2,3,4)
treatment2 <- c(0,2,4,6,8)
treatment3 <- c(0,3,6,9,12)
time1 <- c(0,2,4,6,8)
D <- cbind(treatment1, treatment2, treatment3)
D
E <- cbind(treatment3, time1)
plot(E)

#Exercise 5: Following the example above with the truncated file use read.table to import the full SNP file 23andME_complete.txt. (This is a large file and may take several minutes to load into R) What object type is chromosome? Why is it different from the above SNP_table example with the truncated file?23
lol <- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
str(lol)
#the chromosome is a factor with 25 levels, it is different than the truncated file because it contains a lot more data

#Exercise 6:Make a table with the total number of each genotype. There may be unsual genotypes. 23andMe reports a very small number of deletions and insertions coded as D DD DI I II. The double dash - represents an uncertain (not reported) call at this position.

table(lol$genotype)

#Exercise 7: Determine which chromosome(s) the single letter genotype A is found on (e.g which chromosomes have only one copy of DNA)? Hint: Use subset() to make a table with just the genotype A.

lol_A <- subset(lol, genotype =='A')
lol_A
table(lol_A$chromosome)

