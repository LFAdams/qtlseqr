#PBS -S /bin/bash
#PBS -N snpextract
#PBS -q batch
#PBS -l nodes=1:ppn=12
#PBS -l walltime=48:00:00
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T SelectVariants  -R /work/cemlab/reference_genomes/97103_v2.fa  -V RS_raw_snps_and_indels.vcf  -selectType SNP -o RS_raw_snps.vcf
