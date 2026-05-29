#load libraries
library(ggplot2)
library(ggforce)
library(ggstats)
library(cowplot)
library(lemon)
library(patchwork)
library(rstatix)
library(tidyr)
library(dplyr)
#set working directory

setwd("")


#####
#####
#####Concatenating all C. inopinata maps by chromosome and estimating C. inopinata genotype frequencies
#####
#####
#LepMap3 output files ("edit" only means I added an R-compatible header); these are in the "data" folder on github.


chr1map <- read.table("Sp34_Chr1.REC.MAP.SHORT_edit.txt",header=TRUE,sep="\t") 
chr1positions <- read.table("Sp34_Chr1.POSITIONS_edit.txt",header=TRUE,sep="\t") 
chr1positions$marker_number <- as.integer(rownames(chr1positionfs))

chr1merge <- merge(chr1positions,chr1map)

chr2map <- read.table("Sp34_Chr2.REC.MAP.SHORT_edit.txt",header=TRUE,sep="\t") 
chr2positions <- read.table("Sp34_Chr2.POSITIONS_edit.txt",header=TRUE,sep="\t") 
chr2positions$marker_number <- as.integer(rownames(chr2positions))

chr2merge <- merge(chr2positions,chr2map)

chr3map <- read.table("Sp34_Chr3.REC.MAP.SHORT_edit.txt",header=TRUE,sep="\t") 
chr3positions <- read.table("Sp34_Chr3.POSITIONS_edit.txt",header=TRUE,sep="\t") 
chr3positions$marker_number <- as.integer(rownames(chr3positions))

chr3merge <- merge(chr3positions,chr3map)

chr4map <- read.table("Sp34_Chr4.REC.MAP.SHORT_edit.txt",header=TRUE,sep="\t") 
chr4positions <- read.table("Sp34_Chr4.POSITIONS_edit.txt",header=TRUE,sep="\t") 
chr4positions$marker_number <- as.integer(rownames(chr4positions))

chr4merge <- merge(chr4positions,chr4map)

chr5map <- read.table("Sp34_Chr5.REC.MAP.SHORT_edit.txt",header=TRUE,sep="\t") 
chr5positions <- read.table("Sp34_Chr5.POSITIONS_edit.txt",header=TRUE,sep="\t") 
chr5positions$marker_number <- as.integer(rownames(chr5positions))

chr5merge <- merge(chr5positions,chr5map)

chrXmap <- read.table("Sp34_ChrX.REC.MAP.SHORT_edit.txt",header=TRUE,sep="\t") 
chrXpositions <- read.table("Sp34_ChrX.POSITIONS_edit.txt",header=TRUE,sep="\t") 
chrXpositions$marker_number <- as.integer(rownames(chrXpositions))

chrXmerge <- merge(chrXpositions,chrXmap)

all_chr <- rbind(chr1merge,chr2merge,chr3merge,chr4merge,chr5merge,chrXmerge)

all_chr$CHR <- as.factor(all_chr$CHR)


all_chr$MB <- all_chr$POS/1000000

#look at some things
ggplot(all_chr,aes(x=MB,y=female_position)) + geom_point(alpha=0.5)  + facet_rep_wrap(~CHR) + theme_cowplot() + ylab("cM")

ggplot(all_chr,aes(x=MB,y=female_position)) + geom_point() + geom_smooth() + facet_rep_wrap(~CHR) + theme_cowplot() + ylab("cM")

ggplot(all_chr,aes(x=MB,y=female_position)) + geom_step() + facet_rep_wrap(~CHR) + theme_cowplot() + ylab("cM")


#define a function to estimate allele frequencies
AFfunction <- function(x){
	chr1geno <- x
	for (i in 1:nrow(chr1geno)){
		rownum <- i
	
		marker_num <- chr1geno[rownum,1]
	
		#parents fam 1
		
		parents_fam_1 <- chr1geno[rownum,c(5:6)]
		
		#parents fam 2
		
		parents_fam_2 <- chr1geno[rownum,c(93:94)]
		
		#recomb fam 1
		
		recomb_fam_1 <- chr1geno[rownum,c(7:92)]
		
		
		#recomb fam 2
		
		recomb_fam_2 <- chr1geno[rownum,c(95:184)]
		
		
		#transform and count
		
		recomb_fam_1_geno_count <- table(as.data.frame(t(recomb_fam_1)))
		
		recomb_fam_2_geno_count <- table(as.data.frame(t(recomb_fam_2)))
		
		recomb_fam_1_Hom1_count <- recomb_fam_1_geno_count[1]
		recomb_fam_1_Het_count <- recomb_fam_1_geno_count[2]+recomb_fam_1_geno_count[3]
		recomb_fam_1_Hom2_count <- recomb_fam_1_geno_count[4]
		
		
		recomb_fam_2_Hom1_count <- recomb_fam_2_geno_count[1]
		recomb_fam_2_Het_count <- recomb_fam_2_geno_count[2]+recomb_fam_2_geno_count[3]
		recomb_fam_2_Hom2_count <- recomb_fam_2_geno_count[4]
		
		recomb_fam_1_tot_recomb <- recomb_fam_1_Hom1_count+recomb_fam_1_Het_count+recomb_fam_1_Hom2_count
		
		
		recomb_fam_1_fra_Hom1 <- recomb_fam_1_Hom1_count/recomb_fam_1_tot_recomb
		recomb_fam_1_fra_Het <- recomb_fam_1_Het_count/recomb_fam_1_tot_recomb
		recomb_fam_1_fra_Hom2 <- recomb_fam_1_Hom2_count/recomb_fam_1_tot_recomb
		recomb_fam_1_AF_A1 <- ((2*recomb_fam_1_Hom1_count)+recomb_fam_1_Het_count)/(2*recomb_fam_1_tot_recomb)
		recomb_fam_1_AF_A2 <- ((2*recomb_fam_1_Hom2_count)+recomb_fam_1_Het_count)/(2*recomb_fam_1_tot_recomb)
		
		
		recomb_fam_2_tot_recomb <- recomb_fam_2_Hom1_count+recomb_fam_2_Het_count+recomb_fam_2_Hom2_count
		
		recomb_fam_2_fra_Hom1 <- recomb_fam_2_Hom1_count/recomb_fam_2_tot_recomb
		recomb_fam_2_fra_Het <- recomb_fam_2_Het_count/recomb_fam_2_tot_recomb
		recomb_fam_2_fra_Hom2 <- recomb_fam_2_Hom2_count/recomb_fam_2_tot_recomb
		recomb_fam_2_AF_A1 <- ((2*recomb_fam_2_Hom1_count)+recomb_fam_2_Het_count)/(2*recomb_fam_2_tot_recomb)
		recomb_fam_2_AF_A2 <- ((2*recomb_fam_2_Hom2_count)+recomb_fam_2_Het_count)/(2*recomb_fam_2_tot_recomb)
	
		df_to_bind <- data.frame(marker_number=marker_num,parents_fam_1_1 = parents_fam_1[1],parents_fam_1_2 = parents_fam_1[2],parents_fam_2_1 = parents_fam_2[1],parents_fam_2_2 = parents_fam_2[2],recomb_fam_1_Hom1_count=recomb_fam_1_Hom1_count,recomb_fam_1_Het_count=recomb_fam_1_Het_count,recomb_fam_1_Hom2_count=recomb_fam_1_Hom2_count,recomb_fam_1_tot_recomb=recomb_fam_1_tot_recomb,recomb_fam_1_fra_Hom1=recomb_fam_1_fra_Hom1,recomb_fam_1_fra_Het=recomb_fam_1_fra_Het,recomb_fam_1_fra_Hom2=recomb_fam_1_fra_Hom2,recomb_fam_1_AF_A1=recomb_fam_1_AF_A1,recomb_fam_1_AF_A2=recomb_fam_1_AF_A2,recomb_fam_2_Hom1_count=recomb_fam_2_Hom1_count,recomb_fam_2_Het_count=recomb_fam_2_Het_count,recomb_fam_2_Hom2_count=recomb_fam_2_Hom2_count,recomb_fam_2_tot_recomb=recomb_fam_2_tot_recomb,recomb_fam_2_fra_Hom1=recomb_fam_2_fra_Hom1,recomb_fam_2_fra_Het=recomb_fam_2_fra_Het,recomb_fam_2_fra_Hom2=recomb_fam_2_fra_Hom2,recomb_fam_2_AF_A1=recomb_fam_2_AF_A1,recomb_fam_2_AF_A2=recomb_fam_2_AF_A2)
	
		geno_allele_freq_count_df <- rbind(geno_allele_freq_count_df,df_to_bind)


}

	return (geno_allele_freq_count_df)

}

	#LepMap3 genotype output files
chr1geno <- read.table("Sp34_Chr1_genotypes_edit.txt",sep="\t",header=T)
chr2geno <- read.table("Sp34_Chr2_genotypes_edit.txt",sep="\t",header=T)
chr3geno <- read.table("Sp34_Chr3_genotypes_edit.txt",sep="\t",header=T)
chr4geno <- read.table("Sp34_Chr4_genotypes_edit.txt",sep="\t",header=T)
chr5geno <- read.table("Sp34_Chr5_genotypes_edit.txt",sep="\t",header=T)
chrXgeno <- read.table("Sp34_ChrX_genotypes_edit.txt",sep="\t",header=T)


#estimate allele frequencies per chromosome, merge with genetic map data, and get positions in MB
geno_allele_freq_count_df <- NULL

chr1_geno_allele_freq_count_df <- AFfunction(chr1geno)
chr1merge2 <- merge(chr1merge,chr1_geno_allele_freq_count_df)
chr1merge2$MB <- chr1merge2$POS/1000000

geno_allele_freq_count_df <- NULL

chr2_geno_allele_freq_count_df <- AFfunction(chr2geno)
chr2merge2 <- merge(chr2merge,chr2_geno_allele_freq_count_df)
chr2merge2$MB <- chr2merge2$POS/1000000


geno_allele_freq_count_df <- NULL

chr3_geno_allele_freq_count_df <- AFfunction(chr3geno)
chr3merge2 <- merge(chr3merge,chr3_geno_allele_freq_count_df)
chr3merge2$MB <- chr3merge2$POS/1000000

geno_allele_freq_count_df <- NULL

chr4_geno_allele_freq_count_df <- AFfunction(chr4geno)
chr4merge2 <- merge(chr4merge,chr4_geno_allele_freq_count_df)
chr4merge2$MB <- chr4merge2$POS/1000000

geno_allele_freq_count_df <- NULL

chr5_geno_allele_freq_count_df <- AFfunction(chr5geno)
chr5merge2 <- merge(chr5merge,chr5_geno_allele_freq_count_df)
chr5merge2$MB <- chr5merge2$POS/1000000



geno_allele_freq_count_df <- NULL

chrX_geno_allele_freq_count_df <- AFfunction(chrXgeno)
chrXmerge2 <- merge(chrXmerge,chrX_geno_allele_freq_count_df)
chrXmerge2$MB <- chrXmerge2$POS/1000000


#combine all chr
all_chr_again <- rbind(chr1merge2,chr2merge2,chr3merge2,chr4merge2,chr5merge2,chrXmerge2)


#visualize maps and allele freqs
a <- ggplot(all_chr_again,aes(x=MB,y=female_position)) + geom_point(alpha=0.5)  + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("cM")


b <- ggplot(all_chr_again,aes(x=MB,y=recomb_fam_1_AF_A1)) + geom_hline(yintercept=0.5,linetype="dotted") + geom_point(alpha=0.5)  + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("AF") + ylim(0,1)


a/b




a <- ggplot(all_chr_again,aes(x=MB,y=female_position)) + geom_point(alpha=0.5)  + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("cM")


b <- ggplot(all_chr_again,aes(x=MB,y=recomb_fam_2_AF_A1)) + geom_hline(yintercept=0.5,linetype="dotted") + geom_point(alpha=0.5)  + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("AF") + ylim(0,1)


a/b

#dfs for genotype freqs for the two crosses
geno_count_df_fam1 <- data.frame(CHR=all_chr_again$CHR,MB=all_chr_again$MB,Hom1=all_chr_again$recomb_fam_1_fra_Hom1,Het=all_chr_again$recomb_fam_1_fra_Het,Hom2=all_chr_again$recomb_fam_1_fra_Hom2)


geno_count_df_fam2 <-  data.frame(CHR=all_chr_again$CHR,MB=all_chr_again$MB,Hom1=all_chr_again$recomb_fam_2_fra_Hom1,Het=all_chr_again$recomb_fam_2_fra_Het,Hom2=all_chr_again$recomb_fam_2_fra_Hom2)


geno_count_df_fam1_melt <- reshape2::melt(geno_count_df_fam1,measure.vars=c(3:5))

geno_count_df_fam2_melt <- reshape2::melt(geno_count_df_fam2,measure.vars=c(3:5))

#visualize genotype freq cross one
b <- ggplot(geno_count_df_fam1_melt,aes(x=MB,y=value)) + geom_hline(yintercept=0.5,linetype="dotted") + geom_hline(yintercept=0.25,linetype="dotted") + geom_point(alpha=0.5,aes(colour=variable)) + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("Genotype Fraction") + ylim(0,1)


a/b

#visualize genotype freq cross two
b <- ggplot(geno_count_df_fam2_melt,aes(x=MB,y=value)) + geom_hline(yintercept=0.5,linetype="dotted") + geom_hline(yintercept=0.25,linetype="dotted") + geom_point(alpha=0.5,aes(colour=variable)) + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("Genotype Fraction") + ylim(0,1)


a/b



a <- ggplot(all_chr_again,aes(x=MB,y=female_position)) + geom_point(alpha=0.5) +geom_smooth(se=FALSE)  + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot() + ylab("cM")

#save data
#write.table(all_chr_again,"all_chr_map_af_etc.tsv",sep="\t",row.names=FALSE)
#write.table(all_chr_again,"all_chr_map_af_etc_REPRODUCE.tsv",sep="\t",row.names=FALSE)


#####
#####
#####Now putting marey maps together
#####
#####





	#where is THIS file from? this is the inopinata genetic map
