# qtlseqr
Scripts used to generate data for 788 vs 12178A spring 2019 QTLseqR study.

##This repo is intended to preserve the data pipeline exactly as it was run to generate the data for the study. I know bash scripts are a thing now and realize the pipeline could be massively simplified into a single shell script. You live and you learn.

This readme is a record of the steps followed to generate QTLseqR data for 788 vs 12178A based on phenotyping data collected in spring 2019.

The steps taken with the illumina reads where as follows (modified from "Lab meeting_QTLSeq.pptx" by Manoj Sapkota in the van der Knapp lab):

1. All read files from each read were merged into a single file. I performed this locally in the command line using the cat command.
 The end result was two read files for each bulk. One forward and one reverse.
 resistantcombinedR1.fq.gz + resistantcombinedR2.fq.gz and susceptiblecombinedR1.fq.gz + susceptiblecombinedR2.fq.gz

2. The combined reads where checked for quality using fastqc with script fastqc.sh. This outputs an HTML file with graphs of read quality.

3. The 97103_v2 reference genome was obtained and stored in the labs shared highspeed storage on the cluster at /work/cemlab/reference_genomes/97103_v2.fa
    This genome, as well as the index and dictionary files created below, is available for the entire lab to use on the cluster.

4. Reads were aligned to the reference genome using bwa mem with scripts Salign.sh and Ralign.sh this generated two .sam files

5. .sam files were then converted to .bam files, which are binary and therefor smaller and easier for the computer to work with. This was done using samtools using sam2bamR.sh and sam2bamS.sh

6. The aligned reads in the .bam were then sorted using samtools with sortbamS.sh and sortbamR.sh. This sorted the files by alignment position rather than read name and is required for many tools.

7. Next the .bam files were index using samtools with scripts indexbamR.sh and indexbamS.sh. This creates an index file which is required for further analysis.

8. Next the read groups were standardized using picard with scripts  groupR.sh and groupS.sh. This ensures that the read groups of each set of reads which we cat'd together in step 1 are identical
    (within each bulk) for further analysis.

9. Next duplicate reads were marked using picard with markdupeR.sh and markdupeS.sh. This does not eliminate duplicates, but uses a representative read with the best quality for all duplicates of
    that read.

10. Next the modified .bam files were indexed using picard with ismdR.sh and ismdS.sh in order to allow further analysis.

11. Next an index file and a dictionary file were created using samtools and picard with faidx_97103_v2.sh and 97103_v2_csd.sh respectively. These files are necessary to continue the analysis.

12. Next target lists of intervals where created using GATK with targetalignR.sh and targetalignS.sh. These were required to realign the reads in the next step.

13. Next reads were realigned using GATK with realignR.sh and realignS.sh. This step minimizes mismatched bases across the reads and transforms misaligned regions caused by indels into clean reads
    using a consensus indel to suitable for standard variant discovery.

14. Next variant calling was performed using GATK with variantcallS.sh and variantcallR.sh. This step extracts a table of varaints from the alinged read consisting of SNPs and indels.

15. The resulting .vcf files were then combined into a single .vcf file using GATK with variantcombine.sh

16. SNPs were extracted from the .vcf file using GATK with snpextract.sh. This step is used to get rid of other types of variants such as indels.

17. SNPs were then filtered using two programs. First with GATK using snpfilter.sh and then with vcftools using vcffilter.sh
      Filter settings were based on recommendations from Manoj and the van der Knapp lab.

18. The SNPs were then output to a table format for use in R using GATK with tableout.sh

19. The resulting file "RS_SNPs_R.table" was transferred off of Sapelo2 and onto my personal laptop.

20. R studio was used to run QTLseq.r which is based on the template from https://github.com/bmansfeld/QTLseqr the github repository for (Mansfeld and Grumet 2018) the initial publication related
    to QTLseqR.
