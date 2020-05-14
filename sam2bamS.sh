#PBS -S /bin/bash
#PBS -N sam2bam_S
#PBS -q batch
#PBS -l nodes=1:ppn=1:AMD
#PBS -l mem=32gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools view -@ 8 -S -b Sbulk_aligned.sam > S_aligned.bam

samtools flagstat S_aligned.bam > S_bam_stats
