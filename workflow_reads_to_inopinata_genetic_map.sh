#workflow for the C. inopinata genetic map paper

#make a directory for the project 
cd /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/

mkdir inopinata_genetic_map_1-2024

cd inopinata_genetic_map_1-2024

#make directory for reads and navigate to it
mkdir 00_raw_seq_data

cd 00_raw_seq_data
#get the reads
wget -r -c -nH --cut-dirs=1 --no-parent --reject "index.html*" https://gc3fstorage.uoregon.edu/HWWV3DSX7/7458/

#set a working directory
wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

#run fastqc
#make directory for fastqc
mkdir $wkdir/01_FastQC/

#test one file, then do batch...

cd $wkdir/00_raw_seq_data/7458/

fastqc -o $wkdir/01_FastQC/ F1A-1_S162_L001_R1_001.fastq.gz
#cool it works, did this for all files
	#in slurm_scripts ; 01_FastQC_commands.sh


#do multiqc
cd $wkdir/01_FastQC

multiqc .

#make bwa genome index

#get genome
#make directory
mkdir $wkdir/inopinata_genome
#navigate to directory
cd $wkdir/inopinata_genome

#download genomes

wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS18/species/caenorhabditis_inopinata/PRJDB5687/caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa.gz
#unzip
gunzip caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa.gz

#load BWA module on HPC
#module load BWA/0.7.13-intel-2016a

#index the reference genome
cd $wkdir/inopinata_genome
bwa index -p inopinata_sm_genome caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa 
#get ready to map reads to genome
mkdir $wkdir/02_bwa/
cd $wkdir/00_raw_seq_data/7458/

#test one sample: align the reads with bwa

cd $wkdir/00_raw_seq_data/
#unzip to test
gunzip F1A-1_S162_L001_R1_001.fastq.gz
gunzip F1A-1_S162_L001_R2_001.fastq.gz

#align to reference with bwa
 bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F1A-1_S162_L001_R1_001.fastq F1A-1_S162_L001_R2_001.fastq > $wkdir/02_bwa/F1A-1.sam 
#rezip
gzip F1A-1_S162_L001_R1_001.fastq
gzip F1A-1_S162_L001_R2_001.fastq

#i did this did this for all the samples (unzip fastq, align with bwa, re-compress):
	#files in slurm_scripts/02_concatenated_bwa_slurm_scripts.sh


#get the number of unmapped reads

#load samtools module on HPC
#module load SAMtools/1.11-GCC-10.2.0

mkdir $wkdir/03_samtools_count_unmapped/

cd $wkdir/02_bwa/
#count number of unmapped reads with samtools
samtools view -f 4 F1A-1.sam -c  > $wkdir/03_samtools_count_unmapped/F1A-1.txt
#do it for all of them
for i in *; do samtools view -f 4 $i -c > $wkdir/03_samtools_count_unmapped/${i%.sam}.txt; done 

#also run samtools flagstat for all bam files to get alignment stats
mkdir $wkdir/04_samtools_flagstat/

cd $wkdir/02_bwa/

for i in *; do samtools flagstat $i > $wkdir/04_samtools_flagstat/${i%.sam}.samtools.flagstat; done 

#to print all the unmapped read counts
cd $wkdir/03_samtools_count_unmapped/

for i in *txt; do awk '{print FILENAME,$0}' $i; done

#okay, convert sam to bam

# working directory variable
wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

#load module
module load SAMtools/1.11-GCC-10.2.0
#convert sam to bam
mkdir $wkdir/05_samtools_view_bam/

cd $wkdir/02_bwa/

#testing one

samtools view -bS F1A-1.sam > $wkdir/05_samtools_view_bam/F1A-1.bam 
	#great it works

#do it for all bam files
for i in *; do samtools view -bS $i > ${i%.sam}.bam; done

	#did these in parallel as separate slurm jobs for each file


#ok, sort bam tiles

mkdir $wkdir/06_samtools_sort/

#testing one
cd $wkdir/05_samtools_view_bam/

mkdir $wkdir/SORT_TEMP/
	#made a sort tmp directory for every bam file

cd $wkdir/05_samtools_view_bam/

samtools sort -T $wkdir/SORT_TEMP/F1A-1_tmp/ -o $wkdir/06_samtools_sort/F1A-1.bam F1A-1.bam
	#did that for all bam files
	#commands in slurm_scripts/05_samtools_view_bam_commands.sh

for i in *; do samtools sort -T $wkdir/SORT_TEMP/$i/ -o $wkdir/06_samtools_sort/$i $i; done &

#many samples were apparently split in two. that is, they had two barcodes. here, combining those bam files.

cd $wkdir/06_samtools_sort/

