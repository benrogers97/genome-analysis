library(ggplot2)
SNPs<- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
str(SNPs)
class(SNPs)
typeof(SNPs)
str(SNPs$chromosome)

#Exercise 1: Using ggplot make a make a bar graph of the total SNP counts for each chromosome.
ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome))

#Exercise 2: Order the chromosomes according to number by converting chromosomes from a factor to a order factor as in the example above. Then replot the bar graph

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome))

#Exercise 3: Show the contribution of each genotype to the chromosome count using a stacked bar graph (with the fill = genotype)

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome, fill=SNPs$genotype))

#Exercise 4: Make each set of stacked bars the same height to easier to compare proportions across groups.

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome, fill=SNPs$genotype), position = "fill")

#Exercise 5: Now place genotypes directly beside one another for each chromosome to compare individual values.
SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome, fill=SNPs$genotype), position = "dodge")

#Exercise 6: The above graph is pretty hard to read. Try using facet_wrap with the genotype

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))

ggplot(data = SNPs) +
  geom_bar(mapping = aes(x=SNPs$chromosome, fill=SNPs$genotype), position = "dodge") + 
  facet_wrap(~chromosome)






                         