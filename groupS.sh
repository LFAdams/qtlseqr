#PBS -S /bin/bash
#PBS -N group_S
#PBS -q batch
#PBS -l nodes=1:ppn=1:AMD
#PBS -l mem=32gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load picard/2.16.0-Java-1.8.0_144

time java -Xmx20g -classpath "/usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144" -jar  /usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144/picard.jar AddOrReplaceReadGroups INPUT=S_sorted.bam OUTPUT=S_sorted.rg.bam RGID=susceptible_bulk RGSM=susceptible_bulk RGLB=susceptible_bulk RGPL=ILLUMINA RGPU=ignore

