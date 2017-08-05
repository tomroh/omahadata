library(rvest)
library(dplyr)
# scrapes nebraska big game hunters from ng&p
# http://apps.outdoornebraska.gov/BGTrophy/
pgNum <- 1:686
pages <- paste0("http://apps.outdoornebraska.gov/BGTrophy/?page=", 
                pgNum, 
                "&SortBy=KilledYear&Asc=False")


for ( i in pgNum ) {
  print(pages[i])
  dt <- read_html(pages[i]) %>%
    html_table() %>%
    getElement(1) %>%
    .[-1, -10]
  
  if (i == 1) {
    write.table(dt, file = 'data/y2017/ngp/biggame.csv',
                row.names = FALSE, sep = ",")
  } else {
    write.table(dt, file = 'data/y2017/ngp/biggame.csv',
                row.names = FALSE, col.names = FALSE,
                append = TRUE, sep = ",")
  }
}

