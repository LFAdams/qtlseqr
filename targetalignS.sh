#PBS -S /bin/bash
#PBS -N realign_S
#PBS -q batch
#PBS -l nodes=1:ppn=8
#PBS -l walltime=48:00:00
#PBS -l mem=2gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /work/cemlab/reference_genomes/97103_v2.fa -I S_sorted_mkdupl_rg.bam -o S_intervals.list
