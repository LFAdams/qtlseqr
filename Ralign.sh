#PBS -S /bin/bash
#PBS -N Ralign
#PBS -l walltime=128:00:00
#PBS -l nodes=1:ppn=1:AMD
#PBS -l mem=32gb
#PBS -q batch

cd $PBS_O_WORKDIR

module load BWA/0.7.15-foss-2016b

time bwa mem -t 8 /work/cemlab/reference_genomes/97103_v2.fa ./rr1/resistantcombinedR1.fq.gz ./rr2/resistantcombinedR2.fq.gz > Rbulk_aligned.sam
