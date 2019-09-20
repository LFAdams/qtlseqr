#PBS -S /bin/bash
#PBS -N Rtableout
#PBS -q batch
#PBS -l nodes=1:ppn=12
#PBS -l walltime=48:00:00
#PBS -l mem=32gb

cd $PBS_O_WORKDIR

module load GATK/3.8-1-Java-1.8.0_144

java -jar $EBROOTGATK/GenomeAnalysisTK.jar -T VariantsToTable -R /work/cemlab/reference_genomes/97103_v2.fa  -V RS_pass_nomiss_snps.vcf -F CHROM -F POS -F REF -F ALT -GF AD -GF DP -GF GQ -GF PL -o RS_SNPs_R.table
