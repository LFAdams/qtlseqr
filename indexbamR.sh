#PBS -S /bin/bash
#PBS -N Rindexbam
#PBS -l walltime=128:00:00
#PBS -l nodes=1:ppn=12:AMD
#PBS -q batch
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time samtools index R_sorted.bam
