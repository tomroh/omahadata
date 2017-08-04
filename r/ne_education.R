# script to download nebraska state education data
# http://nep.education.ne.gov/Links
library(rvest)

pg <- read_html("http://nep.education.ne.gov/Links")
links <- html_nodes(pg, "#DistrictContent a")
files <- paste0("http://nep.education.ne.gov", 
                unlist(lapply(html_attrs(links), getElement, name = "href")))
fileNames <- paste0("data/y2017/education/", html_text(links), ".txt")

for (i in 1:length(files)) {
  tryCatch({download.file(files[i], fileNames[i])}, error=function(e) NULL)
}
try({mapply(download.file, url = files, destfile = fileNames)})
