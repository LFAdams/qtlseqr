#PBS -S /bin/bash
#PBS -N sortbam_S
#PBS -q batch
#PBS -l nodes=1:ppn=12:AMD
#PBS -l mem=32gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools sort -@ 8 -m 3G S_aligned.bam -o S_sorted.bam