samtools merge F2A-32.bam F2A-32-AGGAGGCCTA-AATTGACCAC.bam F2A-32-GAGTACGCAG-TTGCCATCAG.bam
samtools merge F2A-33.bam F2A-33-ATGTCGAGTT-CTTCAACCAC.bam F2A-33-GTAATTCCTC-GACACTGCCA.bam
samtools merge F2A-3.bam F2A-3-CACAACGATA-TGCGGACACA.bam F2A-3-TACGAAGCTA-ACCTCAACGT.bam
samtools merge F2A-55.bam F2A-55-AATAGGTGCT-TGCCTATCGC.bam F2A-55-GCTATCATCG-ATCACGGCTA.bam
samtools merge F2A-60.bam F2A-60-CATGAACCGG-CAAGACGTCT.bam F2A-60-CTCACTTGTT-ATGCGTAACT.bam
samtools merge F2A-64.bam F2A-64-AGGTTATGTC-CTGTTAGGAT.bam F2A-64-TAAGTAAGGC-GTTAAGGTGC.bam
samtools merge F2A-72.bam F2A-72-CTTCTGGAGG-ATTGGAACAC.bam F2A-72-GTGTACGTCG-AGGTCGATAA.bam
samtools merge F2A-73.bam F2A-73-ACCTCATTGA-TCTTGTACGT.bam F2A-73-AGTCCTAGGC-AGCCGTTCTC.bam
samtools merge F2A-76.bam F2A-76-AGTCAACCAT-GCTTGTGCCA.bam F2A-76-GCATCATTGC-CTCAACGGAG.bam
samtools merge F2A-77.bam F2A-77-GCAATGGATT-AACCATCGGA.bam F2A-77-GCCATATCCA-ATACGCGCCA.bam
samtools merge F2A-78.bam F2A-78-AGCACGCAAC-AACGATGAGG.bam F2A-78-AGTTGGTTGT-ACCATCTTGT.bam
samtools merge F2A-7.bam F2A-7-TCAGCGATAA-CCAATCCTAA.bam F2A-7-TCATTCCGAA-ACTACCTTAC.bam
samtools merge F2B-15.bam F2B-15-CCATCTTCCG-CCTGTCACCA.bam F2B-15-CCGTAGATTA-TAAGTGCCAG.bam
samtools merge F2B-17.bam F2B-17-CTTCGTTCCG-AGGCGATGGT.bam F2B-17-TCCGTGTATT-ATTAACCAGC.bam
samtools merge F2B-21.bam F2B-21-CTTATCGAAC-GCCAGATACG.bam F2B-21-GATGAGGCAG-CCTGCCATAG.bam


#index bam files

cd $wkdir/06_samtools_sort/

for i in *; do samtools index $i; done
	#did this in parallel for all files

########
#PARENTS
########
#just the single worms for this mapping experiment for now. we can include reads from other runs later on if we think we need them.

#make some directories
mkdir $wkdir/07_parents

mkdir $wkdir/07_parents/00_merge_bam

#merge the parents
cd $wkdir/06_samtools_sort/

samtools merge $wkdir/07_parents/00_merge_bam/NKZ35.bam NKZ35-5.bam NKZ35-6.bam NKZ35-7.bam

samtools merge $wkdir/07_parents/00_merge_bam/WOU9.bam WOU9-2.bam WOU9-3.bam WOU9-5.bam

#get uniquely mapping reads

mkdir $wkdir/07_parents/01_get_uniq_alignments/

cd $wkdir/07_parents/00_merge_bam

samtools view -h NKZ35.bam | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b > $wkdir/07_parents/01_get_uniq_alignments/NKZ35.bam


samtools view -h WOU9.bam | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b > $wkdir/07_parents/01_get_uniq_alignments/WOU9.bam

#okay, genotype

module load BCFtools/1.11-GCC-10.2.0

mkdir $wkdir/07_parents/02_bcftools_mpileup_call/

cd $wkdir/07_parents/01_get_uniq_alignments/


bcftools mpileup -Ou -f $wkdir/inopinata_genome/caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa NKZ35.bam | bcftools call -c -Ob -o  $wkdir/07_parents/02_bcftools_mpileup_call/NKZ35.bcf

bcftools mpileup -Ou -f $wkdir/inopinata_genome/caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa WOU9.bam | bcftools call -c -Ob -o  $wkdir/07_parents/02_bcftools_mpileup_call/WOU9.bcf

#coverage filter


mkdir $wkdir/07_parents/03_bcftools_view_depth_10/

cd $wkdir/07_parents/02_bcftools_mpileup_call/


bcftools view -i 'DP>=10' NKZ35.bcf > $wkdir/07_parents/03_bcftools_view_depth_10/NKZ35.vcf &

bcftools view -i 'DP>=10' WOU9.bcf > $wkdir/07_parents/03_bcftools_view_depth_10/WOU9.vcf &

#did grep -v '#' | wc -l
#102,846,183 for NKZ35
#95,531,434 for WOU9
#... hoping we'll have enough markers, wow.


mkdir $wkdir/07_parents/04_bcftools_view_bcf/

cd $wkdir/07_parents/03_bcftools_view_depth_10/

bcftools view NKZ35.vcf -O b > $wkdir/07_parents/04_bcftools_view_bcf/NKZ35.bcf
bcftools view WOU9.vcf -O b > $wkdir/07_parents/04_bcftools_view_bcf/WOU9.bcf


mkdir $wkdir/07_parents/05_bcftools_merge/

cd $wkdir/07_parents/04_bcftools_view_bcf/


bcftools index NKZ35.bcf
bcftools index WOU9.bcf

bcftools merge --info-rules DP:join,MQ0F:join,AF1:join,AC1:join,DP4:join,MQ:join,FQ:join -m snps NKZ35.bcf WOU9.bcf -o $wkdir/07_parents/05_bcftools_merge/parents.vcf &


#get biallelic snps with at least one copy per allele

mkdir $wkdir/07_parents/06_bcftools_view_biallelic_snps_maf/

cd $wkdir/07_parents/05_bcftools_merge/

