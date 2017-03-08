library(rgbif)
taxonKey<-name_suggest("Perameles nasuta")
key<-taxonKey$key[1]
data<-occ_search(key)
data<- data$data

colnames(data) <- tolower(colnames(data))

tidyData <- as.data.frame(data)
tidyData <- add_flags(tidyData)

tidyData

# colname <- colnames(data)
# 
# colname[which(colname=="decimalLatitude")] = "decimallatitude"
# colname[which(colname=="decimalLongitude")] = "decimallongitude"
# colname[which(colname=="countryCode")] = "countrycode"
# colname[which(colname=="scientificName")] = "scientificname"