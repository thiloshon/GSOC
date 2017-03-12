# Thiloshon Nagarajah
# RStudio Version 1.0.136
# 
# GSOC 
# Integrating Biodiversity Data Curation Functionality.
# 
# Test Easy Part 01.
#
# Retrieving data from GBIF for Perameles nasuta and adding quality flags.
#   (Part 02 script gets the data from GBIF Portal and does the same.)


# Required Libraries
library(rgbif)
library(rgeospatialquality)

# Getting taxon key of any one species with names Perameles nasuta
taxonKey<-name_suggest("Perameles nasuta")
key<-taxonKey$key[1]

# Getting occurrence data of that species
data<-occ_search(key) #default limit = 500
data<- data$data

# Making column names lowercase 
colnames(data) <- tolower(colnames(data))

#Adding flag to a tidy dataframe
tidyData <- as.data.frame(data)
tidyData <- add_flags(tidyData)

#return the flagged data
tidyData