all_chr_again <- read.table("all_chr_map_af_etc.tsv",sep="\t",header=T)
	#again, workflow.R, see above


	#where is THIS file from???
rem_all_chr <- read.table("remanei_map.tsv",sep="\t",header=T)
	#this is from Teterina et al. 2023 Plos Genetics "Genomic diversity landscapes in outcrossing and selfing Caenorhabditis nematodes"
	#Maternal_genetic_map.txt kindly shared by Anastasia Teterina
	#see the following for how it was constructed:
	#https://github.com/phillips-lab/CR_CE_popgen/tree/main/genetic_map

	#where is THIS file from???
ce_map_rockman <- read.csv("rockman_recombinationmaps.csv",header=T)
	#directly downloaded from data associated with Parée et al. 2024 Genetics "rec-1 loss of function increases recombination in the central gene clusters at the expense of autosomal pairing centers"
	#originated from Rockman and Kruglyak 2009 Plos Genetics "Recombinational Landscape and Population Genomics of Caenorhabditis elegans"
	#https://zenodo.org/records/10148729 , file rockman_recombinationmaps.csv

	#where is THIS file from???
cb_map_stevens <- read.table("c_briggsae_genetic_distances.txt",sep="\t",header=T)
	#this is from Stevens et al. 2022 GBE "Chromosome-Level Reference Genomes for Two Strains of Caenorhabditis briggsae: An Improved Platform for Comparative Genomics"
	#slightly modified from from the file https://github.com/AndersenLab/briggsae_reference_genome_MS/blob/main/3_recombinationmap/c_briggsae_genetic_distances.txt

	#where is THIS file from???
trop_map_noble <- read.table("tropicalis_map.tsv",sep="\t",header=T)
	#this is from Noble et al. 2021 eLife "Selfing is the safest sex for Caenorhabditis tropicalis"
	#derived from Supp File 1 NIC58_rqtlCross.rda.zip
	#see recreating_the_noble_et_al_tropicalis_genetic_map_file.R

#make needed edits, ie, chromosome ids
cb_map_stevens_I <- cb_map_stevens[cb_map_stevens$CHR == "I",]
cb_map_stevens_II <-  cb_map_stevens[cb_map_stevens$CHR == "II",]
cb_map_stevens_III <-  cb_map_stevens[cb_map_stevens$CHR == "III",]
cb_map_stevens_IV <-  cb_map_stevens[cb_map_stevens$CHR == "IV",]
cb_map_stevens_V <-  cb_map_stevens[cb_map_stevens$CHR == "V",]
cb_map_stevens_X <-  cb_map_stevens[cb_map_stevens$CHR == "X",]

#okay, yeah, no-- we will start the genetic map at 0!

cb_map_stevens_I$genetic_diff <- cb_map_stevens_I$genetic-388131
cb_map_stevens_II$genetic_diff <- cb_map_stevens_II$genetic-11400.33
cb_map_stevens_III$genetic_diff <- cb_map_stevens_III$genetic-627126
cb_map_stevens_IV$genetic_diff <- cb_map_stevens_IV$genetic-46475.32
cb_map_stevens_V$genetic_diff <- cb_map_stevens_V$genetic-274.5309
cb_map_stevens_X$genetic_diff <- cb_map_stevens_X$genetic-22287.00

#bind briggsae chr
cb_map_stevens_all <- rbind(cb_map_stevens_I,cb_map_stevens_II,cb_map_stevens_III,cb_map_stevens_IV,cb_map_stevens_V,cb_map_stevens_X)

#get physical position in mb
cb_map_stevens_all$MB <- cb_map_stevens_all$pos/1000000

trop_map_noble$MB <- trop_map_noble$pos/1000


#visualize the maps

	
brig <- ggplot(cb_map_stevens_all,aes(x=MB,y=genetic_diff)) + geom_step() + facet_rep_wrap(~CHR,nrow=1)  + theme_cowplot() + theme(axis.text.x=element_blank(),axis.title.x=element_blank())



rema <- ggplot(rem_all_chr,aes(x=MB,y=CM)) + geom_step() + facet_rep_wrap(~chr,nrow=1)  + theme_cowplot() + theme(axis.text.x=element_blank(),axis.title.x=element_blank(),strip.background = element_blank(), strip.text.x = element_blank())


tropi <- ggplot(trop_map_noble,aes(x=MB,y=x)) + geom_step() + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot()  + theme(axis.text.x=element_blank(),axis.title.x=element_blank(),strip.background = element_blank(),strip.text.x = element_blank()) 


eleg <- ggplot(ce_map_rockman,aes(x=cpos,y=genetic)) + geom_step() + facet_rep_wrap(~chrom,nrow=1)  + theme_cowplot() + theme(axis.text.x=element_blank(),axis.title.x=element_blank(),strip.background = element_blank(), strip.text.x = element_blank())


inop <- ggplot(all_chr_again,aes(x=MB,y=female_position)) + geom_step() + facet_rep_wrap(~CHR,nrow=1)  + theme_cowplot() + theme(strip.background = element_blank(), strip.text.x = element_blank())

#visualize maps
brig/rema/tropi/eleg/inop




#normalize by chr gen/phys length

cb_map_stevens_all_I <- cb_map_stevens_all[cb_map_stevens_all$CHR == "I",]
cb_map_stevens_all_II <- cb_map_stevens_all[cb_map_stevens_all$CHR == "II",]
cb_map_stevens_all_III <- cb_map_stevens_all[cb_map_stevens_all$CHR == "III",]
cb_map_stevens_all_IV <- cb_map_stevens_all[cb_map_stevens_all$CHR == "IV",]
cb_map_stevens_all_V <- cb_map_stevens_all[cb_map_stevens_all$CHR == "V",]
cb_map_stevens_all_X <- cb_map_stevens_all[cb_map_stevens_all$CHR == "X",]


cb_map_stevens_all_I$norm_phys <- cb_map_stevens_all_I$MB/max(cb_map_stevens_all_I$MB)
cb_map_stevens_all_I$norm_gen <- cb_map_stevens_all_I$genetic_diff/max(cb_map_stevens_all_I$genetic_diff)

cb_map_stevens_all_II$norm_phys <- cb_map_stevens_all_II$MB/max(cb_map_stevens_all_II$MB)
cb_map_stevens_all_II$norm_gen <- cb_map_stevens_all_II$genetic_diff/max(cb_map_stevens_all_II$genetic_diff)

cb_map_stevens_all_III$norm_phys <- cb_map_stevens_all_III$MB/max(cb_map_stevens_all_III$MB)
cb_map_stevens_all_III$norm_gen <- cb_map_stevens_all_III$genetic_diff/max(cb_map_stevens_all_III$genetic_diff)

cb_map_stevens_all_IV$norm_phys <- cb_map_stevens_all_IV$MB/max(cb_map_stevens_all_IV$MB)
cb_map_stevens_all_IV$norm_gen <- cb_map_stevens_all_IV$genetic_diff/max(cb_map_stevens_all_IV$genetic_diff)

cb_map_stevens_all_V$norm_phys <- cb_map_stevens_all_V$MB/max(cb_map_stevens_all_V$MB)
cb_map_stevens_all_V$norm_gen <- cb_map_stevens_all_V$genetic_diff/max(cb_map_stevens_all_V$genetic_diff)

cb_map_stevens_all_X$norm_phys <- cb_map_stevens_all_X$MB/max(cb_map_stevens_all_X$MB)
cb_map_stevens_all_X$norm_gen <- cb_map_stevens_all_X$genetic_diff/max(cb_map_stevens_all_X$genetic_diff)

#put em back together
allbrig <- rbind(cb_map_stevens_all_I,cb_map_stevens_all_II,cb_map_stevens_all_III,cb_map_stevens_all_IV,cb_map_stevens_all_V,cb_map_stevens_all_X)




rem_all_chr_I <- rem_all_chr[rem_all_chr$CHR == "I",]
rem_all_chr_II <- rem_all_chr[rem_all_chr$CHR == "II",]
rem_all_chr_III <- rem_all_chr[rem_all_chr$CHR == "III",]
rem_all_chr_IV <- rem_all_chr[rem_all_chr$CHR == "IV",]
rem_all_chr_V <- rem_all_chr[rem_all_chr$CHR == "V",]
rem_all_chr_X <- rem_all_chr[rem_all_chr$CHR == "X",]


rem_all_chr_I$norm_phys <- rem_all_chr_I$MB/max(rem_all_chr_I$MB)
rem_all_chr_I$norm_gen <- rem_all_chr_I$CM/max(rem_all_chr_I$CM)

rem_all_chr_II$norm_phys <- rem_all_chr_II$MB/max(rem_all_chr_II$MB)
rem_all_chr_II$norm_gen <- rem_all_chr_II$CM/max(rem_all_chr_II$CM)

rem_all_chr_III$norm_phys <- rem_all_chr_III$MB/max(rem_all_chr_III$MB)
rem_all_chr_III$norm_gen <- rem_all_chr_III$CM/max(rem_all_chr_III$CM)

rem_all_chr_IV$norm_phys <- rem_all_chr_IV$MB/max(rem_all_chr_IV$MB)
rem_all_chr_IV$norm_gen <- rem_all_chr_IV$CM/max(rem_all_chr_IV$CM)

rem_all_chr_V$norm_phys <- rem_all_chr_V$MB/max(rem_all_chr_V$MB)
rem_all_chr_V$norm_gen <- rem_all_chr_V$CM/max(rem_all_chr_V$CM)

rem_all_chr_X$norm_phys <- rem_all_chr_X$MB/max(rem_all_chr_X$MB)
rem_all_chr_X$norm_gen <- rem_all_chr_X$CM/max(rem_all_chr_X$CM)

allrem <- rbind(rem_all_chr_I,rem_all_chr_II,rem_all_chr_III,rem_all_chr_IV,rem_all_chr_V,rem_all_chr_X)



trop_map_noble_I <- trop_map_noble[trop_map_noble$CHR == "I",]
trop_map_noble_II <- trop_map_noble[trop_map_noble$CHR == "II",]
trop_map_noble_III <- trop_map_noble[trop_map_noble$CHR == "III",]
trop_map_noble_IV <- trop_map_noble[trop_map_noble$CHR == "IV",]
trop_map_noble_V <- trop_map_noble[trop_map_noble$CHR == "V",]
trop_map_noble_X <- trop_map_noble[trop_map_noble$CHR == "X",]


trop_map_noble_I$norm_phys <- trop_map_noble_I$MB/max(trop_map_noble_I$MB)
trop_map_noble_I$norm_gen <- trop_map_noble_I$x/max(trop_map_noble_I$x)

trop_map_noble_II$norm_phys <- trop_map_noble_II$MB/max(trop_map_noble_II$MB)
trop_map_noble_II$norm_gen <- trop_map_noble_II$x/max(trop_map_noble_II$x)

trop_map_noble_III$norm_phys <- trop_map_noble_III$MB/max(trop_map_noble_III$MB)
trop_map_noble_III$norm_gen <- trop_map_noble_III$x/max(trop_map_noble_III$x)

trop_map_noble_IV$norm_phys <- trop_map_noble_IV$MB/max(trop_map_noble_IV$MB)
trop_map_noble_IV$norm_gen <- trop_map_noble_IV$x/max(trop_map_noble_IV$x)

trop_map_noble_V$norm_phys <- trop_map_noble_V$MB/max(trop_map_noble_V$MB)
trop_map_noble_V$norm_gen <- trop_map_noble_V$x/max(trop_map_noble_V$x)

trop_map_noble_X$norm_phys <- trop_map_noble_X$MB/max(trop_map_noble_X$MB)
trop_map_noble_X$norm_gen <- trop_map_noble_X$x/max(trop_map_noble_X$x)

alltrop <- rbind(trop_map_noble_I,trop_map_noble_II,trop_map_noble_III,trop_map_noble_IV,trop_map_noble_V,trop_map_noble_X)



ce_map_rockman_I <- ce_map_rockman[ce_map_rockman$chrom == 1,]
ce_map_rockman_II <- ce_map_rockman[ce_map_rockman$chrom == 2,]
ce_map_rockman_III <- ce_map_rockman[ce_map_rockman$chrom == 3,]
ce_map_rockman_IV <- ce_map_rockman[ce_map_rockman$chrom == 4,]
ce_map_rockman_V <- ce_map_rockman[ce_map_rockman$chrom == 5,]
ce_map_rockman_X <- ce_map_rockman[ce_map_rockman$chrom == 6,]


ce_map_rockman_I$norm_phys <- ce_map_rockman_I$cpos/max(ce_map_rockman_I$cpos)
ce_map_rockman_I$norm_gen <- ce_map_rockman_I$genetic/max(ce_map_rockman_I$genetic)

ce_map_rockman_II$norm_phys <- ce_map_rockman_II$cpos/max(ce_map_rockman_II$cpos)
ce_map_rockman_II$norm_gen <- ce_map_rockman_II$genetic/max(ce_map_rockman_II$genetic)

ce_map_rockman_III$norm_phys <- ce_map_rockman_III$cpos/max(ce_map_rockman_III$cpos)
ce_map_rockman_III$norm_gen <- ce_map_rockman_III$genetic/max(ce_map_rockman_III$genetic)

ce_map_rockman_IV$norm_phys <- ce_map_rockman_IV$cpos/max(ce_map_rockman_IV$cpos)
ce_map_rockman_IV$norm_gen <- ce_map_rockman_IV$genetic/max(ce_map_rockman_IV$genetic)

ce_map_rockman_V$norm_phys <- ce_map_rockman_V$cpos/max(ce_map_rockman_V$cpos)
ce_map_rockman_V$norm_gen <- ce_map_rockman_V$genetic/max(ce_map_rockman_V$genetic)

ce_map_rockman_X$norm_phys <- ce_map_rockman_X$cpos/max(ce_map_rockman_X$cpos)
ce_map_rockman_X$norm_gen <- ce_map_rockman_X$genetic/max(ce_map_rockman_X$genetic)

