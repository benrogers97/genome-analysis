library(ggplot2)
bp <- ggplot(PlantGrowth, aes(x=group, y=weight)) + geom_boxplot()
bp

bp + ggtitle("Plant growth")
## Equivalent to
# bp + labs(title="Plant growth")

# If the title is long, it can be split into multiple lines with \n
bp + ggtitle("Plant growth with\ndifferent treatments")

# Reduce line spacing and use bold text
bp + ggtitle("Plant growth with\ndifferent treatments") + 
  theme(plot.title = element_text(lineheight=.8, face="bold"))



#Exercise 1: Add title and labels for the x and y axis to Lab3 ex1. Color the bars blue


library(ggplot2)
SNPs<- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome), fill="blue") + 
  ggtitle("SNP Counts for Each Chromosome") + 
  scale_x_discrete(name="Chromosome Number") +
  scale_y_continuous(name="SNP Count")

#Exercise 2: To Lab3 ex3 add more defined x and y axis labels, add a title, Change the colors of the genotypes, so that the dinucleotides (e.g. AA) are one color, the mononucleotides (A) are another and D's and I's a third color. One way to do this is to specify the color of each genotype.
 
SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))
genotypecolors <-c("AA"="blue", "AC"="blue", "AG"="blue", "AT"="blue", "CC"="blue", "CG"="blue", "CT"="blue", "GG"="blue", "GT"="blue", "TT"="blue", "A"="red", "C"="red", "G"="red", "T"="red", "D"="green", "DD"="green", "DI"="green", "DI"="green","I"="green", "II"="green")


ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome, fill=SNPs$genotype)) + 
  ggtitle("Contribution of each Genotype to Total SNP Count") +
  scale_x_discrete(name="Chromosome Number") +
  scale_y_continuous(name="SNP Count") +
  scale_fill_manual(values=genotypecolors)



#Exercise 3: From Lab3 ex5, make an output png file, then load the file into report using the RMarkdown or html format.

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome, fill=SNPs$genotype), position = "dodge")

#Exercise 4: For Lab3 ex6 add more defined x and y axis labels, add a title, make the x-axis for each graph readable in your final report file.

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x= chromosome, fill= genotype), position = "dodge") + 
  facet_wrap(~genotype, nrow = 3) +
  scale_x_discrete(name= "chromosome number") +
  scale_y_continuous(name= "Number of SNPs") +
  ggtitle("Genotype Levels in Each Chromosome")




  



