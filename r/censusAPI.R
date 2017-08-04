# example of a census api call

library(httr)
apiToken <- Sys.getenv("census_token")
Sys.getenv()
year <- 2015
state <- 31
vars <- c("B00001_001E")

apiCalls <- paste0('http://api.census.gov/data/',year,'/acs5?key=',
                   apiToken,'&get=', paste0(vars, collapse = ","),
                   '&for=tract:*&in=state:',state)
apiCalls
req <- content(GET(apiCalls), "parsed")
colNames <- unlist(req[[1]])
listDFs <- lapply(req[-1], function(x) {
  df <- data.frame(x, stringsAsFactors = FALSE)
  names(df) <- colNames
  df
  }
)
df <- do.call("rbind", listDFs)
for (i in colNames[1:8]) {
  df[[i]] <- as.numeric(df[[i]])
}