ce_map_rockman_I$CHR <- "I"
ce_map_rockman_II$CHR <- "II"
ce_map_rockman_III$CHR <- "III"
ce_map_rockman_IV$CHR <- "IV"
ce_map_rockman_V$CHR <- "V"
ce_map_rockman_X$CHR <- "X"



alleleg <- rbind(ce_map_rockman_I,ce_map_rockman_II,ce_map_rockman_III,ce_map_rockman_IV,ce_map_rockman_V,ce_map_rockman_X)


all_chr_again_I <- all_chr_again[all_chr_again$CHR == "Sp34_Chr1",]
all_chr_again_II <- all_chr_again[all_chr_again$CHR == "Sp34_Chr2",]
all_chr_again_III <- all_chr_again[all_chr_again$CHR == "Sp34_Chr3",]
all_chr_again_IV <- all_chr_again[all_chr_again$CHR == "Sp34_Chr4",]
all_chr_again_V <- all_chr_again[all_chr_again$CHR == "Sp34_Chr5",]
all_chr_again_X <- all_chr_again[all_chr_again$CHR == "Sp34_ChrX",]


all_chr_again_I$norm_phys <- all_chr_again_I$MB/max(all_chr_again_I$MB)
all_chr_again_I$norm_gen <- all_chr_again_I$female_position/max(all_chr_again_I$female_position)

all_chr_again_II$norm_phys <- all_chr_again_II$MB/max(all_chr_again_II$MB)
all_chr_again_II$norm_gen <- all_chr_again_II$female_position/max(all_chr_again_II$female_position)

all_chr_again_III$norm_phys <- all_chr_again_III$MB/max(all_chr_again_III$MB)
all_chr_again_III$norm_gen <- all_chr_again_III$female_position/max(all_chr_again_III$female_position)

all_chr_again_IV$norm_phys <- all_chr_again_IV$MB/max(all_chr_again_IV$MB)
all_chr_again_IV$norm_gen <- all_chr_again_IV$female_position/max(all_chr_again_IV$female_position)

all_chr_again_V$norm_phys <- all_chr_again_V$MB/max(all_chr_again_V$MB)
all_chr_again_V$norm_gen <- all_chr_again_V$female_position/max(all_chr_again_V$female_position)

all_chr_again_X$norm_phys <- all_chr_again_X$MB/max(all_chr_again_X$MB)
all_chr_again_X$norm_gen <- all_chr_again_X$female_position/max(all_chr_again_X$female_position)

all_chr_again_I$CHR <- "I"
all_chr_again_II$CHR <- "II"
all_chr_again_III$CHR <- "III"
all_chr_again_IV$CHR <- "IV"
all_chr_again_V$CHR <- "V"
all_chr_again_X$CHR <- "X"


allinop <- rbind(all_chr_again_I,all_chr_again_II,all_chr_again_III,all_chr_again_IV,all_chr_again_V,all_chr_again_X)



brigtobind <- data.frame(Chr = allbrig$CHR,Gen=allbrig$norm_gen,Phys=allbrig$norm_phys,Species= "C. briggsae")

rematobind <- data.frame(Chr = allrem$CHR,Gen=allrem$norm_gen,Phys=allrem$norm_phys,Species= "C. remanei")

troptobind <- data.frame(Chr = alltrop$CHR,Gen=alltrop$norm_gen,Phys=alltrop$norm_phys,Species= "C. tropicalis")

elegtobind <- data.frame(Chr = alleleg$CHR,Gen=alleleg$norm_gen,Phys=alleleg$norm_phys,Species= "C. elegans")

inoptobind <- data.frame(Chr = allinop$CHR,Gen=allinop$norm_gen,Phys=allinop$norm_phys,Species= "C. inopinata")

ALLWORMS <- rbind(brigtobind,rematobind,troptobind,elegtobind,inoptobind)

#visualize now normalized maps
ggplot(ALLWORMS,aes(x=Phys,y=Gen)) + geom_step() + facet_rep_grid(Species~Chr)  + theme_cowplot()


ALLWORMS$Species <- as.factor(ALLWORMS$Species)

ALLWORMS$Species <- factor(ALLWORMS$Species, levels=c("C. briggsae", "C. remanei", "C. tropicalis","C. elegans","C. inopinata"))



ggplot(ALLWORMS,aes(x=Phys,y=Gen)) + geom_step() + facet_rep_grid(Species~Chr)  + theme_cowplot() + scale_x_continuous(breaks=c(0,0.5,1))

#save data
#write.table(ALLWORMS,"ALLWORMS_norm_marey_map.tsv",sep="\t", quote = FALSE,row.names = FALSE)
#write.table(ALLWORMS,"ALLWORMS_norm_marey_map_REPRODUCE.tsv",sep="\t", quote = FALSE,row.names = FALSE)


####
####
####Getting normalized recombination rates across one hundred bins per chromosome (ranked by position).
####
####

	#this file was made above
ALLWORMS <- read.table("ALLWORMS_norm_marey_map.tsv", sep="\t",header=TRUE)

ALLWORMS$Chr <- as.factor(ALLWORMS$Chr)

brig <- ALLWORMS[ALLWORMS$Species == "C. briggsae",]
rema <- ALLWORMS[ALLWORMS$Species == "C. remanei",]
trop <- ALLWORMS[ALLWORMS$Species == "C. tropicalis",]
eleg <- ALLWORMS[ALLWORMS$Species == "C. elegans",]
inop <- ALLWORMS[ALLWORMS$Species == "C. inopinata",]

#interpolate map positions across ~1000 bins per chr
brig_inter <- NULL

for (i in levels(brig$Chr)) {
	the_chr <- brig[brig$Chr == i,]
	thou <- data.frame(Chr=i, Gen=NA,Phys=seq(0,1,by=0.001), Species='C. briggsae')
	brigI_b <- rbind(c(i,0,0,"C. briggsae"),the_chr)	
	brigI_c <- rbind(brigI_b,thou)
	brigI_d <- brigI_c[order(brigI_c$Phys),]
	brigI_e <- brigI_d %>% mutate(Gen2 = Gen) %>% fill(Gen2, .direction = "down")
	brigI_e$Phys <- as.numeric(brigI_e$Phys)
	brigI_e$Gen2 <- as.numeric(brigI_e$Gen2)
	brig_inter <- rbind(brig_inter,brigI_e)
}


rema_inter <- NULL

for (i in levels(rema$Chr)) {
	the_chr <- rema[rema$Chr == i,]
	thou <- data.frame(Chr=i, Gen=NA,Phys=seq(0,1,by=0.001), Species='C. remanei')
	brigI_b <- rbind(c(i,0,0,"C. remanei"),the_chr)	
	brigI_c <- rbind(brigI_b,thou)
	brigI_d <- brigI_c[order(brigI_c$Phys),]
	brigI_e <- brigI_d %>% mutate(Gen2 = Gen) %>% fill(Gen2, .direction = "down")
	brigI_e$Phys <- as.numeric(brigI_e$Phys)
	brigI_e$Gen2 <- as.numeric(brigI_e$Gen2)
	rema_inter <- rbind(rema_inter,brigI_e)
}


trop_inter <- NULL

for (i in levels(trop$Chr)) {
	the_chr <- trop[trop$Chr == i,]
	thou <- data.frame(Chr=i, Gen=NA,Phys=seq(0,1,by=0.001), Species='C. tropicalis')
	brigI_b <- rbind(c(i,0,0,"C. tropicalis"),the_chr)
	brigI_c <- rbind(brigI_b,thou)
	brigI_d <- brigI_c[order(brigI_c$Phys),]
	brigI_e <- brigI_d %>% mutate(Gen2 = Gen) %>% fill(Gen2, .direction = "down")
	brigI_e$Phys <- as.numeric(brigI_e$Phys)
	brigI_e$Gen2 <- as.numeric(brigI_e$Gen2)
	trop_inter <- rbind(trop_inter,brigI_e)
}


eleg_inter <- NULL

for (i in levels(eleg$Chr)) {
	the_chr <- eleg[eleg$Chr == i,]
	thou <- data.frame(Chr=i, Gen=NA,Phys=seq(0,1,by=0.001), Species='C. elegans')
	brigI_b <- rbind(c(i,0,0,"C. elegans"),the_chr)
	brigI_c <- rbind(brigI_b,thou)
	brigI_d <- brigI_c[order(brigI_c$Phys),]
	brigI_e <- brigI_d %>% mutate(Gen2 = Gen) %>% fill(Gen2, .direction = "down")
	brigI_e$Phys <- as.numeric(brigI_e$Phys)
	brigI_e$Gen2 <- as.numeric(brigI_e$Gen2)
	eleg_inter <- rbind(eleg_inter,brigI_e)
}



inop_inter <- NULL

for (i in levels(inop$Chr)) {
	the_chr <- inop[inop$Chr == i,]
	thou <- data.frame(Chr=i, Gen=NA,Phys=seq(0,1,by=0.001), Species='C. inopinata')
	brigI_b <- rbind(c(i,0,0,"C. inopinata"),the_chr)	
	brigI_c <- rbind(brigI_b,thou)
	brigI_d <- brigI_c[order(brigI_c$Phys),]
	brigI_e <- brigI_d %>% mutate(Gen2 = Gen) %>% fill(Gen2, .direction = "down")
	brigI_e$Phys <- as.numeric(brigI_e$Phys)
	brigI_e$Gen2 <- as.numeric(brigI_e$Gen2)
	inop_inter <- rbind(inop_inter,brigI_e)
}

ALLWORMS2 <- rbind(brig_inter,rema_inter,trop_inter,eleg_inter,inop_inter)


