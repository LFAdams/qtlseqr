#PBS -S /bin/bash
#PBS -N variantcall_R
#PBS -q batch
#PBS -l nodes=1:ppn=8
#PBS -l walltime=48:00:00
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T HaplotypeCaller  -nct 8 -R /work/cemlab/reference_genomes/97103_v2.fa -I R_realigned.bam --emitRefConfidence GVCF --variant_index_type LINEAR --variant_index_parameter 128000 -o R_realigned_reads_raw_variants_gvcf.vcf
