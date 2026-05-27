###these are the concatenated slurm scripts used to align fastq files to the inopinata reference genome.

#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=1-00:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-28_S167_L001_R1_001.fastq F2A-28_S167_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-28.sam
gzip F2A-28_S167_L001_R1_001.fastq
gzip F2A-28_S167_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=1-00:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-26_S91_L001_R1_001.fastq F2B-26_S91_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-26.sam
gzip F2B-26_S91_L001_R1_001.fastq
gzip F2B-26_S91_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F1A-2_S166_L001_R1_001.fastq F1A-2_S166_L001_R2_001.fastq  > $wkdir/02_bwa/F1A-2.sam
gzip F1A-2_S166_L001_R1_001.fastq
gzip F1A-2_S166_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F1B-1_S73_L001_R1_001.fastq.gz
gunzip F1B-1_S73_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F1B-1_S73_L001_R1_001.fastq F1B-1_S73_L001_R2_001.fastq  > $wkdir/02_bwa/F1B-1.sam
gzip F1B-1_S73_L001_R1_001.fastq
gzip F1B-1_S73_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F1B-2_S81_L001_R1_001.fastq.gz
gunzip F1B-2_S81_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F1B-2_S81_L001_R1_001.fastq F1B-2_S81_L001_R2_001.fastq  > $wkdir/02_bwa/F1B-2.sam
gzip F1B-2_S81_L001_R1_001.fastq
gzip F1B-2_S81_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-10_S190_L001_R1_001.fastq.gz
gunzip F2A-10_S190_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-10_S190_L001_R1_001.fastq F2A-10_S190_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-10.sam
gzip F2A-10_S190_L001_R1_001.fastq
gzip F2A-10_S190_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-12_S194_L001_R1_001.fastq.gz
gunzip F2A-12_S194_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-12_S194_L001_R1_001.fastq F2A-12_S194_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-12.sam
gzip F2A-12_S194_L001_R1_001.fastq
gzip F2A-12_S194_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-13_S59_L001_R1_001.fastq.gz
gunzip F2A-13_S59_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-13_S59_L001_R1_001.fastq F2A-13_S59_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-13.sam
gzip F2A-13_S59_L001_R1_001.fastq
gzip F2A-13_S59_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-14_S66_L001_R1_001.fastq.gz
gunzip F2A-14_S66_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-14_S66_L001_R1_001.fastq F2A-14_S66_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-14.sam
gzip F2A-14_S66_L001_R1_001.fastq
gzip F2A-14_S66_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-15_S2_L001_R1_001.fastq.gz
gunzip F2A-15_S2_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-15_S2_L001_R1_001.fastq F2A-15_S2_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-15.sam
gzip F2A-15_S2_L001_R1_001.fastq
gzip F2A-15_S2_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-16_S197_L001_R1_001.fastq.gz
gunzip F2A-16_S197_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-16_S197_L001_R1_001.fastq F2A-16_S197_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-16.sam
gzip F2A-16_S197_L001_R1_001.fastq
gzip F2A-16_S197_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-17_S14_L001_R1_001.fastq.gz
gunzip F2A-17_S14_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-17_S14_L001_R1_001.fastq F2A-17_S14_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-17.sam
gzip F2A-17_S14_L001_R1_001.fastq
gzip F2A-17_S14_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-18_S200_L001_R1_001.fastq.gz
gunzip F2A-18_S200_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-18_S200_L001_R1_001.fastq F2A-18_S200_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-18.sam
gzip F2A-18_S200_L001_R1_001.fastq
gzip F2A-18_S200_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-19_S25_L001_R1_001.fastq.gz
gunzip F2A-19_S25_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-19_S25_L001_R1_001.fastq F2A-19_S25_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-19.sam
gzip F2A-19_S25_L001_R1_001.fastq
gzip F2A-19_S25_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-1_S170_L001_R1_001.fastq.gz
gunzip F2A-1_S170_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-1_S170_L001_R1_001.fastq F2A-1_S170_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-1.sam
gzip F2A-1_S170_L001_R1_001.fastq
gzip F2A-1_S170_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-20_S31_L001_R1_001.fastq.gz
gunzip F2A-20_S31_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-20_S31_L001_R1_001.fastq F2A-20_S31_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-20.sam
gzip F2A-20_S31_L001_R1_001.fastq
gzip F2A-20_S31_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-21_S203_L001_R1_001.fastq.gz
gunzip F2A-21_S203_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-21_S203_L001_R1_001.fastq F2A-21_S203_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-21.sam
gzip F2A-21_S203_L001_R1_001.fastq
gzip F2A-21_S203_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-22_S163_L001_R1_001.fastq.gz
gunzip F2A-22_S163_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-22_S163_L001_R1_001.fastq F2A-22_S163_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-22.sam
gzip F2A-22_S163_L001_R1_001.fastq
gzip F2A-22_S163_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-23_S43_L001_R1_001.fastq.gz
gunzip F2A-23_S43_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-23_S43_L001_R1_001.fastq F2A-23_S43_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-23.sam
gzip F2A-23_S43_L001_R1_001.fastq
gzip F2A-23_S43_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-24_S48_L001_R1_001.fastq.gz
gunzip F2A-24_S48_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-24_S48_L001_R1_001.fastq F2A-24_S48_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-24.sam
gzip F2A-24_S48_L001_R1_001.fastq
gzip F2A-24_S48_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-25_S53_L001_R1_001.fastq.gz
gunzip F2A-25_S53_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-25_S53_L001_R1_001.fastq F2A-25_S53_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-25.sam
gzip F2A-25_S53_L001_R1_001.fastq
gzip F2A-25_S53_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-26_S60_L001_R1_001.fastq.gz
gunzip F2A-26_S60_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-26_S60_L001_R1_001.fastq F2A-26_S60_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-26.sam
gzip F2A-26_S60_L001_R1_001.fastq
gzip F2A-26_S60_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-27_S67_L001_R1_001.fastq.gz
gunzip F2A-27_S67_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-27_S67_L001_R1_001.fastq F2A-27_S67_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-27.sam
gzip F2A-27_S67_L001_R1_001.fastq
gzip F2A-27_S67_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-28_S167_L001_R1_001.fastq.gz
gunzip F2A-28_S167_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-28_S167_L001_R1_001.fastq F2A-28_S167_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-28.sam
gzip F2A-28_S167_L001_R1_001.fastq
gzip F2A-28_S167_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-29_S171_L001_R1_001.fastq.gz
gunzip F2A-29_S171_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-29_S171_L001_R1_001.fastq F2A-29_S171_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-29.sam
gzip F2A-29_S171_L001_R1_001.fastq
gzip F2A-29_S171_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-2_S174_L001_R1_001.fastq.gz
gunzip F2A-2_S174_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-2_S174_L001_R1_001.fastq F2A-2_S174_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-2.sam
gzip F2A-2_S174_L001_R1_001.fastq
gzip F2A-2_S174_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-30_S8_L001_R1_001.fastq.gz
gunzip F2A-30_S8_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-30_S8_L001_R1_001.fastq F2A-30_S8_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-30.sam
gzip F2A-30_S8_L001_R1_001.fastq
gzip F2A-30_S8_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-31_S15_L001_R1_001.fastq.gz
gunzip F2A-31_S15_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-31_S15_L001_R1_001.fastq F2A-31_S15_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-31.sam
gzip F2A-31_S15_L001_R1_001.fastq
gzip F2A-31_S15_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-32-AGGAGGCCTA-AATTGACCAC_S19_L001_R1_001.fastq.gz
gunzip F2A-32-AGGAGGCCTA-AATTGACCAC_S19_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-32-AGGAGGCCTA-AATTGACCAC_S19_L001_R1_001.fastq F2A-32-AGGAGGCCTA-AATTGACCAC_S19_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-32-AGGAGGCCTA-AATTGACCAC.sam
gzip F2A-32-AGGAGGCCTA-AATTGACCAC_S19_L001_R1_001.fastq
gzip F2A-32-AGGAGGCCTA-AATTGACCAC_S19_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-32-GAGTACGCAG-TTGCCATCAG_S175_L001_R1_001.fastq.gz
gunzip F2A-32-GAGTACGCAG-TTGCCATCAG_S175_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-32-GAGTACGCAG-TTGCCATCAG_S175_L001_R1_001.fastq F2A-32-GAGTACGCAG-TTGCCATCAG_S175_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-32-GAGTACGCAG-TTGCCATCAG.sam
gzip F2A-32-GAGTACGCAG-TTGCCATCAG_S175_L001_R1_001.fastq
gzip F2A-32-GAGTACGCAG-TTGCCATCAG_S175_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-33-ATGTCGAGTT-CTTCAACCAC_S179_L001_R1_001.fastq.gz
gunzip F2A-33-ATGTCGAGTT-CTTCAACCAC_S179_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-33-ATGTCGAGTT-CTTCAACCAC_S179_L001_R1_001.fastq F2A-33-ATGTCGAGTT-CTTCAACCAC_S179_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-33-ATGTCGAGTT-CTTCAACCAC.sam
gzip F2A-33-ATGTCGAGTT-CTTCAACCAC_S179_L001_R1_001.fastq
gzip F2A-33-ATGTCGAGTT-CTTCAACCAC_S179_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-33-GTAATTCCTC-GACACTGCCA_S26_L001_R1_001.fastq.gz
gunzip F2A-33-GTAATTCCTC-GACACTGCCA_S26_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-33-GTAATTCCTC-GACACTGCCA_S26_L001_R1_001.fastq F2A-33-GTAATTCCTC-GACACTGCCA_S26_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-33-GTAATTCCTC-GACACTGCCA.sam
gzip F2A-33-GTAATTCCTC-GACACTGCCA_S26_L001_R1_001.fastq
gzip F2A-33-GTAATTCCTC-GACACTGCCA_S26_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-34_S183_L001_R1_001.fastq.gz
gunzip F2A-34_S183_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-34_S183_L001_R1_001.fastq F2A-34_S183_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-34.sam
gzip F2A-34_S183_L001_R1_001.fastq
gzip F2A-34_S183_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-35_S187_L001_R1_001.fastq.gz
gunzip F2A-35_S187_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-35_S187_L001_R1_001.fastq F2A-35_S187_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-35.sam
gzip F2A-35_S187_L001_R1_001.fastq
gzip F2A-35_S187_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-36_S191_L001_R1_001.fastq.gz
gunzip F2A-36_S191_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-36_S191_L001_R1_001.fastq F2A-36_S191_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-36.sam
gzip F2A-36_S191_L001_R1_001.fastq
gzip F2A-36_S191_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-37_S32_L001_R1_001.fastq.gz
gunzip F2A-37_S32_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-37_S32_L001_R1_001.fastq F2A-37_S32_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-37.sam
gzip F2A-37_S32_L001_R1_001.fastq
gzip F2A-37_S32_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-38_S38_L001_R1_001.fastq.gz
gunzip F2A-38_S38_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-38_S38_L001_R1_001.fastq F2A-38_S38_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-38.sam
gzip F2A-38_S38_L001_R1_001.fastq
gzip F2A-38_S38_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-39_S44_L001_R1_001.fastq.gz
gunzip F2A-39_S44_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-39_S44_L001_R1_001.fastq F2A-39_S44_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-39.sam
gzip F2A-39_S44_L001_R1_001.fastq
gzip F2A-39_S44_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-3-CACAACGATA-TGCGGACACA_S178_L001_R1_001.fastq.gz
gunzip F2A-3-CACAACGATA-TGCGGACACA_S178_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-3-CACAACGATA-TGCGGACACA_S178_L001_R1_001.fastq F2A-3-CACAACGATA-TGCGGACACA_S178_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-3-CACAACGATA-TGCGGACACA.sam
gzip F2A-3-CACAACGATA-TGCGGACACA_S178_L001_R1_001.fastq
gzip F2A-3-CACAACGATA-TGCGGACACA_S178_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-3-TACGAAGCTA-ACCTCAACGT_S1_L001_R1_001.fastq.gz
gunzip F2A-3-TACGAAGCTA-ACCTCAACGT_S1_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-3-TACGAAGCTA-ACCTCAACGT_S1_L001_R1_001.fastq F2A-3-TACGAAGCTA-ACCTCAACGT_S1_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-3-TACGAAGCTA-ACCTCAACGT.sam
gzip F2A-3-TACGAAGCTA-ACCTCAACGT_S1_L001_R1_001.fastq
gzip F2A-3-TACGAAGCTA-ACCTCAACGT_S1_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-40_S195_L001_R1_001.fastq.gz
gunzip F2A-40_S195_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-40_S195_L001_R1_001.fastq F2A-40_S195_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-40.sam
gzip F2A-40_S195_L001_R1_001.fastq
gzip F2A-40_S195_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-41_S49_L001_R1_001.fastq.gz
gunzip F2A-41_S49_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-41_S49_L001_R1_001.fastq F2A-41_S49_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-41.sam
gzip F2A-41_S49_L001_R1_001.fastq
gzip F2A-41_S49_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-42_S54_L001_R1_001.fastq.gz
gunzip F2A-42_S54_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-42_S54_L001_R1_001.fastq F2A-42_S54_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-42.sam
gzip F2A-42_S54_L001_R1_001.fastq
gzip F2A-42_S54_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-43_S61_L001_R1_001.fastq.gz
gunzip F2A-43_S61_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-43_S61_L001_R1_001.fastq F2A-43_S61_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-43.sam
gzip F2A-43_S61_L001_R1_001.fastq
gzip F2A-43_S61_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-44_S68_L001_R1_001.fastq.gz
gunzip F2A-44_S68_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-44_S68_L001_R1_001.fastq F2A-44_S68_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-44.sam
gzip F2A-44_S68_L001_R1_001.fastq
gzip F2A-44_S68_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-45_S3_L001_R1_001.fastq.gz
gunzip F2A-45_S3_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-45_S3_L001_R1_001.fastq F2A-45_S3_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-45.sam
gzip F2A-45_S3_L001_R1_001.fastq
gzip F2A-45_S3_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-46_S9_L001_R1_001.fastq.gz
gunzip F2A-46_S9_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-46_S9_L001_R1_001.fastq F2A-46_S9_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-46.sam
gzip F2A-46_S9_L001_R1_001.fastq
gzip F2A-46_S9_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-47_S16_L001_R1_001.fastq.gz
gunzip F2A-47_S16_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-47_S16_L001_R1_001.fastq F2A-47_S16_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-47.sam
gzip F2A-47_S16_L001_R1_001.fastq
gzip F2A-47_S16_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-48_S20_L001_R1_001.fastq.gz
gunzip F2A-48_S20_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-48_S20_L001_R1_001.fastq F2A-48_S20_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-48.sam
gzip F2A-48_S20_L001_R1_001.fastq
gzip F2A-48_S20_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-49_S198_L001_R1_001.fastq.gz
gunzip F2A-49_S198_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-49_S198_L001_R1_001.fastq F2A-49_S198_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-49.sam
gzip F2A-49_S198_L001_R1_001.fastq
gzip F2A-49_S198_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-4_S7_L001_R1_001.fastq.gz
gunzip F2A-4_S7_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-4_S7_L001_R1_001.fastq F2A-4_S7_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-4.sam
gzip F2A-4_S7_L001_R1_001.fastq
gzip F2A-4_S7_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-50_S201_L001_R1_001.fastq.gz
gunzip F2A-50_S201_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-50_S201_L001_R1_001.fastq F2A-50_S201_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-50.sam
gzip F2A-50_S201_L001_R1_001.fastq
gzip F2A-50_S201_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-51_S204_L001_R1_001.fastq.gz
gunzip F2A-51_S204_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-51_S204_L001_R1_001.fastq F2A-51_S204_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-51.sam
gzip F2A-51_S204_L001_R1_001.fastq
gzip F2A-51_S204_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-52_S33_L001_R1_001.fastq.gz
gunzip F2A-52_S33_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-52_S33_L001_R1_001.fastq F2A-52_S33_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-52.sam
gzip F2A-52_S33_L001_R1_001.fastq
gzip F2A-52_S33_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-53_S39_L001_R1_001.fastq.gz
gunzip F2A-53_S39_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-53_S39_L001_R1_001.fastq F2A-53_S39_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-53.sam
gzip F2A-53_S39_L001_R1_001.fastq
gzip F2A-53_S39_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-54_S45_L001_R1_001.fastq.gz
gunzip F2A-54_S45_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-54_S45_L001_R1_001.fastq F2A-54_S45_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-54.sam
gzip F2A-54_S45_L001_R1_001.fastq
gzip F2A-54_S45_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-55-AATAGGTGCT-TGCCTATCGC_S50_L001_R1_001.fastq.gz
gunzip F2A-55-AATAGGTGCT-TGCCTATCGC_S50_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-55-AATAGGTGCT-TGCCTATCGC_S50_L001_R1_001.fastq F2A-55-AATAGGTGCT-TGCCTATCGC_S50_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-55-AATAGGTGCT-TGCCTATCGC.sam
gzip F2A-55-AATAGGTGCT-TGCCTATCGC_S50_L001_R1_001.fastq
gzip F2A-55-AATAGGTGCT-TGCCTATCGC_S50_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-55-GCTATCATCG-ATCACGGCTA_S164_L001_R1_001.fastq.gz
gunzip F2A-55-GCTATCATCG-ATCACGGCTA_S164_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-55-GCTATCATCG-ATCACGGCTA_S164_L001_R1_001.fastq F2A-55-GCTATCATCG-ATCACGGCTA_S164_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-55-GCTATCATCG-ATCACGGCTA.sam
gzip F2A-55-GCTATCATCG-ATCACGGCTA_S164_L001_R1_001.fastq
gzip F2A-55-GCTATCATCG-ATCACGGCTA_S164_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-56_S55_L001_R1_001.fastq.gz
gunzip F2A-56_S55_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-56_S55_L001_R1_001.fastq F2A-56_S55_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-56.sam
gzip F2A-56_S55_L001_R1_001.fastq
gzip F2A-56_S55_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-57_S62_L001_R1_001.fastq.gz
gunzip F2A-57_S62_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-57_S62_L001_R1_001.fastq F2A-57_S62_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-57.sam
gzip F2A-57_S62_L001_R1_001.fastq
gzip F2A-57_S62_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-58_S69_L001_R1_001.fastq.gz
gunzip F2A-58_S69_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-58_S69_L001_R1_001.fastq F2A-58_S69_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-58.sam
gzip F2A-58_S69_L001_R1_001.fastq
gzip F2A-58_S69_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-59_S168_L001_R1_001.fastq.gz
gunzip F2A-59_S168_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-59_S168_L001_R1_001.fastq F2A-59_S168_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-59.sam
gzip F2A-59_S168_L001_R1_001.fastq
gzip F2A-59_S168_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-5_S13_L001_R1_001.fastq.gz
gunzip F2A-5_S13_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-5_S13_L001_R1_001.fastq F2A-5_S13_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-5.sam
gzip F2A-5_S13_L001_R1_001.fastq
gzip F2A-5_S13_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-60-CATGAACCGG-CAAGACGTCT_S172_L001_R1_001.fastq.gz
gunzip F2A-60-CATGAACCGG-CAAGACGTCT_S172_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-60-CATGAACCGG-CAAGACGTCT_S172_L001_R1_001.fastq F2A-60-CATGAACCGG-CAAGACGTCT_S172_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-60-CATGAACCGG-CAAGACGTCT.sam
gzip F2A-60-CATGAACCGG-CAAGACGTCT_S172_L001_R1_001.fastq
gzip F2A-60-CATGAACCGG-CAAGACGTCT_S172_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-60-CTCACTTGTT-ATGCGTAACT_S4_L001_R1_001.fastq.gz
gunzip F2A-60-CTCACTTGTT-ATGCGTAACT_S4_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-60-CTCACTTGTT-ATGCGTAACT_S4_L001_R1_001.fastq F2A-60-CTCACTTGTT-ATGCGTAACT_S4_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-60-CTCACTTGTT-ATGCGTAACT.sam
gzip F2A-60-CTCACTTGTT-ATGCGTAACT_S4_L001_R1_001.fastq
gzip F2A-60-CTCACTTGTT-ATGCGTAACT_S4_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-61_S10_L001_R1_001.fastq.gz
gunzip F2A-61_S10_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-61_S10_L001_R1_001.fastq F2A-61_S10_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-61.sam
gzip F2A-61_S10_L001_R1_001.fastq
gzip F2A-61_S10_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-62_S17_L001_R1_001.fastq.gz
gunzip F2A-62_S17_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-62_S17_L001_R1_001.fastq F2A-62_S17_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-62.sam
gzip F2A-62_S17_L001_R1_001.fastq
gzip F2A-62_S17_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-63_S21_L001_R1_001.fastq.gz
gunzip F2A-63_S21_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-63_S21_L001_R1_001.fastq F2A-63_S21_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-63.sam
gzip F2A-63_S21_L001_R1_001.fastq
gzip F2A-63_S21_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-64-AGGTTATGTC-CTGTTAGGAT_S27_L001_R1_001.fastq.gz
gunzip F2A-64-AGGTTATGTC-CTGTTAGGAT_S27_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-64-AGGTTATGTC-CTGTTAGGAT_S27_L001_R1_001.fastq F2A-64-AGGTTATGTC-CTGTTAGGAT_S27_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-64-AGGTTATGTC-CTGTTAGGAT.sam
gzip F2A-64-AGGTTATGTC-CTGTTAGGAT_S27_L001_R1_001.fastq
gzip F2A-64-AGGTTATGTC-CTGTTAGGAT_S27_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-64-TAAGTAAGGC-GTTAAGGTGC_S176_L001_R1_001.fastq.gz
gunzip F2A-64-TAAGTAAGGC-GTTAAGGTGC_S176_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-64-TAAGTAAGGC-GTTAAGGTGC_S176_L001_R1_001.fastq F2A-64-TAAGTAAGGC-GTTAAGGTGC_S176_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-64-TAAGTAAGGC-GTTAAGGTGC.sam
gzip F2A-64-TAAGTAAGGC-GTTAAGGTGC_S176_L001_R1_001.fastq
gzip F2A-64-TAAGTAAGGC-GTTAAGGTGC_S176_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-65_S34_L001_R1_001.fastq.gz
gunzip F2A-65_S34_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-65_S34_L001_R1_001.fastq F2A-65_S34_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-65.sam
gzip F2A-65_S34_L001_R1_001.fastq
gzip F2A-65_S34_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-66_S40_L001_R1_001.fastq.gz
gunzip F2A-66_S40_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-66_S40_L001_R1_001.fastq F2A-66_S40_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-66.sam
gzip F2A-66_S40_L001_R1_001.fastq
gzip F2A-66_S40_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-67_S46_L001_R1_001.fastq.gz
gunzip F2A-67_S46_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-67_S46_L001_R1_001.fastq F2A-67_S46_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-67.sam
gzip F2A-67_S46_L001_R1_001.fastq
gzip F2A-67_S46_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-68_S51_L001_R1_001.fastq.gz
gunzip F2A-68_S51_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-68_S51_L001_R1_001.fastq F2A-68_S51_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-68.sam
gzip F2A-68_S51_L001_R1_001.fastq
gzip F2A-68_S51_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-69_S56_L001_R1_001.fastq.gz
gunzip F2A-69_S56_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-69_S56_L001_R1_001.fastq F2A-69_S56_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-69.sam
gzip F2A-69_S56_L001_R1_001.fastq
gzip F2A-69_S56_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-6_S182_L001_R1_001.fastq.gz
gunzip F2A-6_S182_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-6_S182_L001_R1_001.fastq F2A-6_S182_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-6.sam
gzip F2A-6_S182_L001_R1_001.fastq
gzip F2A-6_S182_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-70_S63_L001_R1_001.fastq.gz
gunzip F2A-70_S63_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-70_S63_L001_R1_001.fastq F2A-70_S63_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-70.sam
gzip F2A-70_S63_L001_R1_001.fastq
gzip F2A-70_S63_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-71_S70_L001_R1_001.fastq.gz
gunzip F2A-71_S70_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-71_S70_L001_R1_001.fastq F2A-71_S70_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-71.sam
gzip F2A-71_S70_L001_R1_001.fastq
gzip F2A-71_S70_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-72-CTTCTGGAGG-ATTGGAACAC_S180_L001_R1_001.fastq.gz
gunzip F2A-72-CTTCTGGAGG-ATTGGAACAC_S180_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-72-CTTCTGGAGG-ATTGGAACAC_S180_L001_R1_001.fastq F2A-72-CTTCTGGAGG-ATTGGAACAC_S180_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-72-CTTCTGGAGG-ATTGGAACAC.sam
gzip F2A-72-CTTCTGGAGG-ATTGGAACAC_S180_L001_R1_001.fastq
gzip F2A-72-CTTCTGGAGG-ATTGGAACAC_S180_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-72-GTGTACGTCG-AGGTCGATAA_S5_L001_R1_001.fastq.gz
gunzip F2A-72-GTGTACGTCG-AGGTCGATAA_S5_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-72-GTGTACGTCG-AGGTCGATAA_S5_L001_R1_001.fastq F2A-72-GTGTACGTCG-AGGTCGATAA_S5_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-72-GTGTACGTCG-AGGTCGATAA.sam
gzip F2A-72-GTGTACGTCG-AGGTCGATAA_S5_L001_R1_001.fastq
gzip F2A-72-GTGTACGTCG-AGGTCGATAA_S5_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-73-ACCTCATTGA-TCTTGTACGT_S11_L001_R1_001.fastq.gz
gunzip F2A-73-ACCTCATTGA-TCTTGTACGT_S11_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-73-ACCTCATTGA-TCTTGTACGT_S11_L001_R1_001.fastq F2A-73-ACCTCATTGA-TCTTGTACGT_S11_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-73-ACCTCATTGA-TCTTGTACGT.sam
gzip F2A-73-ACCTCATTGA-TCTTGTACGT_S11_L001_R1_001.fastq
gzip F2A-73-ACCTCATTGA-TCTTGTACGT_S11_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-73-AGTCCTAGGC-AGCCGTTCTC_S184_L001_R1_001.fastq.gz
gunzip F2A-73-AGTCCTAGGC-AGCCGTTCTC_S184_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-73-AGTCCTAGGC-AGCCGTTCTC_S184_L001_R1_001.fastq F2A-73-AGTCCTAGGC-AGCCGTTCTC_S184_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-73-AGTCCTAGGC-AGCCGTTCTC.sam
gzip F2A-73-AGTCCTAGGC-AGCCGTTCTC_S184_L001_R1_001.fastq
gzip F2A-73-AGTCCTAGGC-AGCCGTTCTC_S184_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-74_S18_L001_R1_001.fastq.gz
gunzip F2A-74_S18_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-74_S18_L001_R1_001.fastq F2A-74_S18_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-74.sam
gzip F2A-74_S18_L001_R1_001.fastq
gzip F2A-74_S18_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-75_S22_L001_R1_001.fastq.gz
gunzip F2A-75_S22_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-75_S22_L001_R1_001.fastq F2A-75_S22_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-75.sam
gzip F2A-75_S22_L001_R1_001.fastq
gzip F2A-75_S22_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-76-AGTCAACCAT-GCTTGTGCCA_S188_L001_R1_001.fastq.gz
gunzip F2A-76-AGTCAACCAT-GCTTGTGCCA_S188_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-76-AGTCAACCAT-GCTTGTGCCA_S188_L001_R1_001.fastq F2A-76-AGTCAACCAT-GCTTGTGCCA_S188_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-76-AGTCAACCAT-GCTTGTGCCA.sam
gzip F2A-76-AGTCAACCAT-GCTTGTGCCA_S188_L001_R1_001.fastq
gzip F2A-76-AGTCAACCAT-GCTTGTGCCA_S188_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-76-GCATCATTGC-CTCAACGGAG_S28_L001_R1_001.fastq.gz
gunzip F2A-76-GCATCATTGC-CTCAACGGAG_S28_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-76-GCATCATTGC-CTCAACGGAG_S28_L001_R1_001.fastq F2A-76-GCATCATTGC-CTCAACGGAG_S28_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-76-GCATCATTGC-CTCAACGGAG.sam
gzip F2A-76-GCATCATTGC-CTCAACGGAG_S28_L001_R1_001.fastq
gzip F2A-76-GCATCATTGC-CTCAACGGAG_S28_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-77-GCAATGGATT-AACCATCGGA_S35_L001_R1_001.fastq.gz
gunzip F2A-77-GCAATGGATT-AACCATCGGA_S35_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-77-GCAATGGATT-AACCATCGGA_S35_L001_R1_001.fastq F2A-77-GCAATGGATT-AACCATCGGA_S35_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-77-GCAATGGATT-AACCATCGGA.sam
gzip F2A-77-GCAATGGATT-AACCATCGGA_S35_L001_R1_001.fastq
gzip F2A-77-GCAATGGATT-AACCATCGGA_S35_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-77-GCCATATCCA-ATACGCGCCA_S192_L001_R1_001.fastq.gz
gunzip F2A-77-GCCATATCCA-ATACGCGCCA_S192_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-77-GCCATATCCA-ATACGCGCCA_S192_L001_R1_001.fastq F2A-77-GCCATATCCA-ATACGCGCCA_S192_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-77-GCCATATCCA-ATACGCGCCA.sam
gzip F2A-77-GCCATATCCA-ATACGCGCCA_S192_L001_R1_001.fastq
gzip F2A-77-GCCATATCCA-ATACGCGCCA_S192_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-78-AGCACGCAAC-AACGATGAGG_S41_L001_R1_001.fastq.gz
gunzip F2A-78-AGCACGCAAC-AACGATGAGG_S41_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-78-AGCACGCAAC-AACGATGAGG_S41_L001_R1_001.fastq F2A-78-AGCACGCAAC-AACGATGAGG_S41_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-78-AGCACGCAAC-AACGATGAGG.sam
gzip F2A-78-AGCACGCAAC-AACGATGAGG_S41_L001_R1_001.fastq
gzip F2A-78-AGCACGCAAC-AACGATGAGG_S41_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-78-AGTTGGTTGT-ACCATCTTGT_S196_L001_R1_001.fastq.gz
gunzip F2A-78-AGTTGGTTGT-ACCATCTTGT_S196_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-78-AGTTGGTTGT-ACCATCTTGT_S196_L001_R1_001.fastq F2A-78-AGTTGGTTGT-ACCATCTTGT_S196_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-78-AGTTGGTTGT-ACCATCTTGT.sam
gzip F2A-78-AGTTGGTTGT-ACCATCTTGT_S196_L001_R1_001.fastq
gzip F2A-78-AGTTGGTTGT-ACCATCTTGT_S196_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-79_S199_L001_R1_001.fastq.gz
gunzip F2A-79_S199_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-79_S199_L001_R1_001.fastq F2A-79_S199_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-79.sam
gzip F2A-79_S199_L001_R1_001.fastq
gzip F2A-79_S199_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-7-TCAGCGATAA-CCAATCCTAA_S186_L001_R1_001.fastq.gz
gunzip F2A-7-TCAGCGATAA-CCAATCCTAA_S186_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-7-TCAGCGATAA-CCAATCCTAA_S186_L001_R1_001.fastq F2A-7-TCAGCGATAA-CCAATCCTAA_S186_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-7-TCAGCGATAA-CCAATCCTAA.sam
gzip F2A-7-TCAGCGATAA-CCAATCCTAA_S186_L001_R1_001.fastq
gzip F2A-7-TCAGCGATAA-CCAATCCTAA_S186_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-7-TCATTCCGAA-ACTACCTTAC_S24_L001_R1_001.fastq.gz
gunzip F2A-7-TCATTCCGAA-ACTACCTTAC_S24_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-7-TCATTCCGAA-ACTACCTTAC_S24_L001_R1_001.fastq F2A-7-TCATTCCGAA-ACTACCTTAC_S24_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-7-TCATTCCGAA-ACTACCTTAC.sam
gzip F2A-7-TCATTCCGAA-ACTACCTTAC_S24_L001_R1_001.fastq
gzip F2A-7-TCATTCCGAA-ACTACCTTAC_S24_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-80_S47_L001_R1_001.fastq.gz
gunzip F2A-80_S47_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-80_S47_L001_R1_001.fastq F2A-80_S47_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-80.sam
gzip F2A-80_S47_L001_R1_001.fastq
gzip F2A-80_S47_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-81_S52_L001_R1_001.fastq.gz
gunzip F2A-81_S52_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-81_S52_L001_R1_001.fastq F2A-81_S52_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-81.sam
gzip F2A-81_S52_L001_R1_001.fastq
gzip F2A-81_S52_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-82_S57_L001_R1_001.fastq.gz
gunzip F2A-82_S57_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-82_S57_L001_R1_001.fastq F2A-82_S57_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-82.sam
gzip F2A-82_S57_L001_R1_001.fastq
gzip F2A-82_S57_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-83_S64_L001_R1_001.fastq.gz
gunzip F2A-83_S64_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-83_S64_L001_R1_001.fastq F2A-83_S64_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-83.sam
gzip F2A-83_S64_L001_R1_001.fastq
gzip F2A-83_S64_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-84_S71_L001_R1_001.fastq.gz
gunzip F2A-84_S71_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-84_S71_L001_R1_001.fastq F2A-84_S71_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-84.sam
gzip F2A-84_S71_L001_R1_001.fastq
gzip F2A-84_S71_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-85_S6_L001_R1_001.fastq.gz
gunzip F2A-85_S6_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-85_S6_L001_R1_001.fastq F2A-85_S6_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-85.sam
gzip F2A-85_S6_L001_R1_001.fastq
gzip F2A-85_S6_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-86_S12_L001_R1_001.fastq.gz
gunzip F2A-86_S12_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-86_S12_L001_R1_001.fastq F2A-86_S12_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-86.sam
gzip F2A-86_S12_L001_R1_001.fastq
gzip F2A-86_S12_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-87_S202_L001_R1_001.fastq.gz
gunzip F2A-87_S202_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-87_S202_L001_R1_001.fastq F2A-87_S202_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-87.sam
gzip F2A-87_S202_L001_R1_001.fastq
gzip F2A-87_S202_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-88_S23_L001_R1_001.fastq.gz
gunzip F2A-88_S23_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-88_S23_L001_R1_001.fastq F2A-88_S23_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-88.sam
gzip F2A-88_S23_L001_R1_001.fastq
gzip F2A-88_S23_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-89_S29_L001_R1_001.fastq.gz
gunzip F2A-89_S29_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-89_S29_L001_R1_001.fastq F2A-89_S29_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-89.sam
gzip F2A-89_S29_L001_R1_001.fastq
gzip F2A-89_S29_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-8_S30_L001_R1_001.fastq.gz
gunzip F2A-8_S30_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-8_S30_L001_R1_001.fastq F2A-8_S30_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-8.sam
gzip F2A-8_S30_L001_R1_001.fastq
gzip F2A-8_S30_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-90_S205_L001_R1_001.fastq.gz
gunzip F2A-90_S205_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-90_S205_L001_R1_001.fastq F2A-90_S205_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-90.sam
gzip F2A-90_S205_L001_R1_001.fastq
gzip F2A-90_S205_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-91_S36_L001_R1_001.fastq.gz
gunzip F2A-91_S36_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-91_S36_L001_R1_001.fastq F2A-91_S36_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-91.sam
gzip F2A-91_S36_L001_R1_001.fastq
gzip F2A-91_S36_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2A-9_S37_L001_R1_001.fastq.gz
gunzip F2A-9_S37_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2A-9_S37_L001_R1_001.fastq F2A-9_S37_L001_R2_001.fastq  > $wkdir/02_bwa/F2A-9.sam
gzip F2A-9_S37_L001_R1_001.fastq
gzip F2A-9_S37_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-10_S149_L001_R1_001.fastq.gz
gunzip F2B-10_S149_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-10_S149_L001_R1_001.fastq F2B-10_S149_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-10.sam
gzip F2B-10_S149_L001_R1_001.fastq
gzip F2B-10_S149_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-11_S156_L001_R1_001.fastq.gz
gunzip F2B-11_S156_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-11_S156_L001_R1_001.fastq F2B-11_S156_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-11.sam
gzip F2B-11_S156_L001_R1_001.fastq
gzip F2B-11_S156_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-12_S74_L001_R1_001.fastq.gz
gunzip F2B-12_S74_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-12_S74_L001_R1_001.fastq F2B-12_S74_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-12.sam
gzip F2B-12_S74_L001_R1_001.fastq
gzip F2B-12_S74_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-13_S82_L001_R1_001.fastq.gz
gunzip F2B-13_S82_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-13_S82_L001_R1_001.fastq F2B-13_S82_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-13.sam
gzip F2B-13_S82_L001_R1_001.fastq
gzip F2B-13_S82_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-14_S90_L001_R1_001.fastq.gz
gunzip F2B-14_S90_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-14_S90_L001_R1_001.fastq F2B-14_S90_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-14.sam
gzip F2B-14_S90_L001_R1_001.fastq
gzip F2B-14_S90_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-15-CCATCTTCCG-CCTGTCACCA_S98_L001_R1_001.fastq.gz
gunzip F2B-15-CCATCTTCCG-CCTGTCACCA_S98_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-15-CCATCTTCCG-CCTGTCACCA_S98_L001_R1_001.fastq F2B-15-CCATCTTCCG-CCTGTCACCA_S98_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-15-CCATCTTCCG-CCTGTCACCA.sam
gzip F2B-15-CCATCTTCCG-CCTGTCACCA_S98_L001_R1_001.fastq
gzip F2B-15-CCATCTTCCG-CCTGTCACCA_S98_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-15-CCGTAGATTA-TAAGTGCCAG_S173_L001_R1_001.fastq.gz
gunzip F2B-15-CCGTAGATTA-TAAGTGCCAG_S173_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-15-CCGTAGATTA-TAAGTGCCAG_S173_L001_R1_001.fastq F2B-15-CCGTAGATTA-TAAGTGCCAG_S173_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-15-CCGTAGATTA-TAAGTGCCAG.sam
gzip F2B-15-CCGTAGATTA-TAAGTGCCAG_S173_L001_R1_001.fastq
gzip F2B-15-CCGTAGATTA-TAAGTGCCAG_S173_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-16_S106_L001_R1_001.fastq.gz
gunzip F2B-16_S106_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-16_S106_L001_R1_001.fastq F2B-16_S106_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-16.sam
gzip F2B-16_S106_L001_R1_001.fastq
gzip F2B-16_S106_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-17-CTTCGTTCCG-AGGCGATGGT_S177_L001_R1_001.fastq.gz
gunzip F2B-17-CTTCGTTCCG-AGGCGATGGT_S177_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-17-CTTCGTTCCG-AGGCGATGGT_S177_L001_R1_001.fastq F2B-17-CTTCGTTCCG-AGGCGATGGT_S177_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-17-CTTCGTTCCG-AGGCGATGGT.sam
gzip F2B-17-CTTCGTTCCG-AGGCGATGGT_S177_L001_R1_001.fastq
gzip F2B-17-CTTCGTTCCG-AGGCGATGGT_S177_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-17-TCCGTGTATT-ATTAACCAGC_S114_L001_R1_001.fastq.gz
gunzip F2B-17-TCCGTGTATT-ATTAACCAGC_S114_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-17-TCCGTGTATT-ATTAACCAGC_S114_L001_R1_001.fastq F2B-17-TCCGTGTATT-ATTAACCAGC_S114_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-17-TCCGTGTATT-ATTAACCAGC.sam
gzip F2B-17-TCCGTGTATT-ATTAACCAGC_S114_L001_R1_001.fastq
gzip F2B-17-TCCGTGTATT-ATTAACCAGC_S114_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-18_S122_L001_R1_001.fastq.gz
gunzip F2B-18_S122_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-18_S122_L001_R1_001.fastq F2B-18_S122_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-18.sam
gzip F2B-18_S122_L001_R1_001.fastq
gzip F2B-18_S122_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-19_S130_L001_R1_001.fastq.gz
gunzip F2B-19_S130_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-19_S130_L001_R1_001.fastq F2B-19_S130_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-19.sam
gzip F2B-19_S130_L001_R1_001.fastq
gzip F2B-19_S130_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-1_S89_L001_R1_001.fastq.gz
gunzip F2B-1_S89_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-1_S89_L001_R1_001.fastq F2B-1_S89_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-1.sam
gzip F2B-1_S89_L001_R1_001.fastq
gzip F2B-1_S89_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-20_S137_L001_R1_001.fastq.gz
gunzip F2B-20_S137_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-20_S137_L001_R1_001.fastq F2B-20_S137_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-20.sam
gzip F2B-20_S137_L001_R1_001.fastq
gzip F2B-20_S137_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-21-CTTATCGAAC-GCCAGATACG_S143_L001_R1_001.fastq.gz
gunzip F2B-21-CTTATCGAAC-GCCAGATACG_S143_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-21-CTTATCGAAC-GCCAGATACG_S143_L001_R1_001.fastq F2B-21-CTTATCGAAC-GCCAGATACG_S143_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-21-CTTATCGAAC-GCCAGATACG.sam
gzip F2B-21-CTTATCGAAC-GCCAGATACG_S143_L001_R1_001.fastq
gzip F2B-21-CTTATCGAAC-GCCAGATACG_S143_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-21-GATGAGGCAG-CCTGCCATAG_S181_L001_R1_001.fastq.gz
gunzip F2B-21-GATGAGGCAG-CCTGCCATAG_S181_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-21-GATGAGGCAG-CCTGCCATAG_S181_L001_R1_001.fastq F2B-21-GATGAGGCAG-CCTGCCATAG_S181_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-21-GATGAGGCAG-CCTGCCATAG.sam
gzip F2B-21-GATGAGGCAG-CCTGCCATAG_S181_L001_R1_001.fastq
gzip F2B-21-GATGAGGCAG-CCTGCCATAG_S181_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-22_S150_L001_R1_001.fastq.gz
gunzip F2B-22_S150_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-22_S150_L001_R1_001.fastq F2B-22_S150_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-22.sam
gzip F2B-22_S150_L001_R1_001.fastq
gzip F2B-22_S150_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-23_S157_L001_R1_001.fastq.gz
gunzip F2B-23_S157_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-23_S157_L001_R1_001.fastq F2B-23_S157_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-23.sam
gzip F2B-23_S157_L001_R1_001.fastq
gzip F2B-23_S157_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-24_S75_L001_R1_001.fastq.gz
gunzip F2B-24_S75_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-24_S75_L001_R1_001.fastq F2B-24_S75_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-24.sam
gzip F2B-24_S75_L001_R1_001.fastq
gzip F2B-24_S75_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-25_S83_L001_R1_001.fastq.gz
gunzip F2B-25_S83_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-25_S83_L001_R1_001.fastq F2B-25_S83_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-25.sam
gzip F2B-25_S83_L001_R1_001.fastq
gzip F2B-25_S83_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-26_S91_L001_R1_001.fastq.gz
gunzip F2B-26_S91_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-26_S91_L001_R1_001.fastq F2B-26_S91_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-26.sam
gzip F2B-26_S91_L001_R1_001.fastq
gzip F2B-26_S91_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-27_S99_L001_R1_001.fastq.gz
gunzip F2B-27_S99_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-27_S99_L001_R1_001.fastq F2B-27_S99_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-27.sam
gzip F2B-27_S99_L001_R1_001.fastq
gzip F2B-27_S99_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-28_S107_L001_R1_001.fastq.gz
gunzip F2B-28_S107_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-28_S107_L001_R1_001.fastq F2B-28_S107_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-28.sam
gzip F2B-28_S107_L001_R1_001.fastq
gzip F2B-28_S107_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-29_S115_L001_R1_001.fastq.gz
gunzip F2B-29_S115_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-29_S115_L001_R1_001.fastq F2B-29_S115_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-29.sam
gzip F2B-29_S115_L001_R1_001.fastq
gzip F2B-29_S115_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-2_S97_L001_R1_001.fastq.gz
gunzip F2B-2_S97_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-2_S97_L001_R1_001.fastq F2B-2_S97_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-2.sam
gzip F2B-2_S97_L001_R1_001.fastq
gzip F2B-2_S97_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-30_S123_L001_R1_001.fastq.gz
gunzip F2B-30_S123_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-30_S123_L001_R1_001.fastq F2B-30_S123_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-30.sam
gzip F2B-30_S123_L001_R1_001.fastq
gzip F2B-30_S123_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-31_S131_L001_R1_001.fastq.gz
gunzip F2B-31_S131_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-31_S131_L001_R1_001.fastq F2B-31_S131_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-31.sam
gzip F2B-31_S131_L001_R1_001.fastq
gzip F2B-31_S131_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-32_S138_L001_R1_001.fastq.gz
gunzip F2B-32_S138_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-32_S138_L001_R1_001.fastq F2B-32_S138_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-32.sam
gzip F2B-32_S138_L001_R1_001.fastq
gzip F2B-32_S138_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-33_S144_L001_R1_001.fastq.gz
gunzip F2B-33_S144_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-33_S144_L001_R1_001.fastq F2B-33_S144_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-33.sam
gzip F2B-33_S144_L001_R1_001.fastq
gzip F2B-33_S144_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-34_S151_L001_R1_001.fastq.gz
gunzip F2B-34_S151_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-34_S151_L001_R1_001.fastq F2B-34_S151_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-34.sam
gzip F2B-34_S151_L001_R1_001.fastq
gzip F2B-34_S151_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-35_S158_L001_R1_001.fastq.gz
gunzip F2B-35_S158_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-35_S158_L001_R1_001.fastq F2B-35_S158_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-35.sam
gzip F2B-35_S158_L001_R1_001.fastq
gzip F2B-35_S158_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-36_S76_L001_R1_001.fastq.gz
gunzip F2B-36_S76_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-36_S76_L001_R1_001.fastq F2B-36_S76_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-36.sam
gzip F2B-36_S76_L001_R1_001.fastq
gzip F2B-36_S76_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-37_S84_L001_R1_001.fastq.gz
gunzip F2B-37_S84_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-37_S84_L001_R1_001.fastq F2B-37_S84_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-37.sam
gzip F2B-37_S84_L001_R1_001.fastq
gzip F2B-37_S84_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-38_S92_L001_R1_001.fastq.gz
gunzip F2B-38_S92_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-38_S92_L001_R1_001.fastq F2B-38_S92_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-38.sam
gzip F2B-38_S92_L001_R1_001.fastq
gzip F2B-38_S92_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-39_S100_L001_R1_001.fastq.gz
gunzip F2B-39_S100_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-39_S100_L001_R1_001.fastq F2B-39_S100_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-39.sam
gzip F2B-39_S100_L001_R1_001.fastq
gzip F2B-39_S100_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-40_S108_L001_R1_001.fastq.gz
gunzip F2B-40_S108_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-40_S108_L001_R1_001.fastq F2B-40_S108_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-40.sam
gzip F2B-40_S108_L001_R1_001.fastq
gzip F2B-40_S108_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-41_S116_L001_R1_001.fastq.gz
gunzip F2B-41_S116_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-41_S116_L001_R1_001.fastq F2B-41_S116_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-41.sam
gzip F2B-41_S116_L001_R1_001.fastq
gzip F2B-41_S116_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-42_S124_L001_R1_001.fastq.gz
gunzip F2B-42_S124_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-42_S124_L001_R1_001.fastq F2B-42_S124_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-42.sam
gzip F2B-42_S124_L001_R1_001.fastq
gzip F2B-42_S124_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-43_S185_L001_R1_001.fastq.gz
gunzip F2B-43_S185_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-43_S185_L001_R1_001.fastq F2B-43_S185_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-43.sam
gzip F2B-43_S185_L001_R1_001.fastq
gzip F2B-43_S185_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-44_S189_L001_R1_001.fastq.gz
gunzip F2B-44_S189_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-44_S189_L001_R1_001.fastq F2B-44_S189_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-44.sam
gzip F2B-44_S189_L001_R1_001.fastq
gzip F2B-44_S189_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-45_S145_L001_R1_001.fastq.gz
gunzip F2B-45_S145_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-45_S145_L001_R1_001.fastq F2B-45_S145_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-45.sam
gzip F2B-45_S145_L001_R1_001.fastq
gzip F2B-45_S145_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-46_S152_L001_R1_001.fastq.gz
gunzip F2B-46_S152_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-46_S152_L001_R1_001.fastq F2B-46_S152_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-46.sam
gzip F2B-46_S152_L001_R1_001.fastq
gzip F2B-46_S152_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-47_S159_L001_R1_001.fastq.gz
gunzip F2B-47_S159_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-47_S159_L001_R1_001.fastq F2B-47_S159_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-47.sam
gzip F2B-47_S159_L001_R1_001.fastq
gzip F2B-47_S159_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-48_S77_L001_R1_001.fastq.gz
gunzip F2B-48_S77_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-48_S77_L001_R1_001.fastq F2B-48_S77_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-48.sam
gzip F2B-48_S77_L001_R1_001.fastq
gzip F2B-48_S77_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-49_S85_L001_R1_001.fastq.gz
gunzip F2B-49_S85_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-49_S85_L001_R1_001.fastq F2B-49_S85_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-49.sam
gzip F2B-49_S85_L001_R1_001.fastq
gzip F2B-49_S85_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-4_S105_L001_R1_001.fastq.gz
gunzip F2B-4_S105_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-4_S105_L001_R1_001.fastq F2B-4_S105_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-4.sam
gzip F2B-4_S105_L001_R1_001.fastq
gzip F2B-4_S105_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-50_S93_L001_R1_001.fastq.gz
gunzip F2B-50_S93_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-50_S93_L001_R1_001.fastq F2B-50_S93_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-50.sam
gzip F2B-50_S93_L001_R1_001.fastq
gzip F2B-50_S93_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-51_S101_L001_R1_001.fastq.gz
gunzip F2B-51_S101_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-51_S101_L001_R1_001.fastq F2B-51_S101_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-51.sam
gzip F2B-51_S101_L001_R1_001.fastq
gzip F2B-51_S101_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-52_S109_L001_R1_001.fastq.gz
gunzip F2B-52_S109_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-52_S109_L001_R1_001.fastq F2B-52_S109_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-52.sam
gzip F2B-52_S109_L001_R1_001.fastq
gzip F2B-52_S109_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-53_S117_L001_R1_001.fastq.gz
gunzip F2B-53_S117_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-53_S117_L001_R1_001.fastq F2B-53_S117_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-53.sam
gzip F2B-53_S117_L001_R1_001.fastq
gzip F2B-53_S117_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-54_S125_L001_R1_001.fastq.gz
gunzip F2B-54_S125_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-54_S125_L001_R1_001.fastq F2B-54_S125_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-54.sam
gzip F2B-54_S125_L001_R1_001.fastq
gzip F2B-54_S125_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-55_S132_L001_R1_001.fastq.gz
gunzip F2B-55_S132_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-55_S132_L001_R1_001.fastq F2B-55_S132_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-55.sam
gzip F2B-55_S132_L001_R1_001.fastq
gzip F2B-55_S132_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-56_S139_L001_R1_001.fastq.gz
gunzip F2B-56_S139_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-56_S139_L001_R1_001.fastq F2B-56_S139_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-56.sam
gzip F2B-56_S139_L001_R1_001.fastq
gzip F2B-56_S139_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-57_S146_L001_R1_001.fastq.gz
gunzip F2B-57_S146_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-57_S146_L001_R1_001.fastq F2B-57_S146_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-57.sam
gzip F2B-57_S146_L001_R1_001.fastq
gzip F2B-57_S146_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-58_S153_L001_R1_001.fastq.gz
gunzip F2B-58_S153_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-58_S153_L001_R1_001.fastq F2B-58_S153_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-58.sam
gzip F2B-58_S153_L001_R1_001.fastq
gzip F2B-58_S153_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-59_S160_L001_R1_001.fastq.gz
gunzip F2B-59_S160_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-59_S160_L001_R1_001.fastq F2B-59_S160_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-59.sam
gzip F2B-59_S160_L001_R1_001.fastq
gzip F2B-59_S160_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-5_S113_L001_R1_001.fastq.gz
gunzip F2B-5_S113_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-5_S113_L001_R1_001.fastq F2B-5_S113_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-5.sam
gzip F2B-5_S113_L001_R1_001.fastq
gzip F2B-5_S113_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-60_S78_L001_R1_001.fastq.gz
gunzip F2B-60_S78_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-60_S78_L001_R1_001.fastq F2B-60_S78_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-60.sam
gzip F2B-60_S78_L001_R1_001.fastq
gzip F2B-60_S78_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-61_S86_L001_R1_001.fastq.gz
gunzip F2B-61_S86_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-61_S86_L001_R1_001.fastq F2B-61_S86_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-61.sam
gzip F2B-61_S86_L001_R1_001.fastq
gzip F2B-61_S86_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-62_S94_L001_R1_001.fastq.gz
gunzip F2B-62_S94_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-62_S94_L001_R1_001.fastq F2B-62_S94_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-62.sam
gzip F2B-62_S94_L001_R1_001.fastq
gzip F2B-62_S94_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-63_S102_L001_R1_001.fastq.gz
gunzip F2B-63_S102_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-63_S102_L001_R1_001.fastq F2B-63_S102_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-63.sam
gzip F2B-63_S102_L001_R1_001.fastq
gzip F2B-63_S102_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-64_S110_L001_R1_001.fastq.gz
gunzip F2B-64_S110_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-64_S110_L001_R1_001.fastq F2B-64_S110_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-64.sam
gzip F2B-64_S110_L001_R1_001.fastq
gzip F2B-64_S110_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-65_S118_L001_R1_001.fastq.gz
gunzip F2B-65_S118_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-65_S118_L001_R1_001.fastq F2B-65_S118_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-65.sam
gzip F2B-65_S118_L001_R1_001.fastq
gzip F2B-65_S118_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-66_S126_L001_R1_001.fastq.gz
gunzip F2B-66_S126_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-66_S126_L001_R1_001.fastq F2B-66_S126_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-66.sam
gzip F2B-66_S126_L001_R1_001.fastq
gzip F2B-66_S126_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-67_S133_L001_R1_001.fastq.gz
gunzip F2B-67_S133_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-67_S133_L001_R1_001.fastq F2B-67_S133_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-67.sam
gzip F2B-67_S133_L001_R1_001.fastq
gzip F2B-67_S133_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-68_S140_L001_R1_001.fastq.gz
gunzip F2B-68_S140_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-68_S140_L001_R1_001.fastq F2B-68_S140_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-68.sam
gzip F2B-68_S140_L001_R1_001.fastq
gzip F2B-68_S140_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-69_S147_L001_R1_001.fastq.gz
gunzip F2B-69_S147_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-69_S147_L001_R1_001.fastq F2B-69_S147_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-69.sam
gzip F2B-69_S147_L001_R1_001.fastq
gzip F2B-69_S147_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-6_S121_L001_R1_001.fastq.gz
gunzip F2B-6_S121_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-6_S121_L001_R1_001.fastq F2B-6_S121_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-6.sam
gzip F2B-6_S121_L001_R1_001.fastq
gzip F2B-6_S121_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-70_S154_L001_R1_001.fastq.gz
gunzip F2B-70_S154_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-70_S154_L001_R1_001.fastq F2B-70_S154_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-70.sam
gzip F2B-70_S154_L001_R1_001.fastq
gzip F2B-70_S154_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-71_S161_L001_R1_001.fastq.gz
gunzip F2B-71_S161_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-71_S161_L001_R1_001.fastq F2B-71_S161_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-71.sam
gzip F2B-71_S161_L001_R1_001.fastq
gzip F2B-71_S161_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-72_S79_L001_R1_001.fastq.gz
gunzip F2B-72_S79_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-72_S79_L001_R1_001.fastq F2B-72_S79_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-72.sam
gzip F2B-72_S79_L001_R1_001.fastq
gzip F2B-72_S79_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-73_S87_L001_R1_001.fastq.gz
gunzip F2B-73_S87_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-73_S87_L001_R1_001.fastq F2B-73_S87_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-73.sam
gzip F2B-73_S87_L001_R1_001.fastq
gzip F2B-73_S87_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-74_S95_L001_R1_001.fastq.gz
gunzip F2B-74_S95_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-74_S95_L001_R1_001.fastq F2B-74_S95_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-74.sam
gzip F2B-74_S95_L001_R1_001.fastq
gzip F2B-74_S95_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-75_S103_L001_R1_001.fastq.gz
gunzip F2B-75_S103_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-75_S103_L001_R1_001.fastq F2B-75_S103_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-75.sam
gzip F2B-75_S103_L001_R1_001.fastq
gzip F2B-75_S103_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-76_S111_L001_R1_001.fastq.gz
gunzip F2B-76_S111_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-76_S111_L001_R1_001.fastq F2B-76_S111_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-76.sam
gzip F2B-76_S111_L001_R1_001.fastq
gzip F2B-76_S111_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-77_S119_L001_R1_001.fastq.gz
gunzip F2B-77_S119_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-77_S119_L001_R1_001.fastq F2B-77_S119_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-77.sam
gzip F2B-77_S119_L001_R1_001.fastq
gzip F2B-77_S119_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-78_S127_L001_R1_001.fastq.gz
gunzip F2B-78_S127_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-78_S127_L001_R1_001.fastq F2B-78_S127_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-78.sam
gzip F2B-78_S127_L001_R1_001.fastq
gzip F2B-78_S127_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-79_S134_L001_R1_001.fastq.gz
gunzip F2B-79_S134_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-79_S134_L001_R1_001.fastq F2B-79_S134_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-79.sam
gzip F2B-79_S134_L001_R1_001.fastq
gzip F2B-79_S134_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-7_S129_L001_R1_001.fastq.gz
gunzip F2B-7_S129_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-7_S129_L001_R1_001.fastq F2B-7_S129_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-7.sam
gzip F2B-7_S129_L001_R1_001.fastq
gzip F2B-7_S129_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-80_S141_L001_R1_001.fastq.gz
gunzip F2B-80_S141_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-80_S141_L001_R1_001.fastq F2B-80_S141_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-80.sam
gzip F2B-80_S141_L001_R1_001.fastq
gzip F2B-80_S141_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-81_S148_L001_R1_001.fastq.gz
gunzip F2B-81_S148_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-81_S148_L001_R1_001.fastq F2B-81_S148_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-81.sam
gzip F2B-81_S148_L001_R1_001.fastq
gzip F2B-81_S148_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-82_S155_L001_R1_001.fastq.gz
gunzip F2B-82_S155_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-82_S155_L001_R1_001.fastq F2B-82_S155_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-82.sam
gzip F2B-82_S155_L001_R1_001.fastq
gzip F2B-82_S155_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-83_S193_L001_R1_001.fastq.gz
gunzip F2B-83_S193_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-83_S193_L001_R1_001.fastq F2B-83_S193_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-83.sam
gzip F2B-83_S193_L001_R1_001.fastq
gzip F2B-83_S193_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-84_S80_L001_R1_001.fastq.gz
gunzip F2B-84_S80_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-84_S80_L001_R1_001.fastq F2B-84_S80_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-84.sam
gzip F2B-84_S80_L001_R1_001.fastq
gzip F2B-84_S80_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-85_S88_L001_R1_001.fastq.gz
gunzip F2B-85_S88_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-85_S88_L001_R1_001.fastq F2B-85_S88_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-85.sam
gzip F2B-85_S88_L001_R1_001.fastq
gzip F2B-85_S88_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-86_S96_L001_R1_001.fastq.gz
gunzip F2B-86_S96_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-86_S96_L001_R1_001.fastq F2B-86_S96_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-86.sam
gzip F2B-86_S96_L001_R1_001.fastq
gzip F2B-86_S96_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-87_S104_L001_R1_001.fastq.gz
gunzip F2B-87_S104_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-87_S104_L001_R1_001.fastq F2B-87_S104_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-87.sam
gzip F2B-87_S104_L001_R1_001.fastq
gzip F2B-87_S104_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-88_S112_L001_R1_001.fastq.gz
gunzip F2B-88_S112_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-88_S112_L001_R1_001.fastq F2B-88_S112_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-88.sam
gzip F2B-88_S112_L001_R1_001.fastq
gzip F2B-88_S112_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-89_S120_L001_R1_001.fastq.gz
gunzip F2B-89_S120_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-89_S120_L001_R1_001.fastq F2B-89_S120_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-89.sam
gzip F2B-89_S120_L001_R1_001.fastq
gzip F2B-89_S120_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-8_S136_L001_R1_001.fastq.gz
gunzip F2B-8_S136_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-8_S136_L001_R1_001.fastq F2B-8_S136_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-8.sam
gzip F2B-8_S136_L001_R1_001.fastq
gzip F2B-8_S136_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-90_S128_L001_R1_001.fastq.gz
gunzip F2B-90_S128_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-90_S128_L001_R1_001.fastq F2B-90_S128_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-90.sam
gzip F2B-90_S128_L001_R1_001.fastq
gzip F2B-90_S128_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-91_S135_L001_R1_001.fastq.gz
gunzip F2B-91_S135_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-91_S135_L001_R1_001.fastq F2B-91_S135_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-91.sam
gzip F2B-91_S135_L001_R1_001.fastq
gzip F2B-91_S135_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip F2B-9_S142_L001_R1_001.fastq.gz
gunzip F2B-9_S142_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome F2B-9_S142_L001_R1_001.fastq F2B-9_S142_L001_R2_001.fastq  > $wkdir/02_bwa/F2B-9.sam
gzip F2B-9_S142_L001_R1_001.fastq
gzip F2B-9_S142_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip NKZ35-5_S58_L001_R1_001.fastq.gz
gunzip NKZ35-5_S58_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome NKZ35-5_S58_L001_R1_001.fastq NKZ35-5_S58_L001_R2_001.fastq  > $wkdir/02_bwa/NKZ35-5.sam
gzip NKZ35-5_S58_L001_R1_001.fastq
gzip NKZ35-5_S58_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip NKZ35-6_S65_L001_R1_001.fastq.gz
gunzip NKZ35-6_S65_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome NKZ35-6_S65_L001_R1_001.fastq NKZ35-6_S65_L001_R2_001.fastq  > $wkdir/02_bwa/NKZ35-6.sam
gzip NKZ35-6_S65_L001_R1_001.fastq
gzip NKZ35-6_S65_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip NKZ35-7_S72_L001_R1_001.fastq.gz
gunzip NKZ35-7_S72_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome NKZ35-7_S72_L001_R1_001.fastq NKZ35-7_S72_L001_R2_001.fastq  > $wkdir/02_bwa/NKZ35-7.sam
gzip NKZ35-7_S72_L001_R1_001.fastq
gzip NKZ35-7_S72_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip Undetermined_S0_L001_R1_001.fastq.gz
gunzip Undetermined_S0_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome Undetermined_S0_L001_R1_001.fastq Undetermined_S0_L001_R2_001.fastq  > $wkdir/02_bwa/Undetermined.sam
gzip Undetermined_S0_L001_R1_001.fastq
gzip Undetermined_S0_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip WOU9-2_S165_L001_R1_001.fastq.gz
gunzip WOU9-2_S165_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome WOU9-2_S165_L001_R1_001.fastq WOU9-2_S165_L001_R2_001.fastq  > $wkdir/02_bwa/WOU9-2.sam
gzip WOU9-2_S165_L001_R1_001.fastq
gzip WOU9-2_S165_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip WOU9-3_S169_L001_R1_001.fastq.gz
gunzip WOU9-3_S169_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome WOU9-3_S169_L001_R1_001.fastq WOU9-3_S169_L001_R2_001.fastq  > $wkdir/02_bwa/WOU9-3.sam
gzip WOU9-3_S169_L001_R1_001.fastq
gzip WOU9-3_S169_L001_R2_001.fastq
#!/bin/sh
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=bwa_%J_stdout.txt
#SBATCH --error=bwa_%J_stderr.txt
#SBATCH --time=12:00:00
#SBATCH --job-name=bwa
#
#################################################

module load BWA/0.7.13-intel-2016a

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

cd $wkdir/00_raw_seq_data/7458/
gunzip WOU9-5_S42_L001_R1_001.fastq.gz
gunzip WOU9-5_S42_L001_R2_001.fastq.gz
bwa mem -M $wkdir/inopinata_genome/inopinata_sm_genome WOU9-5_S42_L001_R1_001.fastq WOU9-5_S42_L001_R2_001.fastq  > $wkdir/02_bwa/WOU9-5.sam
gzip WOU9-5_S42_L001_R1_001.fastq
gzip WOU9-5_S42_L001_R2_001.fastq