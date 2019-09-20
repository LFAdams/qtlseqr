#PBS -S /bin/bash
#PBS -N indelrealign_S
#PBS -q batch
#PBS -l nodes=1:ppn=12
#PBS -l walltime=48:00:00
#PBS -l mem=64gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T IndelRealigner -R /work/cemlab/reference_genomes/97103_v2.fa -I S_sorted_mkdupl_rg.bam -targetIntervals S_intervals.list -o S_realigned.bam
