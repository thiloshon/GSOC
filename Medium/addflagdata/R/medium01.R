#' Function for Retrieving 5000 georeferenced records of Australian mammals from GBIF and adding quality flags.
#'
#' @author Thiloshon Nagarajah
#' @description {
#' GSOC
#' Integrating Biodiversity Data Curation Functionality.
#' Test Medium 01.
#' }
#' @param country The 2-letter country code (as per ISO-3166-1)
#' @param hasCoordinate A number
#' @param limit Number of records to return
#' @param classKey Class classification key
#' @return A tidy dataframe of occurancedata and quality flags of fields as specified in parameters.
#' @examples
#' addQualityFlag()
#' addQualityFlag("SL", False, 100, 148)
addQualityFlag <-
    function(country = "AU",
             hasCoordinate = TRUE,
             limit = 5000,
             classKey = 121) {
        # Required Libraries
        library(rgbif)
        library(plyr)
        library(rgeospatialquality)
        
        # Retrieving data
        rawData <-
            occ_data(
                classKey = classKey,
                country = country,
                hasCoordinate = hasCoordinate,
                limit = limit
            )
        data <- as.data.frame(rawData$data)
        
        # Making coloumn names simplecase
        colnames(data) <- tolower(colnames(data))
        
        # Splitting data into 5 components of 1000 records each since only 1000 records
        #   can be sent through rgeospatialquality API
        stripData <-
            split(data, rep(1:5, each = round(NROW(data) / 5)))
        
        # Adding flags to each component
        finalData <- lapply(stripData, add_flags)
        
        # Collapsing flags dataframe in data dataframe returned by the API.
        formatData <- lapply(finalData, function(df) {
            j <- df[, 1:NCOL(df) - 1]
            h <- df$flags
            df <- cbind(j, h)
        })
        
        # Combining the split data
        df <- ldply(formatData, rbind)[2:117]
        
        # Returning final data
        df
    }