#define a function to get recombination rates (cm/bp) for hundredths of a chromosome across its length. here, using a simple linear model to get rec rate (slope).
ratefunc <- function(df,species) { 
  #subset by species
	brig <- df[df$Species == species,]
	#get bin based on physical position range. here, slicing chr's into 100 pieces each
	brig$physbin <- cut(brig$Phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
	brig$chr_physbin <- as.factor(paste(brig$Chr,brig$physbin))
	
	brigrates <- NULL
	
	for (i in levels(brig$chr_physbin)) {
		bin <- brig[brig$chr_physbin == i,]
		the_rate <- ifelse(nrow(bin) > 5, lm(Gen2 ~ Phys, data=bin)$coefficients[2], NA)
		the_row <- data.frame(Chr=unique(bin$Chr),Species=unique(bin$Species),physbin=unique(bin$physbin),chr_physbin=unique(bin$chr_physbin),rate=the_rate)
		brigrates <- rbind(brigrates,the_row)
	}
	
	brigrates$physbinnum <- sequence(rle(as.vector(brigrates$Chr))$lengths)
	return(brigrates)

} 



brigrates <- ratefunc(ALLWORMS2,"C. briggsae")
remrates <- ratefunc(ALLWORMS2,"C. remanei")
troprates <- ratefunc(ALLWORMS2,"C. tropicalis")
elegrates <- ratefunc(ALLWORMS2,"C. elegans")
inoprates <- ratefunc(ALLWORMS2,"C. inopinata")

allrates <- rbind(brigrates,remrates,troprates,elegrates,inoprates)

#save data
#write.table(allrates,"allrates_normalized_gen_and_pos.tsv",sep="\t", quote = FALSE,row.names = FALSE)
#write.table(allrates,"allrates_normalized_gen_and_pos_REPRODUCE.tsv",sep="\t", quote = FALSE,row.names = FALSE)


####
####
####Repeats
####
#### 



repeats <- read.table("global_repeat_density_10kb_win_with_tropicalis.tsv", sep="\t",header=TRUE)
	#where does this file come from?
	#this is largely derived from Woodruff and Teterina MBE 2020 "Degradation of the repetitive genomic landscape in a close relative of Caenorhabditis elegans"
	#C. tropicalis was included by running bedtools nuc on a hardmasked version of the NIC203 assembly from Ben-David et al. 2021 Current Biology "Ubiquitous Selfish Toxin-Antidote Elements in Caenorhabditis Species"

	#C. tropicalis genome: https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_016735795.1/

	#this .tsv file is a modified version of this file:
	#https://github.com/gcwoodruff/transposable_elements_2019/blob/master/data/global_repeat_density_10kb_win_norm_dist_cent.tsv  

#visualize
ggplot(repeats,aes(x=BP,y=num_rep)) + geom_point(alpha=0.5,size=0.5) + geom_smooth() + facet_rep_grid(species~Chr) + theme_cowplot()

#file read above
#allrates <- read.table("allrates_normalized_gen_and_pos.tsv", sep="\t",header=TRUE)

#remove C. nigoni because there is no nigoni genetic map
repeats_no_nigoni <- repeats[repeats$species != "nigoni",]







repeats_no_nigoni <- repeats[repeats$species != "nigoni",]

repeats_no_nigoni$Chr <- as.factor(repeats_no_nigoni$Chr)

repbrig <- repeats_no_nigoni[repeats_no_nigoni$species == "briggsae",]
repeleg <- repeats_no_nigoni[repeats_no_nigoni$species == "elegans",]
reprem <- repeats_no_nigoni[repeats_no_nigoni$species == "remanei",]
repinop <- repeats_no_nigoni[repeats_no_nigoni$species == "inopinata",]
reptrop <- repeats_no_nigoni[repeats_no_nigoni$species == "tropicalis",]

#normalize by chromosome position
bbbb <- NULL

for (i in levels(repbrig$Chr)) {
	chr_df <- repbrig[repbrig$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	bbbb <- rbind(bbbb,chr_df)
}


eeee <- NULL

for (i in levels(repeleg$Chr)) {
	chr_df <- repeleg[repeleg$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	eeee <- rbind(eeee,chr_df)
}


rrrr <- NULL

for (i in levels(reprem$Chr)) {
	chr_df <- reprem[reprem$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	rrrr <- rbind(rrrr,chr_df)
}


iiii <- NULL

for (i in levels(repinop$Chr)) {
	chr_df <- repinop[repinop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	iiii <- rbind(iiii,chr_df)
}

tttt <- NULL

for (i in levels(reptrop$Chr)) {
	chr_df <- reptrop[reptrop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	tttt <- rbind(tttt,chr_df)
}


#get the one hundred bins to join to genetic map data

bbbb$physbin <- cut(bbbb$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
bbbb$chr_physbin <- as.factor(paste(bbbb$Chr,bbbb$physbin))
brig_agg <- aggregate(num_rep ~ chr_physbin,FUN=sum,data=bbbb)


eeee$physbin <- cut(eeee$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
eeee$chr_physbin <- as.factor(paste(eeee$Chr,eeee$physbin))
eleg_agg <- aggregate(num_rep ~ chr_physbin,FUN=sum,data=eeee)


rrrr$physbin <- cut(rrrr$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
rrrr$chr_physbin <- as.factor(paste(rrrr$Chr,rrrr$physbin))
rema_agg <- aggregate(num_rep ~ chr_physbin,FUN=sum,data=rrrr)


iiii$physbin <- cut(iiii$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
iiii$chr_physbin <- as.factor(paste(iiii$Chr,iiii$physbin))
inop_agg <- aggregate(num_rep ~ chr_physbin,FUN=sum,data=iiii)


tttt$physbin <- cut(tttt$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
tttt$chr_physbin <- as.factor(paste(tttt$Chr,tttt$physbin))
trop_agg <- aggregate(num_rep ~ chr_physbin,FUN=sum,data=tttt)



brig_agg_ii <- data.frame(chr_physbin=brig_agg$chr_physbin,num_rep=brig_agg$num_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. briggsae")

eleg_agg_ii <- data.frame(chr_physbin=eleg_agg$chr_physbin,num_rep=eleg_agg$num_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. elegans")

rema_agg_ii <- data.frame(chr_physbin=rema_agg$chr_physbin,num_rep=rema_agg$num_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. remanei")


inop_agg_ii <- data.frame(chr_physbin=inop_agg$chr_physbin,num_rep=inop_agg$num_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. inopinata")

trop_agg_ii <- data.frame(chr_physbin=trop_agg$chr_physbin,num_rep=trop_agg$num_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. tropicalis")


recratebrig <- allrates[allrates$Species == "C. briggsae",]
recrateeleg <- allrates[allrates$Species == "C. elegans",]
recraterema <- allrates[allrates$Species == "C. remanei",]
recrateinop <- allrates[allrates$Species == "C. inopinata",]
recratetrop <- allrates[allrates$Species == "C. tropicalis",]


#join repeat data to recombination map data
brigmerge <- merge(recratebrig,brig_agg_ii,by="chr_physbin")
elegmerge <- merge(recrateeleg,eleg_agg_ii,by="chr_physbin")
remamerge <- merge(recraterema,rema_agg_ii,by="chr_physbin")
inopmerge <- merge(recrateinop,inop_agg_ii,by="chr_physbin")
tropmerge <- merge(recratetrop,trop_agg_ii,by="chr_physbin")


allmerge <- rbind(brigmerge,elegmerge,remamerge,inopmerge,tropmerge)


#look at recombination rates again
ggplot(allmerge,aes(x=physbinnum.x,y=rate)) + geom_point() + geom_smooth() + facet_grid(Species.x~Chr.x,) + theme_cowplot() +ylim(-1,5)

#look at repeats

ggplot(allmerge,aes(x=physbinnum.x,y=num_rep)) + geom_point() + geom_smooth() + facet_grid(Species.x~Chr.x,) + theme_cowplot() 

#ok, visualize both repeats and rec rates

allmerge_no_x <- allmerge[allmerge$Chr.x != "X",]
#remove extreme repeat values
allmerge_no_x_no_rep_outlier <- allmerge_no_x[allmerge_no_x$num_rep < 100001,]

ggplot(allmerge,aes(x=rate,y=num_rep)) + geom_point(alpha=0.5,size=0.5) + geom_smooth(method="lm") + facet_wrap(~Species.x,) + theme_cowplot() +xlim(0,7) + theme(strip.text = element_text(face = "italic")) + xlab("Normalized recombination rate") + ylab("Number of repetitive bp")


ggplot(allmerge_no_x,aes(x=rate,y=num_rep)) + geom_point(alpha=0.5,size=0.5) + geom_smooth(method="lm") + facet_wrap(~Species.x,) + theme_cowplot() +xlim(0,7) + ylim(0,1) + theme(strip.text = element_text(face = "italic")) + xlab("Normalized recombination rate") + ylab("Fraction of repetitive bp")


ggplot(allmerge_no_x_no_rep_outlier,aes(x=rate,y=num_rep)) + geom_point(alpha=0.5,size=0.5) + geom_smooth(method="lm") + facet_wrap(~Species.x,) + theme_cowplot() +xlim(0,7) + theme(strip.text = element_text(face = "italic")) + xlab("Normalized recombination rate") + ylab("Number of repetitive bp")

#save data
#write.table(allmerge_no_x_no_rep_outlier,"allmerge_no_x_no_rep_outlier_REPEATS_RECOMBINATION.tsv",sep="\t", quote = FALSE,row.names = FALSE)
#write.table(allmerge,"allmerge_REPEATS_RECOMBINATION.tsv",sep="\t", quote = FALSE,row.names = FALSE)




####
####
####Genes
####
#### 



	#where does this file come from?
gen_dat <- read.table("gene_density.tsv", sep="\t", header=TRUE)
	#Woodruff and Teterina MBE 2020 "Degradation of the repetitive genomic landscape in a close relative of Caenorhabditis elegans"
	#https://github.com/gcwoodruff/transposable_elements_2019/blob/master/data/gene_density.tsv

	#where does this file come from?
trop_gen_dat <- read.table("tropicalis_gene_density_100kb.tsv", sep="\t", header=TRUE)
	#made for this study
	#see file /Users/gavin/genome/remasking/tropicalis_gene_count.sh
	#annotations from Noble et al. 2021 eLife "Selfing is the safest sex for Caenorhabditis tropicalis"

gen_dat_min <- data.frame(Chr=gen_dat$Chr,BP=gen_dat$BP,gene_num=gen_dat$gene_num,species=gen_dat$species)

gen_dat_min <- rbind(gen_dat_min,trop_gen_dat)


#visualize gene density
ggplot(gen_dat_min,aes(x=BP,y=gene_num)) + geom_point(alpha=0.5,size=0.5) + geom_smooth() + facet_rep_grid(species~Chr) + theme_cowplot()


gen_dat_min_noni <- gen_dat_min[gen_dat_min$species != "nigoni",]

gen_dat_min_noni$Chr <- as.factor(gen_dat_min_noni$Chr)

genbrig <- gen_dat_min_noni[gen_dat_min_noni$species == "briggsae",]
geneleg <- gen_dat_min_noni[gen_dat_min_noni$species == "elegans",]
genrem <- gen_dat_min_noni[gen_dat_min_noni$species == "remanei",]
geninop <- gen_dat_min_noni[gen_dat_min_noni$species == "inopinata",]
gentrop <- gen_dat_min_noni[gen_dat_min_noni$species == "tropicalis",]



#normalize by chromosome position

briggen2 <- NULL

for (i in levels(genbrig$Chr)) {
	chr_df <- genbrig[genbrig$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	briggen2 <- rbind(briggen2,chr_df)
}


eleggen2e <- NULL

for (i in levels(geneleg$Chr)) {
	chr_df <- geneleg[geneleg$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	eleggen2e <- rbind(eleggen2e,chr_df)
}


remagen2 <- NULL

for (i in levels(genrem$Chr)) {
	chr_df <- genrem[genrem$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	remagen2 <- rbind(remagen2,chr_df)
}


inopgen2 <- NULL

for (i in levels(geninop$Chr)) {
	chr_df <- geninop[geninop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	inopgen2 <- rbind(inopgen2,chr_df)
}

tropgen2 <- NULL

for (i in levels(gentrop$Chr)) {
	chr_df <- gentrop[gentrop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	tropgen2 <- rbind(tropgen2,chr_df)
}



#get the one hundred bins to join to genetic map data


briggen2$physbin <- cut(briggen2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
briggen2$chr_physbin <- as.factor(paste(briggen2$Chr,briggen2$physbin))
brig_gen_agg <- aggregate(gene_num ~ chr_physbin,FUN=sum,data=briggen2)


eleggen2e$physbin <- cut(eleggen2e$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
eleggen2e$chr_physbin <- as.factor(paste(eleggen2e$Chr,eleggen2e$physbin))
eleg_gen_agg <- aggregate(gene_num ~ chr_physbin,FUN=sum,data=eleggen2e)


remagen2$physbin <- cut(remagen2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
remagen2$chr_physbin <- as.factor(paste(remagen2$Chr,remagen2$physbin))
rema_gen_agg <- aggregate(gene_num ~ chr_physbin,FUN=sum,data=remagen2)


inopgen2$physbin <- cut(inopgen2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
inopgen2$chr_physbin <- as.factor(paste(inopgen2$Chr,inopgen2$physbin))
inop_gen_agg <- aggregate(gene_num ~ chr_physbin,FUN=sum,data=inopgen2)


tropgen2$physbin <- cut(tropgen2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
tropgen2$chr_physbin <- as.factor(paste(tropgen2$Chr,tropgen2$physbin))
trop_gen_agg <- aggregate(gene_num ~ chr_physbin,FUN=sum,data=tropgen2)



brig_gen_agg_ii <- data.frame(chr_physbin=brig_gen_agg$chr_physbin,gene_num=brig_gen_agg$gene_num,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. briggsae")

eleg_gen_agg_ii <- data.frame(chr_physbin=eleg_gen_agg$chr_physbin,gene_num=eleg_gen_agg$gene_num,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. elegans")

rema_gen_agg_ii <- data.frame(chr_physbin=rema_gen_agg$chr_physbin,gene_num=rema_gen_agg$gene_num,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. remanei")


inop_gen_agg_ii <- data.frame(chr_physbin=inop_gen_agg$chr_physbin,gene_num=inop_gen_agg$gene_num,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. inopinata")

trop_gen_agg_ii <- data.frame(chr_physbin=trop_gen_agg$chr_physbin,gene_num=trop_gen_agg$gene_num,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),Species="C. tropicalis")


#put it all together
briggenmerge <- merge(recratebrig,brig_gen_agg_ii,by="chr_physbin")
eleggenmerge <- merge(recrateeleg,eleg_gen_agg_ii,by="chr_physbin")
remagenmerge <- merge(recraterema,rema_gen_agg_ii,by="chr_physbin")
inopgenmerge <- merge(recrateinop,inop_gen_agg_ii,by="chr_physbin")
tropgenmerge <- merge(recratetrop,trop_gen_agg_ii,by="chr_physbin")


allmergegen <- rbind(briggenmerge,eleggenmerge,remagenmerge,inopgenmerge,tropgenmerge)




#visualize

ggplot(allmergegen,aes(x=physbinnum.x,y=rate)) + geom_point() + geom_smooth() + facet_grid(Species.x~Chr.x,) + theme_cowplot() +ylim(-1,5)

ggplot(allmergegen,aes(x=physbinnum.x,y=gene_num)) + geom_point() + geom_smooth() + facet_grid(Species.x~Chr.x,) + theme_cowplot() 


allmerge_gen_no_x <- allmergegen[allmergegen$Chr.x != "X",]

ggplot(allmergegen,aes(x=rate,y=gene_num)) + geom_point(alpha=0.5,size=0.5) + geom_smooth(method="lm") + facet_wrap(~Species.x,) + theme_cowplot() +xlim(0,10) + theme(strip.text = element_text(face = "italic")) + xlab("Normalized recombination rate") + ylab("Number of genes")


ggplot(allmerge_gen_no_x,aes(x=rate,y=gene_num)) + geom_point(alpha=0.5,size=0.5) + geom_smooth(method="lm") + facet_wrap(~Species.x,) + theme_cowplot()  +xlim(0,7) + theme(strip.text = element_text(face = "italic")) + xlab("Normalized recombination rate") + ylab("Number of genes")

#save data
#write.table(allmergegen,"allmerge_GENES_RECOMBINATION__REPRODUCE.tsv",sep="\t", quote = FALSE,row.names = FALSE)

#write.table(allmergegen,"allmerge_GENES_RECOMBINATION.tsv",sep="\t", quote = FALSE,row.names = FALSE)




####
####
####Diversity
####
#### 

	#where is this file from?
tetdiv <- read.table("diversity_stats_diploSHIC_BETA_C.elegans_C.remanei.txt", sep="\t", header=TRUE)
	#this is from Teterina et al. 2023 Plos Genetics "Genomic diversity landscapes in outcrossing and selfing Caenorhabditis nematodes"
	#kindly shared by Anastasia Teterina
	#see the following for how it was constructed:
	#https://github.com/phillips-lab/CR_CE_popgen/tree/main/diversity_stats

	#where is this file from?
woodiv <- read.csv("ino_elg_pi.csv", header=TRUE)
	#this is from Woodruff et al. 2024 GBE "Patterns of Genomic Diversity in a Fig-Associated Close Relative of Caenorhabditis elegans"
	#https://github.com/gcwoodruff/inopinata_population_genomics_2020/blob/main/data/ino_elg_pi.csv

	#where is this file from?
selferdiv <- read.table("selfer_theta_20kb.tsv", sep="\t", header=TRUE)
	#this is from Noble et al. 2021 eLife "Selfing is the safest sex for Caenorhabditis tropicalis"
	#figure 2 source file 1
	#https://cdn.elifesciences.org/articles/62587/elife-62587-fig2-data1-v2.tsv.zip

divbrig <- selferdiv[selferdiv$sp == "briggsae",]
diveleg <- selferdiv[selferdiv$sp == "elegans",]
divinop <- woodiv[woodiv$species == "C. inopinata",]
divrema <- tetdiv[tetdiv$Species == "C.remanei", ]
divtrop <- selferdiv[selferdiv$sp == "tropicalis",]

	##where does THIS file come from?
#allmergegen <- read.table("allmerge_GENES_RECOMBINATION.tsv", sep="\t", header=TRUE)
	#see section "Genes" above

	##where does THIS file come from?
#allmerge <- read.table("allmerge_REPEATS_RECOMBINATION.tsv", sep="\t", header=TRUE)
	#see section "Repeats" above

#get data consistent
selferdiv$Chr <- as.factor(selferdiv$chrom)
tetdiv$Chr <- as.factor(tetdiv$chrom)
woodiv$Chr <- as.factor(woodiv$scaffold)

selferdiv$BP <- selferdiv$w
tetdiv$BP <- tetdiv$classifiedWinStart.x+1
woodiv$BP <- woodiv$start

divbrig <- selferdiv[selferdiv$sp == "briggsae",]
diveleg <- selferdiv[selferdiv$sp == "elegans",]
divinop <- woodiv[woodiv$species == "C. inopinata",]
divrema <- tetdiv[tetdiv$Species == "C.remanei", ]
divtrop <- selferdiv[selferdiv$sp == "tropicalis",]

#normalize by chromosome position

brigdiv2 <- NULL

for (i in levels(divbrig$Chr)) {
	chr_df <- divbrig[divbrig$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	brigdiv2 <- rbind(brigdiv2,chr_df)
}


elegdiv2e <- NULL

for (i in levels(diveleg$Chr)) {
	chr_df <- diveleg[diveleg$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	elegdiv2e <- rbind(elegdiv2e,chr_df)
}


remadiv2 <- NULL

for (i in levels(divrema$Chr)) {
	chr_df <- divrema[divrema$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	remadiv2 <- rbind(remadiv2,chr_df)
}


inopdiv2 <- NULL

for (i in levels(divinop$Chr)) {
	chr_df <- divinop[divinop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	inopdiv2 <- rbind(inopdiv2,chr_df)
}

tropdiv2 <- NULL

for (i in levels(divtrop$Chr)) {
	chr_df <- divtrop[divtrop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	tropdiv2 <- rbind(tropdiv2,chr_df)
}


#get the one hundred bins per chromosome for merging with other data

brigdiv2$physbin <- cut(brigdiv2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
brigdiv2$chr_physbin <- as.factor(paste(brigdiv2$Chr,brigdiv2$physbin))
brigdiv2 <- na.omit(brigdiv2)
brig_div_agg <- aggregate(theta ~ chr_physbin,FUN=mean,data=brigdiv2)


brig_div_agg<- separate(brig_div_agg, chr_physbin, into = c("Chr","physbin"), sep = " (?=[^ ]+$)")
brig_div_agg$chr_physbin <- as.factor(paste(brig_div_agg$Chr,brig_div_agg$physbin))
names(brig_div_agg)[names(brig_div_agg) == 'theta'] <- 'div'

elegdiv2e$physbin <- cut(elegdiv2e$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
elegdiv2e$chr_physbin <- as.factor(paste(elegdiv2e$Chr,elegdiv2e$physbin))
elegdiv2e <- na.omit(elegdiv2e)
eleg_div_agg <- aggregate(theta ~ chr_physbin,FUN=mean,data=elegdiv2e)

eleg_div_agg<- separate(eleg_div_agg, chr_physbin, into = c("Chr","physbin"), sep = " (?=[^ ]+$)")
eleg_div_agg$chr_physbin <- as.factor(paste(eleg_div_agg$Chr,eleg_div_agg$physbin))
names(eleg_div_agg)[names(eleg_div_agg) == 'theta'] <- 'div'


remadiv2$PI <- remadiv2$pi

remadiv2$physbin <- cut(remadiv2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
remadiv2$chr_physbin <- as.factor(paste(remadiv2$Chr,remadiv2$physbin))
remadiv2 <- na.omit(remadiv2)
rema_div_agg <- aggregate(PI ~ chr_physbin,FUN=mean,data=remadiv2)
rema_div_agg<- separate(rema_div_agg, chr_physbin, into = c("Chr","physbin"), sep = " (?=[^ ]+$)")
rema_div_agg$chr_physbin <- as.factor(paste(rema_div_agg$Chr,rema_div_agg$physbin))
names(rema_div_agg)[names(rema_div_agg) == 'PI'] <- 'div'


inopdiv2$physbin <- cut(inopdiv2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
inopdiv2$chr_physbin <- as.factor(paste(inopdiv2$Chr,inopdiv2$physbin))
inopdiv2 <- na.omit(inopdiv2)
inop_div_agg <- aggregate(pi_all ~ chr_physbin,FUN=mean,data=inopdiv2)
inop_div_agg<- separate(inop_div_agg, chr_physbin, into = c("Chr","physbin"), sep = " (?=[^ ]+$)")
inop_div_agg$chr_physbin <- as.factor(paste(inop_div_agg$Chr,inop_div_agg$physbin))
names(inop_div_agg)[names(inop_div_agg) == 'pi_all'] <- 'div'


tropdiv2$physbin <- cut(tropdiv2$norm_phys,seq(0,1,by=0.01))
	#make a factor to define specific bins by chromosome
tropdiv2$chr_physbin <- as.factor(paste(tropdiv2$Chr,tropdiv2$physbin))
tropdiv2 <- na.omit(tropdiv2)
trop_div_agg <- aggregate(theta ~ chr_physbin,FUN=mean,data=tropdiv2)
trop_div_agg<- separate(trop_div_agg, chr_physbin, into = c("Chr","physbin"), sep = " (?=[^ ]+$)")
trop_div_agg$chr_physbin <- as.factor(paste(trop_div_agg$Chr,trop_div_agg$physbin))
names(trop_div_agg)[names(trop_div_agg) == 'theta'] <- 'div'

#paste with other data
recratebrig <- allrates[allrates$Species == "C. briggsae",]
recrateeleg <- allrates[allrates$Species == "C. elegans",]
recraterema <- allrates[allrates$Species == "C. remanei",]
recrateinop <- allrates[allrates$Species == "C. inopinata",]
recratetrop <- allrates[allrates$Species == "C. tropicalis",]

brigdivmerge <- merge(recratebrig,brig_div_agg,by="chr_physbin")
elegdivmerge <- merge(recrateeleg,eleg_div_agg,by="chr_physbin")
remadivmerge <- merge(recraterema,rema_div_agg,by="chr_physbin")
inopdivmerge <- merge(recrateinop,inop_div_agg,by="chr_physbin")
tropdivmerge <- merge(recratetrop,trop_div_agg,by="chr_physbin")


allmergediv <- rbind(brigdivmerge,elegdivmerge,remadivmerge,inopdivmerge,tropdivmerge)


divtobind <- data.frame(Species=allmergediv$Species,chr_physbin=allmergediv$chr_physbin,rate=allmergediv$rate,value=allmergediv$div,category="diversity")

reptobind <- data.frame(Species=allmerge$Species.x,chr_physbin=allmerge$chr_physbin,rate=allmerge$rate,value=allmerge$num_rep,category="repeats")

gentobind <-  data.frame(Species=allmergegen$Species.x,chr_physbin=allmergegen$chr_physbin,rate=allmergegen$rate,value=allmergegen$gene_num,category="genes")

plotbinddf <- rbind(divtobind,reptobind,gentobind)


plotbinddf$category <- as.factor(plotbinddf$category)

plotbinddf$category <- factor(plotbinddf$category, levels=c("diversity", "genes","repeats"))


ggplot(plotbinddf,aes(x=rate,y=value)) + geom_point(aes(colour=category),alpha=0.5,size=0.5) + geom_smooth(aes(colour=category,fill=category),method="lm") + facet_rep_grid(category~Species,scales = "free") + theme_cowplot(font_size=23) +scale_colour_manual(values=c("#D95F02","#7570B3","#E6AB02")) +xlim(0,7) + scale_fill_manual(values=c("#D95F02","#7570B3","#E6AB02")) + theme(strip.background = element_rect(colour="white", fill="white"), legend.position="none")

#save data
#write.table(plotbinddf,"GENES_DIVERSITY_REPEATS_RECOMBINATION_scatterplot_df_6-11-24.tsv",sep="\t", quote = FALSE,row.names = FALSE)


#figure 1

#figure 1a

dat <- read.csv("kent_et_al_data.csv",header=TRUE,stringsAsFactors = TRUE)
	#from Kent et al. 2017 "Coevolution between transposable elements and recombination" Philosophical Transactions of the Royal Society B

dat$name_te_type <- paste(dat$common_name,dat$TE_type)

dat$name_te_type <- as.factor(dat$name_te_type)

levels(dat$name_te_type)

dat$name_te_type <- factor(dat$name_te_type, levels=c("Arabidopsis CACTA","Arabidopsis DNA","Arabidopsis Gypsy","Arabidopsis Helitrons","Arabidopsis retrotransposons","bread wheat all","bread wheat DNA","bread wheat Gypsy","maize Mu","rice DNA","rice LINEs/SINEs","rice LTR","rose gum tree all","rose gum tree DNA","rose gum tree Helitrons","rose gum tree LINEs/SINEs","soybean all","soybean DNA","soybean LINEs","soybean LTR","D. melanogaster DNA","D. melanogaster LTR","D. melanogaster Non-LTR","human LINEs","mouse all","mouse LINEs","rat all","rat LINEs","C. briggsae all","C. elegans all","C. remanei all","C. tropicalis all"))

ggplot(dat, aes(x = name_te_type, y = correlation)) + geom_col(aes(fill=plant_animal,colour=is_sig)) + theme_half_open(font_size=20) + background_grid() + scale_colour_manual(name= "p < 0.05?",values=c("white","black")) + scale_fill_brewer(palette="Set1") + theme(axis.text.x=element_blank()) + scale_y_continuous(limits=c(-0.9,0.9),breaks=c(seq(-0.9,0.9,by=0.1))) + ylab("Correlation coefficient")

#figure 1b

repeats <- read.table("global_repeat_density_10kb_win_norm_dist_cent.tsv",sep="\t",header=T)

repeats$MB <- repeats$BP/1000000

repeleg <- repeats[repeats$species == "elegans",]
repinop <- repeats[repeats$species == "inopinata",]

eleginoprep <- rbind(repeleg,repinop)

eleginoprep$Species.Chr <- paste(eleginoprep$species,eleginoprep$Chr)

eleginoprep_III <- eleginoprep[eleginoprep$Chr == "III",]

eleginoprep_III$perc_rep <- eleginoprep_III$num_rep/100

ggplot(eleginoprep_III,aes(x=MB,y=perc_rep)) + geom_point(colour="#E6AB02",alpha=0.5) + geom_smooth(colour="#E6AB02",fill="#E6AB02") + facet_rep_wrap(~species,nrow=1) + theme_cowplot(font_size=16) + xlab("Genomic position (MB)") + ylab("Percent repetitive region") + theme(strip.background = element_rect(colour="white", fill="white"), legend.position="none")

#figure 1a and 1b were joined and modified in adobe illustrator



ALLWORMS <- read.table("ALLWORMS_norm_marey_map.tsv",sep="\t",header=TRUE)


eleg <- ALLWORMS[ALLWORMS$Species == "C. elegans",]
inop <- ALLWORMS[ALLWORMS$Species == "C. inopinata",]

dat_to_plot <- rbind(eleg,inop)


#see above for all_chr_again df

all_chr_again <- read.table("all_chr_map_af_etc.tsv",sep="\t",header=TRUE)



geno_count_df_meanfams <-  data.frame(CHR=all_chr_again$CHR,MB=all_chr_again$MB,Hom1=(all_chr_again$recomb_fam_1_fra_Hom1+all_chr_again$recomb_fam_2_fra_Hom1)/2,Het=(all_chr_again$recomb_fam_1_fra_Het+all_chr_again$recomb_fam_2_fra_Het)/2,Hom2=(all_chr_again$recomb_fam_1_fra_Hom2+all_chr_again$recomb_fam_2_fra_Hom2)/2)

geno_count_df_meanfams_melt <- reshape2::melt(geno_count_df_meanfams,measure.vars=c(3:5))


geno_count_df_meanfams_melt$CHR <- as.factor(geno_count_df_meanfams_melt$CHR)



levels(geno_count_df_meanfams_melt$CHR)[levels(geno_count_df_meanfams_melt$CHR)=="Sp34_Chr1"] <- "I"
levels(geno_count_df_meanfams_melt$CHR)[levels(geno_count_df_meanfams_melt$CHR)=="Sp34_Chr2"] <- "II"
levels(geno_count_df_meanfams_melt$CHR)[levels(geno_count_df_meanfams_melt$CHR)=="Sp34_Chr3"] <- "III"
levels(geno_count_df_meanfams_melt$CHR)[levels(geno_count_df_meanfams_melt$CHR)=="Sp34_Chr4"] <- "IV"
levels(geno_count_df_meanfams_melt$CHR)[levels(geno_count_df_meanfams_melt$CHR)=="Sp34_Chr5"] <- "V"
levels(geno_count_df_meanfams_melt$CHR)[levels(geno_count_df_meanfams_melt$CHR)=="Sp34_ChrX"] <- "X"


#file made above
#allrates <- read.table("allrates_normalized_gen_and_pos.tsv",sep="\t",header=T)

releg <- allrates[allrates$Species == "C. elegans",]
rinop <- allrates[allrates$Species == "C. inopinata",]

relegI <- releg[releg$Chr == 'I',]
relegI$pos <- (relegI$physbinnum/100)*15331301
relegII <- releg[releg$Chr == 'II',]
relegII$pos <- (relegII$physbinnum/100)*15525148
relegIII <- releg[releg$Chr == 'III',]
relegIII$pos <- (relegIII$physbinnum/100)*14108536
relegIV <- releg[releg$Chr == 'IV',]
relegIV$pos <- (relegIV$physbinnum/100)*17759200
relegV <- releg[releg$Chr == 'V',]
relegV$pos <- (relegV$physbinnum/100)*21243235
relegX <- releg[releg$Chr == 'X',]
relegX$pos <- (relegX$physbinnum/100)*18110855


rinopI <- rinop[rinop$Chr == 'I',]
rinopI$pos <- (rinopI$physbinnum/100)*20594552
rinopII <- rinop[rinop$Chr == 'II',]
rinopII$pos <- (rinopII$physbinnum/100)*20116996
rinopIII <- rinop[rinop$Chr == 'III',]
rinopIII$pos <- (rinopIII$physbinnum/100)*19436473
rinopIV <- rinop[rinop$Chr == 'IV',]
rinopIV$pos <- (rinopIV$physbinnum/100)*21017644
rinopV <- rinop[rinop$Chr == 'V',]
rinopV$pos <- (rinopV$physbinnum/100)*23638155
rinopX <- rinop[rinop$Chr == 'X',]
rinopX$pos <- (rinopX$physbinnum/100)*18190508

eleginoprates <- rbind(relegI,relegII,relegIII,relegIV,relegV,relegX,rinopI,rinopII,rinopIII,rinopIV,rinopV,rinopX)

eleginoprates$Species.Chr <- paste(eleginoprates$Species,eleginoprates$Chr)

eleginoprates$MB <- eleginoprates$pos/1000000



a <- ggplot(dat_to_plot,aes(x=Phys,y=Gen)) + geom_step() + facet_rep_grid(Species~Chr)  + theme_cowplot(font_size=14) + scale_x_continuous(limits=c(0,1),breaks=c(0,0.5,1),labels=c("0", "0.5", "1")) + theme(strip.background = element_rect(colour="white", fill="white"), strip.text.y = element_text(face="italic")) + xlab("Normalized physical position") + ylab("Normalized genetic position") 



b <- ggplot(geno_count_df_meanfams_melt,aes(x=MB,y=value)) + geom_hline(yintercept=0.5,linetype="dotted") + geom_hline(yintercept=0.25,linetype="dotted") + geom_line(aes(colour=variable)) + facet_rep_wrap(~CHR,nrow=1) + theme_cowplot(font_size=12) + scale_colour_manual(values=c("#E69F00", "#56B4E9", "#009E73"),labels=c("AA","Aa","aa")) + theme(strip.background = element_rect(colour="white", fill="white"),legend.position="none") + ylab("Genotype Frequency") + ylim(0,1) +labs(colour="Genotype")


c <- ggplot(eleginoprates,aes(x=MB,y=rate)) + geom_point(alpha=0.5,colour="#1B9E77") + geom_smooth(colour="#1B9E77",se=FALSE) + facet_rep_grid(Species ~ Chr) + theme_cowplot() +ylim(-0.1,5) + theme(strip.background = element_rect(colour="white", fill="white"),strip.text.y = element_text(size=12, face = "italic")) + xlab("Genomic Position (MB)") + ylab("Normalized recombination rate")

a/b/c + plot_layout(heights = c(2, 1, 2))


#this is figure 2, later modified in adobe illustrator






#figure 3

plotbinddf2 <- read.table("GENES_DIVERSITY_REPEATS_RECOMBINATION_scatterplot_df_6-11-24_edit.csv", sep="\t", header=TRUE)


plotbinddf2$physbin3 <- plotbinddf2$physbin2*100

plotbinddf2$arms_center <- ifelse(plotbinddf2$physbin3 >= 25 & plotbinddf2$physbin3 <=75, 'Center', 'Arms')

plotbinddf2_one_set_rec <- plotbinddf2[plotbinddf2$category == "diversity",]


plotbinddf2_one_set_rec$Species <- as.factor(plotbinddf2_one_set_rec$Species)

plotbinddf2_one_set_rec$Species <- factor(plotbinddf2_one_set_rec$Species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))

ggplot(plotbinddf2_one_set_rec,aes(x=arms_center,y=rate)) + geom_stripped_cols(odd = "white", even = "gray90")   + geom_boxplot(aes(colour=Species),outliers = FALSE,position=position_dodge(0.85)) + geom_sina(aes(colour=Species),size=0.37,alpha=0.5,scale="width",adjust=0.5,position=position_dodge(0.85))  + facet_rep_wrap(~Chr,nrow=2) + theme_cowplot() + scale_colour_brewer(palette="Set1") + ylim(0,10) + theme(strip.background = element_rect(colour="white", fill="white"),legend.text=element_text(face="italic")) + xlab("Chromosome region") + ylab("Normalized recombination rate")

#that's figure 3


#figure 4


#figure 4


plotbinddf<- read.table("GENES_DIVERSITY_REPEATS_RECOMBINATION_scatterplot_df_6-11-24_edit.csv",sep="\t",header=TRUE)
	#see above for this file's origins



plotbinddf$category <- as.factor(plotbinddf$category)

plotbinddf$category <- factor(plotbinddf$category, levels=c("diversity", "genes","repeats"))


plotbinddf$category <- as.factor(plotbinddf$category)

plotbinddf$category <- factor(plotbinddf$category, levels=c("diversity", "genes","repeats"))



plotbinddf_no_x <- plotbinddf[plotbinddf$Chr != "X",]

ggplot(plotbinddf_no_x,aes(x=rate,y=value)) + geom_point(aes(colour=category),alpha=1,size=1) + geom_smooth(aes(colour=category,fill=category),method="lm") + facet_rep_grid(category~Species,scales = "free") + theme_cowplot(font_size=23) +scale_colour_manual(values=c("#D95F02","#7570B3","#E6AB02")) +xlim(0,7) + scale_fill_manual(values=c("#D95F02","#7570B3","#E6AB02")) + theme(strip.background = element_rect(colour="white", fill="white"), legend.position="none")

#this is figure 4


#figure 5


plotbinddf2 <- read.table("/GENES_DIVERSITY_REPEATS_RECOMBINATION_scatterplot_df_6-11-24_edit.csv", sep="\t", header=TRUE)


plotbinddf2$physbin3 <- plotbinddf2$physbin2*100

plotbinddf2$arms_center <- ifelse(plotbinddf2$physbin3 >= 25 & plotbinddf2$physbin3 <=75, 'Center', 'Arms')

plotbinddf2_one_set_rec <- plotbinddf2[plotbinddf2$category == "diversity",]


plotbinddf2_one_set_rec$Species <- as.factor(plotbinddf2_one_set_rec$Species)

plotbinddf2_one_set_rec$Species <- factor(plotbinddf2_one_set_rec$Species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))




plotbinddf2$sp_chr_cat <- paste(plotbinddf2$Species,plotbinddf2$Chr,plotbinddf2$category)

plotbinddf2$sp_chr_cat <- as.factor(plotbinddf2$sp_chr_cat)



#get linear model stats for each species/chromosome/feature bin
coef_df <- NULL

for (i in levels(plotbinddf2$sp_chr_cat)) {
	cbri_gen <- plotbinddf2[plotbinddf2$sp_chr_cat == i,]
	df_to_bind <- data.frame(sp_chr_cat=i,r2=summary(lm(value ~ rate,data=cbri_gen))$r.squared,b0=summary(lm(value ~ rate,data=cbri_gen))$coefficients[1,1],b1=summary(lm(value ~ rate,data=cbri_gen))$coefficients[2,1],f1=summary(lm(value ~ rate,data=cbri_gen))$fstatistic[1],p=summary(lm(value ~ rate,data=cbri_gen))$coefficients[2,4])
	coef_df <- rbind(df_to_bind,coef_df)
}

coef_df$p.adj <- p.adjust(coef_df$p,method="BH")

#split some columns
library(tidyr)

#split column into two
coef_df<- separate(coef_df, sp_chr_cat, into = c("sp_chr","category"), sep = " (?=[^ ]+$)")

#split column into two again
coef_df<- separate(coef_df, sp_chr, into = c("Species","chr"), sep = " (?=[^ ]+$)")

coef_df$sp_chr_cat <- paste(coef_df$Species,coef_df$chr,coef_df$category)


coef_df$sig.adj <- coef_df$p.adj < 0.05
coef_df$sig <- coef_df$p < 0.05

sig_df <- data.frame(sp_chr_cat=coef_df$sp_chr_cat,sig=coef_df$sig,sig.adj=coef_df$sig.adj)

#write.table(coef_df,"rec_rate_genomic_feature_linear_model_stats_BY_CHROMOSOME_11-11-25.tsv",sep="\t", quote = FALSE,row.names = FALSE)

coef_df <- read.table("rec_rate_genomic_feature_linear_model_stats_BY_CHROMOSOME_11-11-25.tsv",sep="\t",header=T)


coef_df$sig.adj <- coef_df$p.adj < 0.05

sig_df <- data.frame(sp_chr_cat=coef_df$sp_chr_cat,sig=coef_df$sig,sig.adj=coef_df$sig.adj)


plotdfmerge <- merge(plotbinddf2,sig_df)


ggplot(plotdfmerge,aes(x=rate,y=value)) + geom_point(aes(colour=Chr),alpha=0.25,size=0.25) + geom_smooth(aes(colour=Chr,linetype=sig.adj),method="lm",se=FALSE) + facet_rep_grid(category~Species,scales = "free") + theme_cowplot()  +xlim(0,7) + scale_colour_manual(values=c("#1b9e77","#d95f02","#7570b3","#e7298a","#66a61e","#e6ab02")) + scale_linetype_manual(values=c(3,1)) + theme(strip.background = element_rect(colour="white", fill="white"))





#stats connected to figure 6

plotbinddf2_one_set_rec$sp_chr_arm_cen <- paste(plotbinddf2_one_set_rec$Species,plotbinddf2_one_set_rec$Chr,plotbinddf2_one_set_rec$arms_center)

the_comparisons <- list(c("C. briggsae I Arms", "C. briggsae I Center"),
 c("C. briggsae II Arms", "C. briggsae II Center"),
 c("C. briggsae III Arms", "C. briggsae III Center"),
 c("C. briggsae IV Arms", "C. briggsae IV Center"),
 c("C. briggsae V Arms", "C. briggsae V Center"),
 c("C. briggsae X Arms", "C. briggsae X Center"),
 c("C. elegans I Arms", "C. elegans I Center"),
 c("C. elegans II Arms", "C. elegans II Center"),
 c("C. elegans III Arms", "C. elegans III Center"),
 c("C. elegans IV Arms", "C. elegans IV Center"),
 c("C. elegans V Arms", "C. elegans V Center"),
 c("C. elegans X Arms", "C. elegans X Center"),
 c("C. remanei I Arms", "C. remanei I Center"),
 c("C. remanei II Arms", "C. remanei II Center"),
 c("C. remanei III Arms", "C. remanei III Center"),
 c("C. remanei IV Arms", "C. remanei IV Center"),
 c("C. remanei V Arms", "C. remanei V Center"),
 c("C. remanei X Arms", "C. remanei X Center"),
 c("C. inopinata I Arms", "C. inopinata I Center"),
 c("C. inopinata II Arms", "C. inopinata II Center"),
 c("C. inopinata III Arms", "C. inopinata III Center"),
 c("C. inopinata IV Arms", "C. inopinata IV Center"),
 c("C. inopinata V Arms", "C. inopinata V Center"),
 c("C. inopinata X Arms", "C. inopinata X Center"),
 c("C. tropicalis I Arms", "C. tropicalis I Center"),
 c("C. tropicalis II Arms", "C. tropicalis II Center"),
 c("C. tropicalis III Arms", "C. tropicalis III Center"),
 c("C. tropicalis IV Arms", "C. tropicalis IV Center"),
 c("C. tropicalis V Arms", "C. tropicalis V Center"),
 c("C. tropicalis X Arms", "C. tropicalis X Center"))



chr_sp_ac_eff_sizes <- as.data.frame(plotbinddf2_one_set_rec %>% cohens_d(rate ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))

#write.table(chr_sp_ac_eff_sizes,"chr_sp_ac_eff_sizes_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)


chr_sp_ac_wilcox <- as.data.frame(plotbinddf2_one_set_rec %>% pairwise_wilcox_test(rate ~ sp_chr_arm_cen, comparisons=the_comparisons))


#write.table(chr_sp_ac_wilcox,"chr_sp_ac_wilcox_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)

#diversity arm center effect sizes and hypothesis tests


#diversity
plotbinddf2_one_set_div <- plotbinddf2[plotbinddf2$category == "diversity",]

plotbinddf2_one_set_div$Species <- as.factor(plotbinddf2_one_set_div$Species)

plotbinddf2_one_set_div$Species <- factor(plotbinddf2_one_set_div$Species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))


plotbinddf2_one_set_div$sp_chr_arm_cen <- paste(plotbinddf2_one_set_div$Species,plotbinddf2_one_set_div$Chr,plotbinddf2_one_set_div$arms_center)


chr_sp_ac_eff_sizes_DIVERSITY <- as.data.frame(plotbinddf2_one_set_div %>% cohens_d(value ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))

#write.table(chr_sp_ac_eff_sizes_DIVERSITY,"chr_sp_ac_eff_sizes_DIVERSITY_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)



chr_sp_ac_wilcox_DIVERSITY <- as.data.frame(plotbinddf2_one_set_div %>% pairwise_wilcox_test(value ~ sp_chr_arm_cen, comparisons=the_comparisons))

#write.table(chr_sp_ac_wilcox_DIVERSITY,"chr_sp_ac_wilcox_DIVERSITY_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)





#genes arm-center stats


plotbinddf2_one_set_gen <- plotbinddf2[plotbinddf2$category == "genes",]

plotbinddf2_one_set_gen$Species <- as.factor(plotbinddf2_one_set_gen$Species)

plotbinddf2_one_set_gen$Species <- factor(plotbinddf2_one_set_gen$Species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))


plotbinddf2_one_set_gen$sp_chr_arm_cen <- paste(plotbinddf2_one_set_gen$Species,plotbinddf2_one_set_gen$Chr,plotbinddf2_one_set_gen$arms_center)


chr_sp_ac_eff_sizes_GENES <- as.data.frame(plotbinddf2_one_set_gen %>% cohens_d(value ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))

#write.table(chr_sp_ac_eff_sizes_GENES,"chr_sp_ac_eff_sizes_GENES_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)


chr_sp_ac_wilcox_GENES <- as.data.frame(plotbinddf2_one_set_gen %>% pairwise_wilcox_test(value ~ sp_chr_arm_cen, comparisons=the_comparisons))

#write.table(chr_sp_ac_wilcox_GENES,"chr_sp_ac_wilcox_GENES_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)



#repeats arm-center stats



plotbinddf2_one_set_rep <- plotbinddf2[plotbinddf2$category == "repeats",]

plotbinddf2_one_set_rep$Species <- as.factor(plotbinddf2_one_set_rep$Species)

plotbinddf2_one_set_rep$Species <- factor(plotbinddf2_one_set_rep$Species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))


plotbinddf2_one_set_rep$sp_chr_arm_cen <- paste(plotbinddf2_one_set_rep$Species,plotbinddf2_one_set_rep$Chr,plotbinddf2_one_set_rep$arms_center)


chr_sp_ac_eff_sizes_REPEATS <- as.data.frame(plotbinddf2_one_set_rep %>% cohens_d(value ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))

#write.table(chr_sp_ac_eff_sizes_REPEATS,"chr_sp_ac_eff_sizes_REPEATS_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)




chr_sp_ac_wilcox_REPEATS <- as.data.frame(plotbinddf2_one_set_rep %>% pairwise_wilcox_test(value ~ sp_chr_arm_cen, comparisons=the_comparisons))

#write.table(chr_sp_ac_wilcox_REPEATS,"chr_sp_ac_wilcox_REPEATS_2-7-26.tsv",sep="\t",quote=FALSE,row.names = FALSE)




#making big data frame for arm-center effect sizes

chr_sp_ac_eff_sizes <- read.table("chr_sp_ac_eff_sizes_2-7-26.tsv",sep="\t",header=TRUE)
chr_sp_ac_eff_sizes_DIVERSITY <- read.table("chr_sp_ac_eff_sizes_DIVERSITY_2-7-26.tsv",sep="\t",header=TRUE)
chr_sp_ac_eff_sizes_GENES <- read.table("chr_sp_ac_eff_sizes_GENES_2-7-26.tsv",sep="\t",header=TRUE)
chr_sp_ac_eff_sizes_REPEATS <- read.table("chr_sp_ac_eff_sizes_REPEATS_2-7-26.tsv",sep="\t",header=TRUE)

#join

rec_diversity_chr_effsizes_join <- merge(chr_sp_ac_eff_sizes,chr_sp_ac_eff_sizes_DIVERSITY,by="group1")


#join

rec_diversity_chr_effsizes_join <- merge(chr_sp_ac_eff_sizes,chr_sp_ac_eff_sizes_DIVERSITY,by="group1")


rec_genes_chr_effsizes_join <- merge(chr_sp_ac_eff_sizes,chr_sp_ac_eff_sizes_GENES,by="group1")


rec_repeats_chr_effsizes_join <- merge(chr_sp_ac_eff_sizes,chr_sp_ac_eff_sizes_REPEATS,by="group1")


rec_diversity_chr_effsizes_join$sp_chr_arms <- rec_diversity_chr_effsizes_join$group1


#split column into two
rec_diversity_chr_effsizes_join<- separate(rec_diversity_chr_effsizes_join, sp_chr_arms, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

rec_diversity_chr_effsizes_join<- separate(rec_diversity_chr_effsizes_join, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")

rec_diversity_chr_effsizes_join$chr <- as.factor(rec_diversity_chr_effsizes_join$chr)
rec_diversity_chr_effsizes_join$species <- as.factor(rec_diversity_chr_effsizes_join$species)


rec_genes_chr_effsizes_join$sp_chr_arms <- rec_genes_chr_effsizes_join$group1


rec_genes_chr_effsizes_join<- separate(rec_genes_chr_effsizes_join, sp_chr_arms, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

rec_genes_chr_effsizes_join<- separate(rec_genes_chr_effsizes_join, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")

rec_genes_chr_effsizes_join$chr <- as.factor(rec_genes_chr_effsizes_join$chr)
rec_genes_chr_effsizes_join$species <- as.factor(rec_genes_chr_effsizes_join$species)



rec_repeats_chr_effsizes_join$sp_chr_arms <- rec_repeats_chr_effsizes_join$group1


rec_repeats_chr_effsizes_join<- separate(rec_repeats_chr_effsizes_join, sp_chr_arms, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

rec_repeats_chr_effsizes_join<- separate(rec_repeats_chr_effsizes_join, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")

rec_repeats_chr_effsizes_join$chr <- as.factor(rec_repeats_chr_effsizes_join$chr)
rec_repeats_chr_effsizes_join$species <- as.factor(rec_repeats_chr_effsizes_join$species)


rec_diversity_chr_effsizes_join$species <- factor(rec_diversity_chr_effsizes_join$species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))
rec_genes_chr_effsizes_join$species <- factor(rec_genes_chr_effsizes_join$species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))
rec_repeats_chr_effsizes_join$species <- factor(rec_repeats_chr_effsizes_join$species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))


summary(rec_diversity_chr_effsizes_join$effsize.x)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#-0.4890  0.3305  0.7369  0.5830  0.8807  1.1434

summary(rec_diversity_chr_effsizes_join$effsize.y)

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#-0.0595  0.7066  1.1641  1.1763  1.6440  2.6188

summary(rec_genes_chr_effsizes_join$effsize.y)

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#-1.1204 -0.6696 -0.4643 -0.4336 -0.2500  0.2496

summary(rec_repeats_chr_effsizes_join$effsize.y)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#-0.5047  0.8957  1.4910  1.2744  1.7138  2.7517

#write.table(rec_repeats_chr_effsizes_join,"rec_repeats_chr_effsizes_join.tsv",sep="\t",quote=FALSE,row.names = FALSE)

#figure 6

rec_repeats_chr_effsizes_join <- read.table("rec_repeats_chr_effsizes_join.tsv",sep="\t",header=TRUE)


a <- ggplot(rec_diversity_chr_effsizes_join,aes(x=effsize.x,y=effsize.y)) + geom_hline(yintercept=0, linetype="dashed", color = "black") + geom_vline(xintercept=0, linetype="dashed", color = "black") + geom_point(aes(colour=species,shape=chr),size=2)  + geom_smooth(method="lm",se=FALSE,linewidth=0.25)  + theme_cowplot()  + scale_colour_brewer(palette="Set1") + xlab("Recombination arms-centers\neffect size") + ylab("Diversity arms-centers effect size") + ggtitle("Diversity") +scale_x_continuous(limits=c(-0.5,1.5),breaks=c((seq(-0.5,1.5,by=0.5)))) +scale_y_continuous(limits=c(-1.5,3),breaks=c((seq(-1.5,3,by=0.5)))) + theme(legend.position="none")


b <- ggplot(rec_genes_chr_effsizes_join,aes(x=effsize.x,y=effsize.y)) + geom_hline(yintercept=0, linetype="dashed", color = "black") + geom_vline(xintercept=0, linetype="dashed", color = "black") + geom_point(aes(colour=species,shape=chr),size=2) + geom_smooth(method="lm",se=FALSE,linewidth=0.25)  + theme_cowplot() + scale_colour_brewer(palette="Set1")  + xlab("Recombination arms-centers\neffect size") + ylab("Genes arms-centers effect size") + ggtitle("Genes") +scale_x_continuous(limits=c(-0.5,1.5),breaks=c((seq(-0.5,1.5,by=0.5)))) +scale_y_continuous(limits=c(-1.5,3),breaks=c((seq(-1.5,3,by=0.5)))) + theme(legend.position="none")


c <- ggplot(rec_repeats_chr_effsizes_join,aes(x=effsize.x,y=effsize.y)) + geom_hline(yintercept=0, linetype="dashed", color = "black") + geom_vline(xintercept=0, linetype="dashed", color = "black") + geom_point(aes(colour=species,shape=chr),size=2) + geom_smooth(method="lm",se=FALSE,linewidth=0.25)  + theme_cowplot() + scale_colour_brewer(palette="Set1") + xlab("Recombination arms-centers\neffect size") + ylab("Repeats arms-centers effect size") + ggtitle("Repeats") +scale_x_continuous(limits=c(-0.5,1.5),breaks=c((seq(-0.5,1.5,by=0.5)))) +scale_y_continuous(limits=c(-1.5,3),breaks=c((seq(-1.5,3,by=0.5)))) + theme(legend.position="none")

a+b+c

#linear model stats for figure 6

#diversity

summary(lm(effsize.y ~ effsize.x,data=rec_diversity_chr_effsizes_join))

#Call:
#lm(formula = effsize.y ~ effsize.x, data = rec_diversity_chr_effsizes_join)
#
#Residuals:
#    Min      1Q  Median      3Q     Max
#-1.3695 -0.4501 -0.0209  0.4373  1.2990
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept)   0.8024     0.2107   3.809   0.0007 ***
#effsize.x     0.6415     0.2985   2.149   0.0404 *
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 0.6505 on 28 degrees of freedom
#Multiple R-squared:  0.1416,	Adjusted R-squared:  0.1109
#F-statistic: 4.619 on 1 and 28 DF,  p-value: 0.04041


#genes
summary(lm(effsize.y ~ effsize.x,data=rec_genes_chr_effsizes_join))


#Call:
#lm(formula = effsize.y ~ effsize.x, data = rec_genes_chr_effsizes_join)
#
#Residuals:
#    Min      1Q  Median      3Q     Max
#-0.6763 -0.1601 -0.0366  0.1456  0.7438
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept)  -0.2373     0.1076  -2.204   0.0359 *
#effsize.x    -0.3368     0.1525  -2.208   0.0356 *
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 0.3324 on 28 degrees of freedom
#Multiple R-squared:  0.1483,	Adjusted R-squared:  0.1179
#F-statistic: 4.877 on 1 and 28 DF,  p-value: 0.03557



#repeats
summary(lm(effsize.y ~ effsize.x,data=rec_repeats_chr_effsizes_join))


#Call:
#lm(formula = effsize.y ~ effsize.x, data = rec_repeats_chr_effsizes_join)
#
#Residuals:
#     Min       1Q   Median       3Q      Max
#-1.36435 -0.51389  0.07842  0.48649  1.23871
#
#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)
#(Intercept)   0.6553     0.2330   2.813  0.00887 **
#effsize.x     1.0619     0.3301   3.217  0.00326 **
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 0.7193 on 28 degrees of freedom
#Multiple R-squared:  0.2699,	Adjusted R-squared:  0.2438
#F-statistic: 10.35 on 1 and 28 DF,  p-value: 0.003258



#figure 7


chr_sp_ac_eff_sizes <- as.data.frame(plotbinddf2_one_set_rec %>% cohens_d(rate ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))


chr_sp_ac_eff_sizes<- separate(chr_sp_ac_eff_sizes, group1, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

chr_sp_ac_eff_sizes<- separate(chr_sp_ac_eff_sizes, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")




chr_sp_ac_eff_sizes_DIVERSITY <- as.data.frame(plotbinddf2_one_set_div %>% cohens_d(value ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))


chr_sp_ac_eff_sizes_DIVERSITY<- separate(chr_sp_ac_eff_sizes_DIVERSITY, group1, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

chr_sp_ac_eff_sizes_DIVERSITY<- separate(chr_sp_ac_eff_sizes_DIVERSITY, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")


chr_sp_ac_eff_sizes_GENES <- as.data.frame(plotbinddf2_one_set_gen %>% cohens_d(value ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))

chr_sp_ac_eff_sizes_GENES<- separate(chr_sp_ac_eff_sizes_GENES, group1, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

chr_sp_ac_eff_sizes_GENES<- separate(chr_sp_ac_eff_sizes_GENES, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")

chr_sp_ac_eff_sizes_REPEATS <- as.data.frame(plotbinddf2_one_set_rep %>% cohens_d(value ~ sp_chr_arm_cen, comparisons=the_comparisons,ci=TRUE))

chr_sp_ac_eff_sizes_REPEATS<- separate(chr_sp_ac_eff_sizes_REPEATS, group1, into = c("sp_chr","arms"), sep = " (?=[^ ]+$)")

chr_sp_ac_eff_sizes_REPEATS<- separate(chr_sp_ac_eff_sizes_REPEATS, sp_chr, into = c("species","chr"), sep = " (?=[^ ]+$)")



chr_sp_ac_eff_sizes$feature <- "Recombination"
chr_sp_ac_eff_sizes_DIVERSITY$feature <- "Diversity"
chr_sp_ac_eff_sizes_GENES$feature <- "Genes"
chr_sp_ac_eff_sizes_REPEATS$feature <- "Repeats"

ES_abb_df <- rbind(chr_sp_ac_eff_sizes,chr_sp_ac_eff_sizes_DIVERSITY,chr_sp_ac_eff_sizes_GENES,chr_sp_ac_eff_sizes_REPEATS)

ES_abb_df$species <- as.factor(ES_abb_df$species)

ES_abb_df$species <- factor(ES_abb_df$species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))

#p values from previous wilcoxon rank sum tests (see above) were added manually to make all_chr_eff_size_p_4-29-26.csv

ES_abb_df<- read.table("all_chr_eff_size_p_4-29-26.csv",sep="\t",header=TRUE)

ES_abb_df$species <- as.factor(ES_abb_df$species)

ES_abb_df$chr <- as.factor(ES_abb_df$chr)
ES_abb_df$feature <- as.factor(ES_abb_df$feature)



ES_abb_df$species <- factor(ES_abb_df$species, levels=c("C. briggsae","C. remanei","C. tropicalis","C. elegans", "C. inopinata"))

ES_abb_df$chr <- factor(ES_abb_df$chr, levels=c("I","II","III","IV", "V","X"))

ES_abb_df$feature <- factor(ES_abb_df$feature, levels=c("Recombination","Diversity","Genes","Repeats"))

ES_abb_df$sig <- ifelse(ES_abb_df$wilcoxon_p.adj < 0.05, "Yes","No")


ggplot(ES_abb_df,aes(x=species,y=effsize)) + geom_col(aes(fill=species,colour=sig)) + geom_errorbar(aes(ymin = conf.low, ymax = conf.high)) + geom_hline(yintercept=0,linetype="dashed") + facet_rep_grid(feature~chr)  + theme_cowplot() + theme(strip.background = element_rect(colour="white", fill="white"),axis.text.x=element_blank(),legend.text=element_text(face="italic")) + scale_fill_brewer(palette="Set1") + scale_colour_manual(values=c("black","white")) + xlab("Species") + ylab("Arm-center effect size")
#this is figure 7


#figure 8 and stats related to repeat type

repeats <- read.table("global_repeat_density_10kb_win_with_tropicalis.tsv", sep="\t",header=TRUE)

ggplot(repeats,aes(x=BP,y=num_rep)) + geom_point(alpha=0.5,size=0.5) + geom_smooth() + facet_rep_grid(species~Chr) + theme_cowplot()


allrates <- read.table("allrates_normalized_gen_and_pos.tsv", sep="\t",header=TRUE)

repeat_taxa <- read.table("all_repeat_taxa_density.tsv", sep="\t",header=TRUE)


repeats_no_nigoni <- repeat_taxa[repeat_taxa$species != "nigoni",]



repeats_no_nigoni$Chr <- as.factor(repeats_no_nigoni$Chr)

repbrig <- repeats_no_nigoni[repeats_no_nigoni$species == "briggsae",]
repeleg <- repeats_no_nigoni[repeats_no_nigoni$species == "elegans",]
reprem <- repeats_no_nigoni[repeats_no_nigoni$species == "remanei",]
repinop <- repeats_no_nigoni[repeats_no_nigoni$species == "inopinata",]





bbbb <- NULL

for (i in levels(repbrig$Chr)) {
	chr_df <- repbrig[repbrig$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	bbbb <- rbind(bbbb,chr_df)
}


eeee <- NULL

for (i in levels(repeleg$Chr)) {
	chr_df <- repeleg[repeleg$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	eeee <- rbind(eeee,chr_df)
}


rrrr <- NULL

for (i in levels(reprem$Chr)) {
	chr_df <- reprem[reprem$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	rrrr <- rbind(rrrr,chr_df)
}


iiii <- NULL

for (i in levels(repinop$Chr)) {
	chr_df <- repinop[repinop$Chr == i,]
	chr_df$norm_phys <- chr_df$BP/max(chr_df$BP)
	iiii <- rbind(iiii,chr_df)
}


bbbb$rep_class_rank <- as.factor(paste(bbbb$rep_class, bbbb$taxonomic_rank))



cbtc1 <- bbbb[bbbb$rep_class_rank == "Tc1-Mariner superfamily",]

cbtc1$physbin <- cut(cbtc1$norm_phys,seq(0,1,by=0.01))

cbtc1$chr_physbin <- as.factor(paste(cbtc1$Chr,cbtc1$physbin))

cbtc1_brig_agg <- aggregate(num_bp_rep ~ chr_physbin,FUN=sum,data=cbtc1)


brig_taxa_bins <- NULL

for (i in levels(bbbb$rep_class_rank)) {
	df <- bbbb[bbbb$rep_class_rank == i,]
	df$physbin <- cut(df$norm_phys,seq(0,1,by=0.01))
	df$chr_physbin <- as.factor(paste(df$Chr,df$physbin))
	df_brig_agg <- aggregate(num_bp_rep ~ chr_physbin,FUN=sum,data=df)
	df_brig_agg_ii <- data.frame(chr_physbin=df_brig_agg$chr_physbin,num_rep=df_brig_agg$num_bp_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),rep_class_rank=i,Species="C. briggsae")
	brig_taxa_bins <- rbind(brig_taxa_bins,df_brig_agg_ii)
}

eeee$rep_class_rank <- as.factor(paste(eeee$rep_class, eeee$taxonomic_rank))
rrrr$rep_class_rank <- as.factor(paste(rrrr$rep_class, rrrr$taxonomic_rank))
iiii$rep_class_rank <- as.factor(paste(iiii$rep_class, iiii$taxonomic_rank))

eleg_taxa_bins <- NULL

for (i in levels(eeee$rep_class_rank)) {
	df <- eeee[eeee$rep_class_rank == i,]
	df$physbin <- cut(df$norm_phys,seq(0,1,by=0.01))
	df$chr_physbin <- as.factor(paste(df$Chr,df$physbin))
	df_eleg_agg <- aggregate(num_bp_rep ~ chr_physbin,FUN=sum,data=df)
	df_eleg_agg_ii <- data.frame(chr_physbin=df_eleg_agg$chr_physbin,num_rep=df_eleg_agg$num_bp_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),rep_class_rank=i,Species="C. elegans")
	eleg_taxa_bins <- rbind(eleg_taxa_bins,df_eleg_agg_ii)
}

rema_taxa_bins <- NULL



for (i in levels(rrrr$rep_class_rank)) {
	df <- rrrr[rrrr$rep_class_rank == i,]
	df$physbin <- cut(df$norm_phys,seq(0,1,by=0.01))
	df$chr_physbin <- as.factor(paste(df$Chr,df$physbin))
	df_rema_agg <- aggregate(num_bp_rep ~ chr_physbin,FUN=sum,data=df)
	df_rema_agg_ii <- data.frame(chr_physbin=df_rema_agg$chr_physbin,num_rep=df_rema_agg$num_bp_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),rep_class_rank=i,Species="C. remanei")
	rema_taxa_bins <- rbind(rema_taxa_bins,df_rema_agg_ii)
}


inop_taxa_bins <- NULL



for (i in levels(iiii$rep_class_rank)) {
	df <- iiii[iiii$rep_class_rank == i,]
	df$physbin <- cut(df$norm_phys,seq(0,1,by=0.01))
	df$chr_physbin <- as.factor(paste(df$Chr,df$physbin))
	df_inop_agg <- aggregate(num_bp_rep ~ chr_physbin,FUN=sum,data=df)
	df_inop_agg_ii <- data.frame(chr_physbin=df_inop_agg$chr_physbin,num_rep=df_inop_agg$num_bp_rep,Chr=c(rep("I",100),rep("II",100),rep("III",100),rep("IV",100),rep("V",100),rep("X",100)),physbinnum=c(1:100,1:100,1:100,1:100,1:100,1:100),rep_class_rank=i,Species="C. inopinata")
	inop_taxa_bins <- rbind(inop_taxa_bins,df_inop_agg_ii)
}

recratebrig <- allrates[allrates$Species == "C. briggsae",]
recrateeleg <- allrates[allrates$Species == "C. elegans",]
recraterema <- allrates[allrates$Species == "C. remanei",]
recrateinop <- allrates[allrates$Species == "C. inopinata",]

brigmerge <- merge(recratebrig,brig_taxa_bins,by="chr_physbin")
elegmerge <- merge(recrateeleg,eleg_taxa_bins,by="chr_physbin")
remamerge <- merge(recraterema,rema_taxa_bins,by="chr_physbin")
inopmerge <- merge(recrateinop,inop_taxa_bins,by="chr_physbin")


allmerge <- rbind(brigmerge,elegmerge,remamerge,inopmerge)



allmerge2 <- data.frame(chr_physbin=allmerge$chr_physbin,Chr=allmerge$Chr.x,Species=allmerge$Species.x,physbin=allmerge$physbin,rate=allmerge$rate,physbinnum=allmerge$physbinnum.x,rep_class_rank=allmerge$rep_class_rank,num_rep=allmerge$num_rep)


#split some columns
library(tidyr)

#split column into two
allmerge2<- separate(allmerge2, rep_class_rank, into = c("rep_class","taxonomic_rank"), sep = " (?=[^ ]+$)")



write.table(allmerge2,"repeat_taxa_rec_rates.tsv",quote=FALSE,sep="\t")


#okay.... now, linear models

allmerge2 <- read.table("repeat_taxa_rec_rates.tsv",sep="\t",header=T)

allmerge2$sp_type_rank <- paste(allmerge2$Species,allmerge2$rep_class,allmerge2$taxonomic_rank)

#exclude X for this one

allmerge2_no_X <- allmerge2[allmerge2$Chr != 'X',]

allmerge2_no_X$sp_type_rank <- as.factor(allmerge2_no_X$sp_type_rank)

rep_taxa_lmdf <- NULL

for (i in levels(allmerge2_no_X$sp_type_rank)) {
	df <- allmerge2_no_X[allmerge2_no_X$sp_type_rank == i,]
	damod <- summary(lm(num_rep ~ rate,data=df))
	if (sum(df$num_rep) > 0){df_to_bind <- data.frame(sp_type_rank=i,slope=damod$coefficients[2,1],slope_se=damod$coefficients[2,2],intercept=damod$coefficients[1,1],intercept_se=damod$coefficients[1,2],fstat=damod$fstatistic[1],numdf=damod$fstatistic[2],dendf=damod$fstatistic[3],adj.r.squared=damod$adj.r.squared,r.squared=damod$r.squared,p=damod$coefficients[2,4])
	rep_taxa_lmdf <- rbind(rep_taxa_lmdf,df_to_bind)
}}


rep_taxa_lmdf<- separate(rep_taxa_lmdf, sp_type_rank, into = c("sp_type","taxonomic_rank"), sep = " (?=[^ ]+$)")


rep_taxa_lmdf<- separate(rep_taxa_lmdf, sp_type, into = c("species","repeat_type"), sep = " (?=[^ ]+$)")

rep_taxa_lmdf$p.adj <- p.adjust(rep_taxa_lmdf$p,method="BH")



write.table(rep_taxa_lmdf,"repeat_taxa_rec_rep_lm_stats.tsv",quote=FALSE,sep="\t",row.names = FALSE)

rep_taxa_lmdf <- read.table("repeat_taxa_rec_rep_lm_stats.tsv",sep="\t",header=T)

#working on stats for the paper...

length(unique(rep_taxa_lmdf[rep_taxa_lmdf$taxonomic_rank =="superfamily",]$repeat_type))

rep_taxa_lmdf_sig <- rep_taxa_lmdf[rep_taxa_lmdf$p.adj < 0.05,]

rep_taxa_lmdf_super <- rep_taxa_lmdf[rep_taxa_lmdf$taxonomic_rank =="superfamily",]

unique(rep_taxa_lmdf_super$repeat_type)

rep_taxa_lmdf_super$repeat_type <- factor(rep_taxa_lmdf_super$repeat_type, levels = c("Tc1-Mariner","Sola","PiggyBac","PIF-Harbinger","P","Mutator","Merlin","Kolobok","hAT","Dada","CACTA","Maverick","Helitron","Crypton","tRNA","Penelope","Gypsy","ERV","Copia","Bel-Pao","RTE","R2","L1","Jockey","I","DIRS"))

rep_taxa_lmdf_super$species <- factor(rep_taxa_lmdf_super$species, levels=c("C. briggsae","C. remanei","C. elegans","C. inopinata"))

summary(rep_taxa_lmdf_super$slope)



rep_taxa_lmdf_super_sig <- rep_taxa_lmdf_super[rep_taxa_lmdf_super$p.adj < 0.05,]


rep_taxa_lmdf_super_sig$sp_type <- paste(rep_taxa_lmdf_super_sig$species,rep_taxa_lmdf_super_sig$repeat_type)

unique(rep_taxa_lmdf_super_sig$repeat_type)

length(unique(rep_taxa_lmdf_super_sig$repeat_type))

reptaxonomy <- read.table("repeat_taxonomy.tsv",sep="\t",header=TRUE)

#write.table(rep_taxa_lmdf_super_sig,"rep_taxa_lmdf_super_sig_4-29-26.tsv",quote=FALSE,row.names = FALSE,sep="\t")

rep_taxa_lmdf_super_sig <- read.table("rep_taxa_lmdf_super_sig_4-29-26.tsv",sep="\t",header=TRUE)

rep_taxa_lmdf_super_sig$Order_Class <- as.factor(rep_taxa_lmdf_super_sig$Order_Class)

rep_taxa_lmdf_super_sig$Order_Class <- factor(rep_taxa_lmdf_super_sig$Order_Class, levels = c("DIRS (I)", "LINE (I)", "SINE (I)","LTR (I)","Crypton (II)", "TIR (II)", "Helitron (II)"))

ordclacolors <- c("#fff799","#FFEA4D","#ffdd00","#ffc20e","#8dc63f","#bbd976","#c5c481")

a <- ggplot(rep_taxa_lmdf_super_sig, aes(x = slope, y = reorder(sp_type,-slope))) + geom_col(aes(fill=Order_Class)) + theme_cowplot() + scale_fill_manual(values=ordclacolors) + xlab("Slope (repeat density/recombination rate)") + ylab("Species, repeat type")


#C. briggsae ERV
#C. remanei Crypton
#C. elegans Helitron

allmerge2_brig <- allmerge2_no_X[allmerge2_no_X$Species == "C. briggsae",]
allmerge2_brig_ERV <- allmerge2_brig[allmerge2_brig$rep_class == "ERV",]


b <- ggplot(allmerge2_brig_ERV, aes(x = rate, y = num_rep)) + geom_point(alpha=0.45,colour="#ffc20e") + geom_smooth(method="lm",se=FALSE,linewidth=0.5) + theme_cowplot() + ylim(0,500) + xlab("Normalized recombination rate") + ylab("Repeat density (bp)") + theme(axis.title.x=element_blank())



allmerge2_rem <- allmerge2_no_X[allmerge2_no_X$Species == "C. remanei",]
allmerge2_rem_Crypton <- allmerge2_rem[allmerge2_rem$rep_class == "Crypton",]

c <- ggplot(allmerge2_rem_Crypton, aes(x = rate, y = num_rep)) + geom_point(alpha=0.25,colour="#8dc63f") + geom_smooth(method="lm",se=FALSE,linewidth=0.5) + theme_cowplot() + xlab("Normalized recombination rate") + ylab("Repeat density (bp)") + theme(axis.title.y=element_blank())




allmerge2_elg <- allmerge2_no_X[allmerge2_no_X$Species == "C. elegans",]
allmerge2_elg_Helitron <- allmerge2_elg[allmerge2_elg$rep_class == "Helitron",]

d <- ggplot(allmerge2_elg_Helitron, aes(x = rate, y = num_rep)) + geom_point(alpha=0.25,colour="#c5c481") + geom_smooth(method="lm",se=FALSE,linewidth=0.5) + theme_cowplot() + xlab("Normalized recombination rate") + ylab("Repeat density (bp)") + theme(axis.title.x=element_blank(),axis.title.y=element_blank())

library(patchwork)

e <- b+c+d

a/e + plot_layout(heights = c(1.5, 1))

#this is figure 6