bcftools view -m2 -M2 -v snps parents.vcf > $wkdir/07_parents/06_bcftools_view_biallelic_snps_maf/parents_biallelic.vcf & 
#grep -v '#' parents_biallelic.vcf | wc -l
#2359516
#okay, trying to get fixed differences between the lines?

mkdir $wkdir/07_parents/07_get_fixed_differences/
mkdir $wkdir/07_parents/07_get_fixed_differences/00_awk

cd $wkdir/07_parents/06_bcftools_view_biallelic_snps_maf/

grep -v '#' parents_biallelic.vcf | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1,$2,$10,$11}' > $wkdir/07_parents/07_get_fixed_differences/00_awk/parents_biallelic.vcf


mkdir $wkdir/07_parents/07_get_fixed_differences/01_awk

cd $wkdir/07_parents/07_get_fixed_differences/00_awk

awk 'BEGIN {FS="\t"} {OFS="\t"} {print $3}' parents_biallelic.vcf > $wkdir/07_parents/07_get_fixed_differences/01_awk/NKZ35

awk 'BEGIN {FS="\t"} {OFS="\t"} {print $4}' parents_biallelic.vcf > $wkdir/07_parents/07_get_fixed_differences/01_awk/WOU9

awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1}' parents_biallelic.vcf > $wkdir/07_parents/07_get_fixed_differences/01_awk/CHROM

awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2}' parents_biallelic.vcf > $wkdir/07_parents/07_get_fixed_differences/01_awk/POS

cd $wkdir/07_parents/07_get_fixed_differences/01_awk/

sed -i -e 's/:.*//' NKZ35

sed -i -e 's/:.*//' WOU9

paste CHROM POS NKZ35 WOU9 > all.txt
awk 'BEGIN {FS="\t"} $3 == "0/0" && $4 == "1/1" {print} '  all.txt > alt_hom_1.txt


awk 'BEGIN {FS="\t"} $3 == "1/1" && $4 == "0/0" {print} '  all.txt > alt_hom_2.txt

cat alt_hom_1.txt alt_hom_2.txt > all_alt_hom.txt

#sort -k1,1 -k2,2n  > inopinata_24_autosomes.vcf

mkdir $wkdir/07_parents/07_get_fixed_differences/02_awk
cd $wkdir/07_parents/07_get_fixed_differences/02_awk

awk '{print > $1}' $wkdir/07_parents/07_get_fixed_differences/01_awk/all_alt_hom.txt


mkdir $wkdir/07_parents/07_get_fixed_differences/03_sort/

for i in *; do sort -k1,1 -k2,2n $i  > $wkdir/07_parents/07_get_fixed_differences/03_sort/$i; done

##contig=<ID=Sp34_Chr5,length=23638155>
##contig=<ID=Sp34_Chr4,length=21017644>
##contig=<ID=Sp34_Chr1,length=20594552>
##contig=<ID=Sp34_Chr2,length=20116996>
##contig=<ID=Sp34_Chr3,length=19436473>
##contig=<ID=Sp34_ChrX,length=18190508>

cd $wkdir/07_parents/07_get_fixed_differences/03_sort/

cat Sp34_Chr5 Sp34_Chr4 Sp34_Chr1 Sp34_Chr2 Sp34_Chr3 Sp34_ChrX > all_alt_hom_sort.txt

wc -l all_alt_hom_sort.txt
#49821 all_alt_hom_sort.txt

#turn this into a bed file
awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1,$2-1,$2}' all_alt_hom_sort.txt > all_alt_hom_sort.bed

#next, removing repetitive regions... let's remove those


wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/inopinata_genome
#get hard masked
wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS18/species/caenorhabditis_inopinata/PRJDB5687/caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_masked.fa.gz
gunzip caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_masked.fa.gz

#used this: https://www.danielecook.com/generate-a-bedfile-of-masked-ranges-a-fasta-file/ ; thanks daniel e. cook
python generate_masked_ranges.py caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_masked.fa > inopinata_masked.bed
#load bedtools
module load BEDTools/2.27.1-foss-2018b
#get the unmasked regions
bedtools complement -i inopinata_masked.bed -g inopinata_bedtools.genome > inopinata_unmasked.bed


#okay, for parents vcf, remove biallelic snps in masked regions

mkdir $wkdir/07_parents/08_filter_masked_regions/

cd $wkdir/07_parents/06_bcftools_view_biallelic_snps_maf/

intersectBed -a parents_biallelic.vcf -b $wkdir/inopinata_genome/inopinata_unmasked.bed -header > $wkdir/07_parents/08_filter_masked_regions/parents_biallelic_unmasked.vcf
#looked at it, seems like it worked, ok, let's just get those with fixed differences as well.

mkdir $wkdir/07_parents/09_filter_fixed_hom_alleles/

cd $wkdir/07_parents/08_filter_masked_regions/

intersectBed -a parents_biallelic_unmasked.vcf -b $wkdir/07_parents/07_get_fixed_differences/03_sort/all_alt_hom_sort.bed -header > $wkdir/07_parents/09_filter_fixed_hom_alleles/parents_filtered.vcf

cd $wkdir/07_parents/09_filter_fixed_hom_alleles/
grep -v "#" parents_filtered.vcf | wc -l
#41442
#alright

grep -v "#" parents_filtered.vcf | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1,$2-1,$2}' > parents_filtered.bed



###prepare parents and in silico/synthetic F1 (made by generating files whose reads are half from NKZ25 parents and half from WOU9 parents) files. The synthetic F1 is needed because the F1's we sequenced were not the literal parents of the F2 progeny.

