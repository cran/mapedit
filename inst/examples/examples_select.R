\dontrun{
library(mapedit)
library(mapview)

lf <- mapview()

# draw some polygons that we will select later
drawing <- lf %>%
  editMap()

# little easier now with sf
mapview(drawing$finished)

# especially easy with selectFeatures
selectFeatures(drawing$finished)


# use @bhaskarvk USA Albers with leaflet code
#  https://bhaskarvk.github.io/leaflet/examples/proj4Leaflet.html
#devtools::install_github("hrbrmstr/albersusa")
library(albersusa)
library(sf)
library(leaflet)
library(mapedit)

spdf <- usa_sf()
pal <- colorNumeric(
  palette = "Blues",
  domain = spdf$pop_2014
)

bounds <- c(-125, 24 ,-75, 45)

(lf <- leaflet(
  options=
    leafletOptions(
      worldCopyJump = FALSE,
      crs=leafletCRS(
        crsClass="L.Proj.CRS",
        code='EPSG:2163',
        proj4def=paste0(
          '+proj=laea +lat_0=45 +lon_0=-100 +x_0=0 +y_0=0 +a=6370997 ',
          '+b=6370997 +units=m +no_defs'
        ),
        resolutions = c(65536, 32768, 16384, 8192, 4096, 2048,1024, 512, 256, 128)
      )
    )
  ) %>%
  fitBounds(bounds[1], bounds[2], bounds[3], bounds[4]) %>%
  setMaxBounds(bounds[1], bounds[2], bounds[3], bounds[4]) %>%
  mapview::addFeatures(
    data=spdf, weight = 1, color = "#000000",
    # adding group necessary for identification
    layerId = ~iso_3166_2,
    fillColor=~pal(pop_2014),
    fillOpacity=0.7,
    label=~stringr::str_c(name,' ', format(pop_2014, big.mark=",")),
    labelOptions= labelOptions(direction = 'auto')
  )
)


# test out selectMap with albers example
selectMap(
  lf,
  styleFalse = list(weight = 1),
  styleTrue = list(weight = 4)
)
}
