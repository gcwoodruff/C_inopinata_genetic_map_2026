#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=SAMtools%J_stdout.txt
#SBATCH --error=SAMtools%J_stderr.txt
#SBATCH --time=6:00:00
#SBATCH --job-name=SAMtools
#
#################################################

###note, these were run in parallel, each bam file with its own script


wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

module load SAMtools/1.11-GCC-10.2.0

cd $wkdir/19_March_2024_fork/05_get_uniq_alignments/



samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F1_A-B_female.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F1_A-B_female.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F1_A_male.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F1_A_male.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F1_B_male.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F1_B_male.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-10.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-10.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-12.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-12.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-13.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-13.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-14.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-14.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-15.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-15.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-16.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-16.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-17.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-17.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-18.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-18.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-19.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-19.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-1.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-1.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-20.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-20.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-21.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-21.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-22.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-22.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-23.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-23.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-24.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-24.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-25.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-25.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-26.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-26.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-27.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-27.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-28.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-28.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-29.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-29.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-2.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-2.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-30.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-30.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-31.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-31.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-32.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-32.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-33.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-33.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-34.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-34.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-35.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-35.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-36.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-36.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-37.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-37.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-38.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-38.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-39.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-39.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-3.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-3.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-40.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-40.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-41.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-41.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-42.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-42.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-43.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-43.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-44.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-44.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-45.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-45.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-46.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-46.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-47.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-47.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-48.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-48.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-49.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-49.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-4.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-4.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-50.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-50.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-51.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-51.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-52.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-52.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-53.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-53.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-54.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-54.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-55.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-55.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-56.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-56.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-57.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-57.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-58.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-58.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-59.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-59.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-5.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-5.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-60.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-60.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-61.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-61.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-62.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-62.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-63.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-63.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-64.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-64.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-65.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-65.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-66.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-66.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-67.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-67.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-68.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-68.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-69.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-69.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-6.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-6.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-70.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-70.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-71.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-71.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-72.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-72.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-73.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-73.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-74.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-74.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-75.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-75.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-76.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-76.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-77.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-77.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-78.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-78.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-79.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-79.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-7.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-7.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-80.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-80.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-81.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-81.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-82.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-82.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-83.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-83.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-84.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-84.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-85.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-85.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-86.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-86.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-87.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-87.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-88.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-88.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-89.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-89.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-8.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-8.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-90.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-90.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-91.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-91.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2A-9.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2A-9.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-10.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-10.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-11.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-11.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-12.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-12.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-13.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-13.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-14.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-14.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-15.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-15.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-16.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-16.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-17.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-17.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-18.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-18.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-19.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-19.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-1.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-1.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-20.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-20.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-21.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-21.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-22.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-22.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-23.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-23.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-24.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-24.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-25.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-25.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-26.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-26.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-27.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-27.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-28.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-28.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-29.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-29.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-2.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-2.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-30.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-30.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-31.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-31.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-32.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-32.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-33.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-33.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-34.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-34.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-35.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-35.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-36.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-36.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-37.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-37.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-38.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-38.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-39.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-39.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-40.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-40.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-41.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-41.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-42.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-42.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-43.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-43.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-44.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-44.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-45.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-45.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-46.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-46.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-47.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-47.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-48.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-48.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-49.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-49.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-4.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-4.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-50.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-50.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-51.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-51.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-52.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-52.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-53.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-53.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-54.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-54.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-55.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-55.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-56.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-56.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-57.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-57.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-58.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-58.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-59.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-59.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-5.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-5.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-60.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-60.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-61.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-61.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-62.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-62.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-63.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-63.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-64.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-64.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-65.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-65.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-66.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-66.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-67.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-67.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-68.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-68.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-69.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-69.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-6.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-6.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-70.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-70.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-71.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-71.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-72.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-72.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-73.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-73.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-74.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-74.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-75.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-75.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-76.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-76.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-77.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-77.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-78.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-78.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-79.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-79.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-7.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-7.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-80.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-80.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-81.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-81.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-82.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-82.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-83.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-83.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-84.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-84.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-85.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-85.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-86.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-86.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-87.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-87.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-88.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-88.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-89.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-89.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-8.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-8.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-90.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-90.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-91.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-91.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/F2B-9.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed F2B-9.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/NKZ35.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed NKZ35.bam
samtools view  -F 4 -bS -q 15 -o $wkdir/19_March_2024_fork/06_samtools_view/WOU9.bam -L $wkdir/inopinata_genome/inopinata_unmasked.bed WOU9.bam