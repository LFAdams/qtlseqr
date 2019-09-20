#PBS -S /bin/bash
#PBS -N vcfFilter
#PBS -q batch
#PBS -l nodes=1:ppn=12:AMD
#PBS -l walltime=480:00:00
#PBS -l mem=50gb

cd $PBS_O_WORKDIR

module load VCFtools/0.1.15-foss-2016b-Perl-5.24.1
time /usr/local/apps/eb/VCFtools/0.1.15-foss-2016b-Perl-5.24.1/bin/vcftools  --vcf RS_filtered_snps.vcf --remove-filtered-all --recode  --max-missing 1 -c > RS_pass_nomiss_snps.vcf
