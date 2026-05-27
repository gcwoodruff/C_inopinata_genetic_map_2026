#!/bin/bash
#
#SBATCH --partition=normal
#SBATCH --ntasks=1
#SBATCH --output=AddOrReplaceReadGroups%J_stdout.txt
#SBATCH --error=AddOrReplaceReadGroups%J_stderr.txt
#SBATCH --time=4:00:00
#SBATCH --job-name=AddOrReplaceReadGroups
#
#################################################

###note, these were run in parallel, each bam file with its own script

wkdir='/ourdisk/hpc/figwormlab/gcwoodruff/dont_archive/inopinata_genetic_map_1-2024/'

module load picard/2.25.1-Java-11

cd $wkdir/19_March_2024_fork/01_MarkDuplicates/


java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F1_A-B_female.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F1_A-B_female.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F1_A-B_female
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F1_A_male.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F1_A_male.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F1_A_male
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F1_B_male.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F1_B_male.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F1_B_male
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-10.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-10.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-10
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-12.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-12.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-12
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-13.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-13.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-13
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-14.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-14.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-14
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-15.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-15.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-15
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-16.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-16.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-16
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-17.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-17.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-17
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-18.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-18.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-18
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-19.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-19.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-19
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-1.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-1.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-1
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-20.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-20.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-20
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-21.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-21.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-21
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-22.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-22.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-22
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-23.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-23.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-23
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-24.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-24.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-24
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-25.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-25.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-25
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-26.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-26.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-26
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-27.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-27.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-27
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-28.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-28.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-28
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-29.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-29.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-29
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-2.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-2.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-2
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-30.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-30.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-30
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-31.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-31.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-31
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-32.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-32.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-32
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-33.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-33.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-33
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-34.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-34.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-34
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-35.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-35.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-35
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-36.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-36.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-36
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-37.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-37.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-37
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-38.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-38.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-38
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-39.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-39.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-39
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-3.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-3.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-3
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-40.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-40.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-40
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-41.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-41.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-41
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-42.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-42.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-42
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-43.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-43.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-43
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-44.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-44.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-44
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-45.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-45.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-45
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-46.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-46.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-46
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-47.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-47.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-47
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-48.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-48.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-48
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-49.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-49.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-49
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-4.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-4.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-4
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-50.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-50.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-50
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-51.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-51.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-51
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-52.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-52.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-52
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-53.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-53.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-53
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-54.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-54.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-54
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-55.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-55.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-55
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-56.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-56.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-56
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-57.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-57.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-57
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-58.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-58.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-58
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-59.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-59.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-59
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-5.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-5.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-5
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-60.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-60.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-60
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-61.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-61.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-61
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-62.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-62.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-62
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-63.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-63.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-63
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-64.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-64.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-64
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-65.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-65.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-65
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-66.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-66.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-66
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-67.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-67.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-67
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-68.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-68.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-68
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-69.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-69.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-69
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-6.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-6.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-6
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-70.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-70.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-70
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-71.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-71.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-71
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-72.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-72.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-72
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-73.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-73.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-73
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-74.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-74.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-74
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-75.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-75.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-75
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-76.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-76.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-76
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-77.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-77.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-77
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-78.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-78.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-78
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-79.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-79.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-79
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-7.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-7.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-7
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-80.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-80.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-80
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-81.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-81.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-81
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-82.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-82.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-82
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-83.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-83.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-83
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-84.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-84.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-84
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-85.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-85.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-85
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-86.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-86.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-86
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-87.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-87.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-87
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-88.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-88.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-88
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-89.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-89.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-89
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-8.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-8.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-8
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-90.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-90.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-90
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-91.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-91.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-91
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2A-9.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2A-9.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2A-9
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-10.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-10.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-10
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-11.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-11.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-11
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-12.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-12.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-12
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-13.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-13.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-13
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-14.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-14.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-14
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-15.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-15.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-15
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-16.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-16.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-16
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-17.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-17.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-17
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-18.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-18.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-18
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-19.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-19.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-19
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-1.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-1.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-1
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-20.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-20.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-20
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-21.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-21.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-21
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-22.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-22.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-22
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-23.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-23.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-23
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-24.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-24.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-24
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-25.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-25.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-25
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-26.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-26.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-26
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-27.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-27.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-27
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-28.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-28.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-28
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-29.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-29.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-29
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-2.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-2.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-2
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-30.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-30.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-30
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-31.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-31.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-31
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-32.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-32.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-32
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-33.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-33.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-33
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-34.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-34.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-34
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-35.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-35.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-35
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-36.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-36.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-36
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-37.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-37.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-37
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-38.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-38.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-38
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-39.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-39.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-39
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-40.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-40.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-40
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-41.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-41.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-41
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-42.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-42.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-42
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-43.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-43.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-43
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-44.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-44.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-44
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-45.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-45.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-45
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-46.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-46.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-46
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-47.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-47.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-47
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-48.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-48.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-48
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-49.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-49.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-49
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-4.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-4.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-4
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-50.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-50.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-50
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-51.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-51.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-51
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-52.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-52.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-52
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-53.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-53.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-53
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-54.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-54.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-54
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-55.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-55.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-55
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-56.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-56.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-56
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-57.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-57.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-57
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-58.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-58.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-58
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-59.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-59.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-59
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-5.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-5.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-5
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-60.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-60.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-60
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-61.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-61.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-61
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-62.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-62.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-62
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-63.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-63.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-63
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-64.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-64.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-64
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-65.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-65.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-65
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-66.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-66.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-66
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-67.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-67.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-67
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-68.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-68.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-68
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-69.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-69.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-69
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-6.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-6.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-6
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-70.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-70.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-70
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-71.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-71.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-71
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-72.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-72.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-72
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-73.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-73.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-73
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-74.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-74.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-74
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-75.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-75.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-75
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-76.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-76.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-76
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-77.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-77.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-77
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-78.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-78.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-78
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-79.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-79.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-79
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-7.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-7.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-7
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-80.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-80.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-80
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-81.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-81.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-81
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-82.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-82.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-82
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-83.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-83.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-83
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-84.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-84.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-84
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-85.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-85.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-85
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-86.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-86.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-86
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-87.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-87.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-87
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-88.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-88.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-88
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-89.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-89.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-89
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-8.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-8.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-8
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-90.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-90.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-90
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-91.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-91.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-91
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=F2B-9.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/F2B-9.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=F2B-9
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=NKZ35.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/NKZ35.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=NKZ35
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups I=WOU9.bam O=$wkdir/19_March_2024_fork/02_AddOrReplaceReadGroups/WOU9.bam  RGLB=1 RGPL=ILLUMINA RGPU=unit1 RGSM=WOU9