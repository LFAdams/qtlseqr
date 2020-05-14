#PBS -S /bin/bash
#PBS -N sortbam_R
#PBS -q batch
#PBS -l nodes=1:ppn=12:AMD
#PBS -l mem=64gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools sort -@ 8 -m 3G R_aligned.bam -o R_sorted.bam

module load BEDTools/2.29.2-GCC-8.2.0-2.31.1

bedtools genomecov -ibam R_sorted.bam -g /work/cemlab/reference_genomes/97103_v2.fa > Rcoverage.txt

TOT=0
while read CHROM DEPTH BASES SIZE FRAC
  do
    DEPNUM=$(($DEPTH * $BASES))
    TOT=$(($TOT + $DEPNUM))
    OUTSIZE=$SIZE
  done <  <(grep genome Rcoverage.txt)

COV=$(($TOT / $OUTSIZE))

echo $COV
echo $COV > Rcoveragecalc.txt
