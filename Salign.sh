#PBS -S /bin/bash
#PBS -N Salign
#PBS -l walltime=128:00:00
#PBS -l nodes=1:ppn=1:AMD
#PBS -q batch

cd $PBS_O_WORKDIR

module load BWA/0.7.15-foss-2016b

time bwa mem -t 8 /work/cemlab/reference_genomes/97103_v2.fa ./sr1/susceptiblecombinedR1.fq.gz ./sr2/susceptiblecombinedR2.fq.gz > Sbulk_aligned.sam