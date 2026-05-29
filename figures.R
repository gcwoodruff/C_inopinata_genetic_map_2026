#load libraries
library(ggplot2)
library(ggforce)
library(ggstats)
library(cowplot)
library(lemon)
library(patchwork)


#figure 1a

dat <- read.csv("kent_et_al_data.csv",header=TRUE,stringsAsFactors = TRUE)

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



allrates <- read.table("allrates_normalized_gen_and_pos.tsv",sep="\t",header=T)

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

plotbinddf<- read.table("GENES_DIVERSITY_REPEATS_RECOMBINATION_scatterplot_df_6-11-24_edit.csv",sep="\t",header=TRUE)



plotbinddf$category <- as.factor(plotbinddf$category)

plotbinddf$category <- factor(plotbinddf$category, levels=c("diversity", "genes","repeats"))


plotbinddf$category <- as.factor(plotbinddf$category)

plotbinddf$category <- factor(plotbinddf$category, levels=c("diversity", "genes","repeats"))



plotbinddf_no_x <- plotbinddf[plotbinddf$Chr != "X",]

ggplot(plotbinddf_no_x,aes(x=rate,y=value)) + geom_point(aes(colour=category),alpha=1,size=1) + geom_smooth(aes(colour=category,fill=category),method="lm") + facet_rep_grid(category~Species,scales = "free") + theme_cowplot(font_size=23) +scale_colour_manual(values=c("#D95F02","#7570B3","#E6AB02")) +xlim(0,7) + scale_fill_manual(values=c("#D95F02","#7570B3","#E6AB02")) + theme(strip.background = element_rect(colour="white", fill="white"), legend.position="none")
#that's figure 4

#figure 5


coef_df <- read.table("rec_rate_genomic_feature_linear_model_stats_BY_CHROMOSOME_11-11-25.tsv",sep="\t",header=T)


coef_df$sig.adj <- coef_df$p.adj < 0.05

sig_df <- data.frame(sp_chr_cat=coef_df$sp_chr_cat,sig=coef_df$sig,sig.adj=coef_df$sig.adj)


plotdfmerge <- merge(plotbinddf2,sig_df)


ggplot(plotdfmerge,aes(x=rate,y=value)) + geom_point(aes(colour=Chr),alpha=0.25,size=0.25) + geom_smooth(aes(colour=Chr,linetype=sig.adj),method="lm",se=FALSE) + facet_rep_grid(category~Species,scales = "free") + theme_cowplot()  +xlim(0,7) + scale_colour_manual(values=c("#1b9e77","#d95f02","#7570b3","#e7298a","#66a61e","#e6ab02")) + scale_linetype_manual(values=c(3,1)) + theme(strip.background = element_rect(colour="white", fill="white"))	
	#this is figure 5

	


#figure 6

rec_repeats_chr_effsizes_join <- read.table("rec_repeats_chr_effsizes_join.tsv",sep="\t",header=TRUE)


a <- ggplot(rec_diversity_chr_effsizes_join,aes(x=effsize.x,y=effsize.y)) + geom_hline(yintercept=0, linetype="dashed", color = "black") + geom_vline(xintercept=0, linetype="dashed", color = "black") + geom_point(aes(colour=species,shape=chr),size=2)  + geom_smooth(method="lm",se=FALSE,linewidth=0.25)  + theme_cowplot()  + scale_colour_brewer(palette="Set1") + xlab("Recombination arms-centers\neffect size") + ylab("Diversity arms-centers effect size") + ggtitle("Diversity") +scale_x_continuous(limits=c(-0.5,1.5),breaks=c((seq(-0.5,1.5,by=0.5)))) +scale_y_continuous(limits=c(-1.5,3),breaks=c((seq(-1.5,3,by=0.5)))) + theme(legend.position="none")


b <- ggplot(rec_genes_chr_effsizes_join,aes(x=effsize.x,y=effsize.y)) + geom_hline(yintercept=0, linetype="dashed", color = "black") + geom_vline(xintercept=0, linetype="dashed", color = "black") + geom_point(aes(colour=species,shape=chr),size=2) + geom_smooth(method="lm",se=FALSE,linewidth=0.25)  + theme_cowplot() + scale_colour_brewer(palette="Set1")  + xlab("Recombination arms-centers\neffect size") + ylab("Genes arms-centers effect size") + ggtitle("Genes") +scale_x_continuous(limits=c(-0.5,1.5),breaks=c((seq(-0.5,1.5,by=0.5)))) +scale_y_continuous(limits=c(-1.5,3),breaks=c((seq(-1.5,3,by=0.5)))) + theme(legend.position="none")


c <- ggplot(rec_repeats_chr_effsizes_join,aes(x=effsize.x,y=effsize.y)) + geom_hline(yintercept=0, linetype="dashed", color = "black") + geom_vline(xintercept=0, linetype="dashed", color = "black") + geom_point(aes(colour=species,shape=chr),size=2) + geom_smooth(method="lm",se=FALSE,linewidth=0.25)  + theme_cowplot() + scale_colour_brewer(palette="Set1") + xlab("Recombination arms-centers\neffect size") + ylab("Repeats arms-centers effect size") + ggtitle("Repeats") +scale_x_continuous(limits=c(-0.5,1.5),breaks=c((seq(-0.5,1.5,by=0.5)))) +scale_y_continuous(limits=c(-1.5,3),breaks=c((seq(-1.5,3,by=0.5)))) + theme(legend.position="none")

a+b+c



#figure 7


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

#figure 8


allmerge2 <- read.table("repeat_taxa_rec_rates.tsv",sep="\t",header=T)

allmerge2$sp_type_rank <- paste(allmerge2$Species,allmerge2$rep_class,allmerge2$taxonomic_rank)

#exclude X for this one

allmerge2_no_X <- allmerge2[allmerge2$Chr != 'X',]

allmerge2_no_X$sp_type_rank <- as.factor(allmerge2_no_X$sp_type_rank)


reptaxonomy <- read.table("repeat_taxonomy.tsv",sep="\t",header=TRUE)

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

e <- b+c+d

a/e + plot_layout(heights = c(1.5, 1))

#this is figure 8
