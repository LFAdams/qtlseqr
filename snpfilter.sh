#PBS -S /bin/bash
#PBS -N snpfilter
#PBS -q batch
#PBS -l nodes=1:ppn=12
#PBS -l walltime=48:00:00
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T VariantFiltration -R /work/cemlab/reference_genomes/97103_v2.fa  -V RS_raw_snps.vcf --filterExpression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum  < -12.5 || ReadPosRankSum < -8.0" --filterName "Default_recommended" -o RS_filtered_snps.vcf
