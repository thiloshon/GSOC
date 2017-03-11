# Thiloshon Nagarajah
#
# GSOC
# Integrating Biodiversity Data Curation Functionality.
#
# Test Easy Part 02.
#
# Retrieving data from GBIF Portal for Perameles nasuta and adding quality flags.
#   (Part 01 script gets the data from GBIF backbone through API and does the same.)
#
#
# Data used in the code is taked from Global Biodiversity Information Facility.
# GBIF.org (8th March 2017) GBIF Occurrence Download http://doi.org/10.15468/dl.autmra
# QUERY
# Taxon	Perameles nasuta


# Required Libraries
library(rgeospatialquality)

# Reading downloaded portal data
data <-
    read.csv(
        "0067842-160910150852091/0067842-160910150852091.csv",
        header = TRUE,
        sep = "\t",
        nrows = 500
    )

# Flagging
flaggedData <- add_flags(data)

flaggedData


