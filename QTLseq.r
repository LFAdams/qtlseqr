#load the package
library("QTLseqr")

#Set sample and file names
HighBulk <- "resistant_bulk"
LowBulk <- "susceptible_bulk"
file <- "RS_SNPs_R2.txt"

#Choose which chromosomes will be included in the analysis (i.e. exclude smaller contigs)
#Lincoln: Watch out for discrepancies with leading 0s such as Cla97Chr011 vs Cla97Chr11. Use add
#and replace to standardize to 1 or 0 leading 0s as many times the single digit numbers will have a leading 0
#and the doulbe digit numbers will not.
Chroms <- paste0(rep("Cla97Chr0", 11), 01:11)


#Import SNP data from file
df <-
    importFromGATK(
        file = file,
        highBulk = HighBulk,
        lowBulk = LowBulk,
        chromList = Chroms
     )

#Filter SNPs based on some criteria
df_filt <-
    filterSNPs(
        SNPset = df,
        refAlleleFreq = 0.20,
        minTotalDepth = 100,
        maxTotalDepth = 400,
        minSampleDepth = 40,
        minGQ = 99
    )


#Run G' analysis
df_filt <- runGprimeAnalysis(
    SNPset = df_filt,
    windowSize = 1e6,
    outlierFilter = "deltaSNP")

#Run QTLseq analysis
df_filt <- runQTLseqAnalysis(
    SNPset = df_filt,
    windowSize = 1e6,
    popStruc = "F2",
    bulkSize = c(12, 12),
    replications = 10000,
    intervals = c(95, 99)
)

#Plot
plotQTLStats(SNPset = df_filt, var = "Gprime", plotThreshold = TRUE, q = 0.01,)
plotQTLStats(SNPset = df_filt, var = "deltaSNP", plotIntervals = TRUE)

#export summary CSV
getQTLTable(SNPset = df_filt, alpha = 0.01, export = TRUE, fileName = "788vs12178A_QTL.csv")

write.csv(df_filt, "GSB_SNPS.csv")
