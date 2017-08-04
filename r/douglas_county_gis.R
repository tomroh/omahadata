# script to download geojson from douglas county
# http://data-dogis.opendata.arcgis.com/

apiCalls <-
  c(
    streetclines = "http://data-dogis.opendata.arcgis.com/datasets/7cc4951ecd8345a5abbe56fbbef2b09e_29.geojson",
    cityLimits = "http://data-dogis.opendata.arcgis.com/datasets/7152f0ae1ae446088d9252c4c5820998_0.geojson",
    schoolDistricts = "http://data-dogis.opendata.arcgis.com/datasets/42d8ba1a8803486c98e078889b87a545_9.geojson",
    zipCodes = "http://data-dogis.opendata.arcgis.com/datasets/240fafb799f44391ac6c56073488117a_6.geojson",
    neighborhoods = "http://data-dogis.opendata.arcgis.com/datasets/93152287648249ea8cee96710e3f4489_17.geojson",
    sid = "http://data-dogis.opendata.arcgis.com/datasets/21398eb0aa8e4aa1a29bb395a3d66ef3_12.geojson"
  )
destFiles <- paste0("data/y2017/gis/", names(apiCalls), ".geojson")

mapply(download.file, url = apiCalls, destfile = destFiles)