mkdir $wkdir/19_March_2024_fork
mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/
mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/00_samtools_split_chr

#module load SAMtools/1.11-GCC-10.2.0
#split by chromosome

cd $wkdir/07_parents/00_merge_bam/

samtools index NKZ35.bam 
samtools index WOU9.bam WOU9.bam.bai

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/00_samtools_split_chr

samtools view -b $wkdir/07_parents/00_merge_bam/NKZ35.bam Sp34_Chr1 > NKZ35_Sp34_Chr1.bam
samtools view -b $wkdir/07_parents/00_merge_bam/NKZ35.bam Sp34_Chr2 > NKZ35_Sp34_Chr2.bam
samtools view -b $wkdir/07_parents/00_merge_bam/NKZ35.bam Sp34_Chr3 > NKZ35_Sp34_Chr3.bam
samtools view -b $wkdir/07_parents/00_merge_bam/NKZ35.bam Sp34_Chr4 > NKZ35_Sp34_Chr4.bam
samtools view -b $wkdir/07_parents/00_merge_bam/NKZ35.bam Sp34_Chr5 > NKZ35_Sp34_Chr5.bam
samtools view -b $wkdir/07_parents/00_merge_bam/NKZ35.bam Sp34_ChrX > NKZ35_Sp34_ChrX.bam


samtools view -b $wkdir/07_parents/00_merge_bam/WOU9.bam Sp34_Chr1 > WOU9_Sp34_Chr1.bam
samtools view -b $wkdir/07_parents/00_merge_bam/WOU9.bam Sp34_Chr2 > WOU9_Sp34_Chr2.bam
samtools view -b $wkdir/07_parents/00_merge_bam/WOU9.bam Sp34_Chr3 > WOU9_Sp34_Chr3.bam
samtools view -b $wkdir/07_parents/00_merge_bam/WOU9.bam Sp34_Chr4 > WOU9_Sp34_Chr4.bam
samtools view -b $wkdir/07_parents/00_merge_bam/WOU9.bam Sp34_Chr5 > WOU9_Sp34_Chr5.bam
samtools view -b $wkdir/07_parents/00_merge_bam/WOU9.bam Sp34_ChrX > WOU9_Sp34_ChrX.bam

#get only mapped reads...

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/00_samtools_split_chr

mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/01_samtools_view_mapped/


for i in *; do samtools view -b -F 4 $i > $wkdir/19_March_2024_fork/00_prepare_P0_F1/01_samtools_view_mapped/$i; done





#get number of reads in each bam file

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'
#module load SAMtools/1.11-GCC-10.2.0

mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/02_samtools_flagstat


cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/01_samtools_view_mapped

for i in *; do samtools flagstat $i > $wkdir/19_March_2024_fork/00_prepare_P0_F1/02_samtools_flagstat/$i; done &

#number of reads per chr

#	NKZ35	WOU9
#1	13269735	10300712
#2	13738533	10735986
#3	12790203	10159699
#4	13648484	11010483
#5	16741098	14517187
#X	18313939	21830741



#subsample reads...

mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads
mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/01_samtools_view_mapped

samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_Chr1.sam NKZ35_Sp34_Chr1.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_Chr2.sam NKZ35_Sp34_Chr2.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_Chr3.sam NKZ35_Sp34_Chr3.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_Chr4.sam NKZ35_Sp34_Chr4.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_Chr5.sam NKZ35_Sp34_Chr5.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_ChrX.sam WOU9_Sp34_ChrX.bam



mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/

grep -v '@' NKZ35_Sp34_Chr1.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr1_noheader.sam
grep -v '@' NKZ35_Sp34_Chr2.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr2_noheader.sam
grep -v '@' NKZ35_Sp34_Chr3.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr3_noheader.sam
grep -v '@' NKZ35_Sp34_Chr4.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr4_noheader.sam
grep -v '@' NKZ35_Sp34_Chr5.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr5_noheader.sam
grep -v '@' WOU9_Sp34_ChrX.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_ChrX_noheader.sam
grep '@' NKZ35_Sp34_Chr1.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr1_header
grep '@' NKZ35_Sp34_Chr2.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr2_header
grep '@' NKZ35_Sp34_Chr3.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr3_header
grep '@' NKZ35_Sp34_Chr4.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr4_header
grep '@' NKZ35_Sp34_Chr5.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr5_header
grep '@' WOU9_Sp34_ChrX.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_ChrX_header

#get random number of reads to make them comparable among parents

mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/

shuf NKZ35_Sp34_Chr1_noheader.sam -n 10300712 > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr1_noheader.sam
shuf NKZ35_Sp34_Chr2_noheader.sam -n 10735986 > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr2_noheader.sam
shuf NKZ35_Sp34_Chr3_noheader.sam -n 10159699 > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr3_noheader.sam
shuf NKZ35_Sp34_Chr4_noheader.sam -n 11010483 > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr4_noheader.sam
shuf NKZ35_Sp34_Chr5_noheader.sam -n 14517187 > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr5_noheader.sam
shuf WOU9_Sp34_ChrX_noheader.sam -n 18313939 > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/WOU9_Sp34_ChrX_noheader.sam

#the rest of the chromosomes


cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/01_samtools_view_mapped

samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr1.sam WOU9_Sp34_Chr1.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr2.sam WOU9_Sp34_Chr2.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr3.sam WOU9_Sp34_Chr3.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr4.sam WOU9_Sp34_Chr4.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr5.sam WOU9_Sp34_Chr5.bam
samtools view -h -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_ChrX.sam NKZ35_Sp34_ChrX.bam


cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/

grep -v '@' WOU9_Sp34_Chr1.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr1_noheader.sam
grep -v '@' WOU9_Sp34_Chr2.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr2_noheader.sam
grep -v '@' WOU9_Sp34_Chr3.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr3_noheader.sam
grep -v '@' WOU9_Sp34_Chr4.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr4_noheader.sam
grep -v '@' WOU9_Sp34_Chr5.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr5_noheader.sam
grep -v '@' NKZ35_Sp34_ChrX.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_ChrX_noheader.sam
grep '@' WOU9_Sp34_Chr1.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr1_header
grep '@' WOU9_Sp34_Chr2.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr2_header
grep '@' WOU9_Sp34_Chr3.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr3_header
grep '@' WOU9_Sp34_Chr4.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr4_header
grep '@' WOU9_Sp34_Chr5.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_Chr5_header
grep '@' NKZ35_Sp34_ChrX.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_ChrX_header


#cat headers to sam files...

mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/

cat $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr1_header $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr1_noheader.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/NKZ35_Sp34_Chr1.sam
cat $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr2_header $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr2_noheader.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/NKZ35_Sp34_Chr2.sam
cat $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr3_header $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr3_noheader.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/NKZ35_Sp34_Chr3.sam
cat $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr4_header $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr4_noheader.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/NKZ35_Sp34_Chr4.sam
cat $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/NKZ35_Sp34_Chr5_header $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/NKZ35_Sp34_Chr5_noheader.sam > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/NKZ35_Sp34_Chr5.sam
cat $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/WOU9_Sp34_ChrX_header  $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/WOU9_Sp34_ChrX_noheader.sam  > $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/WOU9_Sp34_ChrX.sam 


#merge sam files

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/
mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/04_samtools_merge/

samtools merge $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/04_samtools_merge/F1_all_autosomes.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr1.sam NKZ35_Sp34_Chr1.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr2.sam NKZ35_Sp34_Chr2.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr3.sam NKZ35_Sp34_Chr3.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr4.sam NKZ35_Sp34_Chr4.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/WOU9_Sp34_Chr5.sam NKZ35_Sp34_Chr5.sam

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/
samtools merge $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/04_samtools_merge/F1_all_X.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_ChrX.sam WOU9_Sp34_ChrX.sam

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/04_samtools_merge/

samtools merge F1_A-B_female.sam F1_all_autosomes.sam F1_all_X.sam


samtools merge F1_A_male.sam F1_all_autosomes.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/00_samtools_view/NKZ35_Sp34_ChrX.sam

samtools merge F1_B_male.sam F1_all_autosomes.sam $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/WOU9_Sp34_ChrX.sam 

#sort and convert to bam
mkdir $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/04_samtools_merge/


samtools sort F1_A-B_female.sam -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/F1_A-B_female.sam

samtools sort F1_A_male.sam -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/F1_A_male.sam

samtools sort F1_B_male.sam -o $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/F1_B_male.sam

#okay, sam to bam

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/

samtools view -bS F1_A-B_female.sam > F1_A-B_female.bam
samtools view -bS F1_A_male.sam > F1_A_male.bam
samtools view -bS F1_B_male.sam > F1_B_male.bam

cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/
rm F1_A-B_female.sam
rm F1_A_male.sam
rm F1_B_male.sam

#index bam files

samtools index F1_A-B_female.bam
samtools index F1_A_male.bam
samtools index F1_B_male.bam

#remove some files
cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/04_samtools_merge/
rm *
cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/03_cat/
rm *
cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/02_awk_subsample/
rm *
cd $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/01_grep_headers/
rm *


############
############
############






#okay, let's try picard MarkDuplicates.....


module load picard/2.25.1-Java-11

#To execute picard run: java -jar $EBROOTPICARD/picard.jar

mkdir $wkdir/19_March_2024_fork/01_MarkDuplicates/
mkdir $wkdir/19_March_2024_fork/01_b_MarkDuplicates_metrics/

#here are the commands, ran as slurm scripts


#folder for parents: $wkdir/07_parents/00_merge_bam/
#folder for recombinants: $wkdir/06_samtools_sort/
#folder for F1: $wkdir/19_March_2024_fork/00_prepare_P0_F1/03_subsample_reads/05_samtools_sort/



cd $wkdir/06_samtools_sort/

module load picard/2.25.1-Java-11


java -jar $EBROOTPICARD/picard.jar MarkDuplicates MAX_RECORDS_IN_RAM=100000 INPUT=$wkdir/06_samtools_sort/F2A-10.bam OUTPUT=$wkdir/19_March_2024_fork/01_MarkDuplicates/F2A-10.bam METRICS_FILE=$wkdir/19_March_2024_fork/01_b_MarkDuplicates_metrics/F2A-10.bam.metrics REMOVE_DUPLICATES=true 
	#this was done for all files, see picard_markduplicates_commands.sh in slurm_scripts


#build bam indices

module load picard/2.25.1-Java-11

cd $wkdir/19_March_2024_fork/01_MarkDuplicates/

java -jar $EBROOTPICARD/picard.jar BuildBamIndex INPUT=F1_A-B_female.bam
		#this was done for all files, see picard_BiuldBamIndex_commands.sh in slurm_scripts


