#PBS -S /bin/bash
#PBS -N faidx_97103_v2
#PBS -q batch
#PBS -l nodes=1:ppn=1:AMD
#PBS -l mem=100gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools faidx /work/cemlab/reference_genomes/97103_v2.fa
