library(sf)
library(rmapshaper)
# The data is from https://github.com/evansiroky/timezone-boundary-builder
# And released under the Open Data Commons Open Database License (ODbL)
download.file("https://github.com/evansiroky/timezone-boundary-builder/releases/download/2018d/timezones-with-oceans.geojson.zip",
              destfile = "data-raw/tz.zip")
unzip("data-raw/tz.zip", exdir = "data-raw", overwrite = TRUE)
tz_full <- read_sf(list.files("data-raw", recursive = TRUE, pattern = "oceans\\.json$", full.names = TRUE))
tz_sf <- ms_simplify(tz_full, keep = 0.17, keep_shapes = TRUE, explode = TRUE)

devtools::use_data(tz_sf, compress = "xz", internal = TRUE, overwrite = TRUE)