#need to add read groups

mkdir $wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/

cd  $wkdir/19_March_2024_fork/01_MarkDuplicates/

java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F1_A-B_female.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F1_A-B_female.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F1_A-B_female

		#this was done for all files, see picard_AddOrReplaceReadGroups_commands.sh in slurm_scripts

#re-index


module load picard/2.25.1-Java-11

cd $wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/

java -jar $EBROOTPICARD/picard.jar BuildBamIndex INPUT=F1_A-B_female.bam

		#this was done for all files, see picard_BiuldBamIndex_commands_2.sh in slurm_scripts


#parental sites for baserecalibrator: 

module load GATK/4.5.0.0-GCCcore-12.3.0-Java-17

mkdir $wkdir/21_March_2024_fork_3/00_BaseRecalibrator/

# /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/07_parents/09_filter_fixed_hom_alleles/parents_filtered.vcf
# /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/07_parents/09_filter_fixed_hom_alleles/parents_filtered.bed


#index parental vcf

cd $wkdir/07_parents/09_filter_fixed_hom_alleles/

java -jar $EBROOTGATK/gatk-package-4.5.0.0-local.jar IndexFeatureFile -I parents_filtered.vcf

#GATK BaseRecalibrator
cd  $wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/

java -jar $EBROOTGATK/gatk-package-4.5.0.0-local.jar  BaseRecalibrator  -R $wkdir/inopinata_genome/caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa -I F1_A-B_female.bam  --known-sites $wkdir/07_parents/09_filter_fixed_hom_alleles/parents_filtered.vcf -O $wkdir/21_March_2024_fork_3/00_BaseRecalibrator/F1_A-B_female.bam.table

		#this was done for all files, see GATK_BaseRecalibrator_commands.sh in slurm_scripts


#GATK ApplyBQSR

mkdir $wkdir/21_March_2024_fork_3/01_ApplyBQSR/


java -jar $EBROOTGATK/gatk-package-4.5.0.0-local.jar  ApplyBQSR -R $wkdir/inopinata_genome/caenorhabditis_inopinata.PRJDB5687.WBPS18.genomic_softmasked.fa -I F1_A-B_female.bam  --bqsr-recal-file $wkdir/21_March_2024_fork_3/00_BaseRecalibrator/F1_A-B_female.bam.table -O $wkdir/21_March_2024_fork_3/01_ApplyBQSR/F1_A-B_female.bam
		#this was done for all files, see GATK_ApplyBQSR_commands.sh in slurm_scripts


#get unique alignments

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

module load SAMtools/1.11-GCC-10.2.0

cd $wkdir/21_March_2024_fork_3/01_ApplyBQSR/

mkdir $wkdir/21_March_2024_fork_3/02_get_uniq_alignments/

samtools view -h F1_A-B_female.bam  | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b > $wkdir/21_March_2024_fork_3/02_get_uniq_alignments/F1_A-B_female.bam
		#this was done for all files, see GATK_ApplyBQSR_commands.sh in slurm_scripts


#just sites with informative biallelic snps
# $wkdir/07_parents/09_filter_fixed_hom_alleles/parents_filtered.bed

mkdir $wkdir/21_March_2024_fork_3/03_samtools_view

cd $wkdir/21_March_2024_fork_3/02_get_uniq_alignments/

samtools view  -F 4 -bS -q 15 -o $wkdir/21_March_2024_fork_3/03_samtools_view/F1_A-B_female.bam -L $wkdir/07_parents/09_filter_fixed_hom_alleles/parents_filtered.bed F1_A-B_female.bam
		#this was done for all files, see samtools_view_defined_SNPs_commands.sh in slurm_scripts



#sort
wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

mkdir $wkdir/21_March_2024_fork_3/04_samtools_sort/

module load SAMtools/1.11-GCC-10.2.0

cd $wkdir/21_March_2024_fork_3/03_samtools_view/

samtools sort -o $wkdir/19_March_2024_fork/07_samtools_sort/F1_A-B_female.bam F1_A-B_female.bam
		#this was done for all files, see samtools_sort_commands.sh in slurm_scripts



wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

module load SAMtools/1.11-GCC-10.2.0

cd $wkdir/21_March_2024_fork_3/04_samtools_sort/

samtools index F1_A-B_female.bam
			#this was done for all files

#get coverage

module load BEDTools/2.27.1-foss-2018b

mkdir $wkdir/21_March_2024_fork_3/05_bedtools_coverage/

cd $wkdir/21_March_2024_fork_3/04_samtools_sort/

for i in *.bam; do bedtools coverage -b $i -sorted -a $wkdir/07_parents/09_filter_fixed_hom_alleles/parents_filtered.bed > $wkdir/21_March_2024_fork_3/05_bedtools_coverage/$i.coverage; done 

mkdir $wkdir/21_March_2024_fork_3/06_awk_coverage/
cd $wkdir/21_March_2024_fork_3/05_bedtools_coverage
for i in *; do awk '{ sum += $4 } END { if (NR > 0) print sum }' $i > $wkdir/21_March_2024_fork_3/06_awk_coverage/$i; done 

#F2A-29.bam has quite low coverage, remove from further analysis
#copy over all the bams
cp -r $wkdir/21_March_2024_fork_3/04_samtools_sort/ $wkdir/21_March_2024_fork_3/07_remove_low_cov/ 
#remove the sample with low coverage
cd  $wkdir/21_March_2024_fork_3/07_remove_low_cov/ 

