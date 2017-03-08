library(rgbif)
library(spocc)
library(mapr)
library(ggmap)

name_suggest(q='Panthera leo', rank="species")
dat<- occ(query = c('Panthera leo','Pygoscelis adeliae'), from = 'gbif', has_coords=TRUE)
map_leaflet(dat)

library(ppmap)
a<- occ_get(key=c(101010, 240713150, 855998194))
m<-occ_search(taxonKey = 5219404, hasCoordinate = TRUE)
l<-occ_data(scientificName = "Panthera leo")
