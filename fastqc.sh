#PBS -S /bin/bash
#PBS -q batch
#PBS -N fastqc
#PBS -l nodes=1:ppn=1:AMD
#PBS -l walltime=480:00:00
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load FastQC/0.11.8-Java-1.8.0_144
time fastqc  -o /scratch/lfa81121/stage/fastqc /scratch/lfa81121/stage/rr1/resistantcombinedR1.fq.gz /scratch/lfa81121/stage/sr1/susceptiblecombinedR1.fq.gz /scratch/lfa81121/stage/rr2/resistantcombinedR2.fq.gz  /scratch/lfa81121/stage/sr2/susceptiblecombinedR2.fq.gz