rm F2A-29.bam
rm F2A-29.bam.bai
########

#Lep-MAP3 for genetic map

#made needed files sorted_bams and mapping.txt, these are in "misc_files"

mkdir $wkdir/21_March_2024_fork_3/08_Lep-MAP3/

cd $wkdir/21_March_2024_fork_3/07_remove_low_cov/ 


mv NKZ35.bam 00_NKZ35.bam
mv NKZ35.bam.bai 00_NKZ35.bam.bai
mv WOU9.bam 01_WOU9.bam
mv WOU9.bam.bai 01_WOU9.bam.bai


#Lep-MAP3 Pileup2Likelihoods by chromosome
cd $wkdir/21_March_2024_fork_3/07_remove_low_cov


samtools mpileup -r Sp34_Chr5 -q 10 -Q 10 -s $(cat sorted_bams)|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Pileup2Likelihoods|gzip >$wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/Sp34_Chr5.post.gz
samtools mpileup -r Sp34_Chr4 -q 10 -Q 10 -s $(cat sorted_bams)|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Pileup2Likelihoods|gzip >$wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/Sp34_Chr4.post.gz
samtools mpileup -r Sp34_Chr3 -q 10 -Q 10 -s $(cat sorted_bams)|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Pileup2Likelihoods|gzip >$wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/Sp34_Chr3.post.gz
samtools mpileup -r Sp34_Chr2 -q 10 -Q 10 -s $(cat sorted_bams)|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Pileup2Likelihoods|gzip >$wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/Sp34_Chr2.post.gz
samtools mpileup -r Sp34_Chr1 -q 10 -Q 10 -s $(cat sorted_bams)|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Pileup2Likelihoods|gzip >$wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/Sp34_Chr1.post.gz
samtools mpileup -r Sp34_ChrX -q 10 -Q 10 -s $(cat sorted_bams)|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Pileup2Likelihoods|gzip >$wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/Sp34_ChrX.post.gz


#Lep-MAP3 ParentCall2

cd $wkdir/21_March_2024_fork_3/08_Lep-MAP3/00_Pileup2Likelihoods/

zcat Sp34_Chr1.post.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ ParentCall2 data=$wkdir/21_March_2024_fork_3/08_Lep-MAP3/pedigree.txt posteriorFile=- removeNonInformative=1|gzip > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/Sp34_Chr1.call.gz 
zcat Sp34_Chr2.post.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ ParentCall2 data=$wkdir/21_March_2024_fork_3/08_Lep-MAP3/pedigree.txt posteriorFile=- removeNonInformative=1|gzip > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/Sp34_Chr2.call.gz
zcat Sp34_Chr3.post.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ ParentCall2 data=$wkdir/21_March_2024_fork_3/08_Lep-MAP3/pedigree.txt posteriorFile=- removeNonInformative=1|gzip > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/Sp34_Chr3.call.gz
zcat Sp34_Chr4.post.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ ParentCall2 data=$wkdir/21_March_2024_fork_3/08_Lep-MAP3/pedigree.txt posteriorFile=- removeNonInformative=1|gzip > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/Sp34_Chr4.call.gz
zcat Sp34_Chr5.post.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ ParentCall2 data=$wkdir/21_March_2024_fork_3/08_Lep-MAP3/pedigree.txt posteriorFile=- removeNonInformative=1|gzip > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/Sp34_Chr5.call.gz 
zcat Sp34_ChrX.post.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ ParentCall2 data=$wkdir/21_March_2024_fork_3/08_Lep-MAP3/pedigree.txt posteriorFile=- removeNonInformative=1 XLimit=2 |gzip > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/Sp34_ChrX.call.gz

#Lep-MAP3 Filtering2

mkdir $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/
cd $wkdir/21_March_2024_fork_3/08_Lep-MAP3/01_ParentCall2/

zcat Sp34_Chr1.call.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Filtering2 data=- dataTolerance=0.001|gzip >  $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/Sp34_Chr1_f.call.gz
zcat Sp34_Chr2.call.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Filtering2 data=- dataTolerance=0.001|gzip >  $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/Sp34_Chr2_f.call.gz
zcat Sp34_Chr3.call.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Filtering2 data=- dataTolerance=0.001|gzip >  $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/Sp34_Chr3_f.call.gz
zcat Sp34_Chr4.call.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Filtering2 data=- dataTolerance=0.001|gzip >  $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/Sp34_Chr4_f.call.gz
zcat Sp34_Chr5.call.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Filtering2 data=- dataTolerance=0.001|gzip >  $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/Sp34_Chr5_f.call.gz
zcat Sp34_ChrX.call.gz|java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ Filtering2 data=- dataTolerance=0.001|gzip >  $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/Sp34_ChrX_f.call.gz

#get numbered order of sites by chromosome


mkdir $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/
cd $wkdir/21_March_2024_fork_3/08_Lep-MAP3/02_Filtering2/


number=$(zcat Sp34_Chr1_f.call.gz | grep -v -P "CHR|#" - |wc -l)
echo $number
for i in $(seq 1 $number);do echo $i >> Sp34_Chr1.order.file; done


number=$(zcat Sp34_Chr2_f.call.gz | grep -v -P "CHR|#" - |wc -l)
echo $number
for i in $(seq 1 $number);do echo $i >> Sp34_Chr2.order.file; done

