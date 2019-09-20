#PBS -S /bin/bash
#PBS -N index_realigned__R
#PBS -q batch
#PBS -l nodes=1:ppn=8:AMD
#PBS -l walltime=480:00:00
#PBS -l mem=25g

cd $PBS_O_WORKDIR

module load picard/2.16.0-Java-1.8.0_144

time java -Xmx20g -classpath "/usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144" -jar  /usr/local/apps/eb/picard/2.16.0-Java-1.8.0_144/picard.jar BuildBamIndex INPUT=S_sorted_mkdupl_rg.bam
