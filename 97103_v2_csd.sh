#PBS -S /bin/bash
#PBS -N index_sort_markdup_normal
#PBS -q batch
#PBS -l nodes=1:ppn=1:AMD
#PBS -l walltime=480:00:00
#PBS -l mem=25g

cd $PBS_O_WORKDIR

module load picard/2.16.0-Java-1.8.0_144
time java -Xmx20g -classpath "/usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144" -jar  /usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144/picard.jar CreateSequenceDictionary REFERENCE=/work/cemlab/reference_genomes/97103_v2.fa OUTPUT=/work/cemlab/reference_genomes/97103_v2.dict