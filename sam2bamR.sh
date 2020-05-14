#PBS -S /bin/bash
#PBS -N sam2bam_R
#PBS -q batch
#PBS -l nodes=1:ppn=1:AMD
#PBS -l mem=32gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools view -@ 8 -S -b Rbulk_aligned.sam > R_aligned.bam

samtools flagstat R_aligned.bam > R_bam_stats
