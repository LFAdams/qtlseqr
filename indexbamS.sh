
#PBS -S /bin/bash
#PBS -N Sindexbam
#PBS -l walltime=128:00:00
#PBS -l nodes=1:ppn=12:AMD
#PBS -l mem=60gb
#PBS -q batch

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time samtools index S_sorted.bam



