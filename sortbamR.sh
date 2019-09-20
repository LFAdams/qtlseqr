#PBS -S /bin/bash
#PBS -N sortbam_R
#PBS -q batch
#PBS -l nodes=1:ppn=12:AMD
#PBS -l mem=64gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools sort -@ 8 -m 3G R_aligned.bam -o R_sorted.bam