number=$(zcat Sp34_Chr3_f.call.gz | grep -v -P "CHR|#" - |wc -l)
echo $number
for i in $(seq 1 $number);do echo $i >> Sp34_Chr3.order.file; done

number=$(zcat Sp34_Chr4_f.call.gz | grep -v -P "CHR|#" - |wc -l)
echo $number
for i in $(seq 1 $number);do echo $i >> Sp34_Chr4.order.file; done

number=$(zcat Sp34_Chr5_f.call.gz | grep -v -P "CHR|#" - |wc -l)
echo $number
for i in $(seq 1 $number);do echo $i >> Sp34_Chr5.order.file; done

number=$(zcat Sp34_ChrX_f.call.gz | grep -v -P "CHR|#" - |wc -l)
echo $number
for i in $(seq 1 $number);do echo $i >> Sp34_ChrX.order.file; done


#Lep-MAP3 OrderMarkers2


#try OrderMarkers2

zcat Sp34_Chr1_f.call.gz | java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ OrderMarkers2 evaluateOrder=Sp34_Chr1.order.file data=- improveOrder=0 sexAveraged=1 grandparentPhase=1 > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr1.map.txt

zcat Sp34_Chr2_f.call.gz | java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ OrderMarkers2 evaluateOrder=Sp34_Chr2.order.file data=- improveOrder=0 sexAveraged=1 grandparentPhase=1 > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr2.map.txt

zcat Sp34_Chr3_f.call.gz | java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ OrderMarkers2 evaluateOrder=Sp34_Chr3.order.file data=- improveOrder=0 sexAveraged=1 grandparentPhase=1 > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr3.map.txt

zcat Sp34_Chr4_f.call.gz | java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ OrderMarkers2 evaluateOrder=Sp34_Chr4.order.file data=- improveOrder=0 sexAveraged=1 grandparentPhase=1 > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr4.map.txt

zcat Sp34_Chr5_f.call.gz | java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ OrderMarkers2 evaluateOrder=Sp34_Chr5.order.file data=- improveOrder=0 sexAveraged=1 grandparentPhase=1 > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr5.map.txt

zcat Sp34_ChrX_f.call.gz | java -cp /home/gcwoodruff/download/Lep-MAP3/bin/ OrderMarkers2 evaluateOrder=Sp34_ChrX.order.file data=- improveOrder=0 recombination1=0 grandparentPhase=1 > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_ChrX.map.txt

#get physical positions of the markers


zcat Sp34_Chr1_f.call.gz | cut -f1-2 - > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr1.POSITIONS.txt
zcat Sp34_Chr2_f.call.gz | cut -f1-2 - > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr2.POSITIONS.txt
zcat Sp34_Chr3_f.call.gz | cut -f1-2 - > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr3.POSITIONS.txt
zcat Sp34_Chr4_f.call.gz | cut -f1-2 - > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr4.POSITIONS.txt
zcat Sp34_Chr5_f.call.gz | cut -f1-2 - > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_Chr5.POSITIONS.txt
zcat Sp34_ChrX_f.call.gz | cut -f1-2 - > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/Sp34_ChrX.POSITIONS.txt


#get the genetic positions of the markers


cd $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/
cat Sp34_Chr1.map.txt | cut -f1-3 - >Sp34_Chr1.REC.MAP.SHORT.txt
cat Sp34_Chr2.map.txt | cut -f1-3 - >Sp34_Chr2.REC.MAP.SHORT.txt
cat Sp34_Chr3.map.txt | cut -f1-3 - >Sp34_Chr3.REC.MAP.SHORT.txt
cat Sp34_Chr4.map.txt | cut -f1-3 - >Sp34_Chr4.REC.MAP.SHORT.txt
cat Sp34_Chr5.map.txt | cut -f1-3 - >Sp34_Chr5.REC.MAP.SHORT.txt
cat Sp34_ChrX.map.txt | cut -f1-3 - >Sp34_ChrX.REC.MAP.SHORT.txt

#get the genotypes LEP-MAP3 used; Lep-MAP3 map2genotypes.awk


mkdir $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes


#  export PATH=$PATH:/home/gcwoodruff/download/
cd $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/

awk -vfullData=1 -f /home/gcwoodruff/download/map2genotypes.awk Sp34_Chr1.map.txt > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/Sp34_Chr1_genotypes.txt

awk -vfullData=1 -f /home/gcwoodruff/download/map2genotypes.awk Sp34_Chr2.map.txt > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/Sp34_Chr2_genotypes.txt

awk -vfullData=1 -f /home/gcwoodruff/download/map2genotypes.awk Sp34_Chr3.map.txt > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/Sp34_Chr3_genotypes.txt

awk -vfullData=1 -f /home/gcwoodruff/download/map2genotypes.awk Sp34_Chr4.map.txt > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/Sp34_Chr4_genotypes.txt

awk -vfullData=1 -f /home/gcwoodruff/download/map2genotypes.awk Sp34_Chr5.map.txt > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/Sp34_Chr5_genotypes.txt

awk -vfullData=1 -f /home/gcwoodruff/download/map2genotypes.awk Sp34_ChrX.map.txt > $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/Sp34_ChrX_genotypes.txt

##files in $wkdir/21_March_2024_fork_3/08_Lep-MAP3/03_OrderMarkers2/ and $wkdir/21_March_2024_fork_3/08_Lep-MAP3/04_map2genotypes/ are what were used for the inopinata genetic map.


