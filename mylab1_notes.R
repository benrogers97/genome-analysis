#basic computation 

#examples
3*3
3+3/3
(3+3)/3
log(10) #natural Logarithm with base e=2.718282
exp(2) 
3^3
sqrt(9)
abs (1-7)

#R data types:

#numerics
x=3.5
x
sqrt(x)

#Integers 
x=3.33
y=as.integer(x)
y

#Logical; a logical value is created by comparison between variables
x=1; y=2
z=x>y

#standard logical operations are "&","|" (or), and "!" (negation)
x=TRUE; y=FALSE
x&y
x|y
!x

#Character: a character object is used to represent string values in R; it is defined by double qoutes ""
x="ATGAAA"
y="TTTTGA"
x
x+y #can't do math on standard strings
#can use special commands on strings:
DNA=paste(x,y)
DNA

#complex values: complex values are represented by the imaginary value i 
x=1+2i
x

#Vectors: a vector is a sequence of data elements of the same basic types; data elements in a vector are reffered to as components. assignment operator (<-) stores the value on the right side of the (<-) expression in the left side. Once assigned, it can be used just as an ordinary component of the computation. the c function groups the components into a vector
x<- c(1,10,100)
x
#now, we can do scalar computations on a vector
x*2
sum(x)
#you can also do vector arithmatic:
x<- c(1,10,100)
y<- c(1,2,3)
x*y
#vectors can also be made out of characters:
codons<- c("AUG","UAU","UGA")
codons

#Simple Graphs

RNA_levels<- c(7,28,100,201,208)
barplot(RNA_levels)


#EXERCISES

#exercise 1:
x=2
y=8
x+y
x-y
x*y
x/y

#exercise 2
x=3.5; y=5
z= (x^5)>(y^4)
z


#exercise 3

x<- c(211,62,108,43,129)
sum(x)
x/sum(x)

#exercise 4

nucleotides<- c("A","T","C","G")
nucleotides
sort(nucleotides)







