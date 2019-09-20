#PBS -S /bin/bash
#PBS -N group_R
#PBS -q batch
#PBS -l nodes=1:ppn=1:AMD
#PBS -l mem=32gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load picard/2.16.0-Java-1.8.0_144

time java -Xmx20g -classpath "/usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144" -jar  /usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144/picard.jar AddOrReplaceReadGroups INPUT=R_sorted.bam OUTPUT=R_sorted.rg.bam RGID=resistant_bulk RGSM=resistant_bulk RGLB=resistant_bulk RGPL=ILLUMINA RGPU=ignore

