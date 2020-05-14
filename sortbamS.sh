#PBS -S /bin/bash
#PBS -N sortbam_S
#PBS -q batch
#PBS -l nodes=1:ppn=12:AMD
#PBS -l mem=32gb
#PBS -l walltime=24:00:00

cd $PBS_O_WORKDIR

module load SAMtools/1.6-foss-2016b

time  samtools sort -@ 8 -m 3G S_aligned.bam -o S_sorted.bam

module load BEDTools/2.29.2-GCC-8.2.0-2.31.1

bedtools genomecov -ibam S_sorted.bam -g /work/cemlab/reference_genomes/97103_v2.fa > Scoverage.txt

TOT=0
while read CHROM DEPTH BASES SIZE FRAC
  do
    DEPNUM=$(($DEPTH * $BASES))
    TOT=$(($TOT + $DEPNUM))
    OUTSIZE=$SIZE
  done <  <(grep genome Scoverage.txt)

COV=$(($TOT / $OUTSIZE))

echo $COV
echo $COV > Scoveragecalc.txt
