
wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/remasking/03_gene_count/'

mkdir $wkdir/01_awk

cd $wkdir/00_gff
	
awk '$3 == "gene"' NIC58.gff3 > $wkdir/01_awk/NIC58_genes.gff3

mkdir $wkdir/02_gff2bed/

cd $wkdir/01_awk/


export PATH=$PATH:/home/gcwoodruff/download/bin

gff2bed < NIC58_genes.gff3 > $wkdir/02_gff2bed/NIC58_genes.bed

#make windows, bedtools

module load SAMtools/1.16.1-GCC-11.3.0

samtools faidx /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/remasking/00_genomes/NIC58.genome.tropicalis.fa
cut -f1,2 /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/remasking/00_genomes/NIC58.genome.tropicalis.fa.fai > NIC58.genome.tropicalis.chrom.sizes 

module load BEDTools/2.27.1-foss-2018b

bedtools makewindows -w 100000 -g /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/remasking/00_genomes/NIC58.genome.tropicalis.chrom.sizes > /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/remasking/00_genomes/NIC58.genome.tropicalis.100kb.windows

mkdir $wkdir/03_awk/

cd $wkdir/02_gff2bed/

awk 'BEGIN {FS="\t"} {OFS="\t"} {print $0,"1"}' NIC58_genes.bed >  $wkdir/03_awk/NIC58_genes.bed


mkdir $wkdir/04_bedtools_map/

cd $wkdir/03_awk/


bedtools map -o sum -c 11 -a /ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/remasking/00_genomes/NIC58.genome.tropicalis.100kb.windows -b NIC58_genes.bed > $wkdir/04_bedtools_map/tropicalis_genes_100kb_windows.bed



mkdir $wkdir/05_awk/

cd $wkdir/04_bedtools_map/

awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1,$2+1,$4,"tropicalis"}' tropicalis_genes_100kb_windows.bed > $wkdir/05_awk/tropicalis_gene_density_100kb.tsv
