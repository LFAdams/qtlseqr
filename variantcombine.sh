#PBS -S /bin/bash
#PBS -N variantcombine
#PBS -q batch
#PBS -l nodes=1:ppn=12
#PBS -l walltime=48:00:00
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T GenotypeGVCFs -R /work/cemlab/reference_genomes/97103_v2.fa --variant S_realigned_reads_raw_variants_gvcf.vcf --variant R_realigned_reads_raw_variants_gvcf.vcf -nt 8 -o RS_raw_snps_and_indels.vcf
