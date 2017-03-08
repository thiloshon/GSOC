library(rgbif)
library(rgeospatialquality)
data <- read.csv("0067842-160910150852091/0067842-160910150852091.csv", header = TRUE, sep = "\t")
data <- data[1:500,]
flaggedData <- add_flags(data)







#GBIF.org (8th March 2017) GBIF Occurrence Download http://doi.org/10.15468/dl.autmra
#QUERY
#Taxon	Perameles nasuta
