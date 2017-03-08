addQualityFlag <- function(country = "AU", hasCoordinate = TRUE, limit = 5000, classKey = 121){
    
    library(rgbif)
    library(plyr)
    library(rgeospatialquality)
    
    rawData<-occ_data(classKey = classKey, country = country, hasCoordinate = hasCoordinate, limit = limit)
    
    data<-as.data.frame(rawData$data)
    
    colnames(data) <- tolower(colname)
    
    num_dfs <- 5
    
    stripData <- split(data, rep(1:num_dfs, each = round(NROW(data) / num_dfs)))
    
    finalData<- lapply(stripData, add_flags)
    
    formatData<- lapply(finalData, function(df) {
        j<-df[,1:111]
        h<-df$flags
        df<-cbind(j,h)
    })
    
    df<-ldply(formatData, rbind)[2:117]
    
    df
}



