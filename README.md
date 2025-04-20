
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mapedit

<!-- badges: start -->

[![R-CMD-check](https://github.com/r-spatial/mapedit/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-spatial/mapedit/actions/workflows/R-CMD-check.yaml)
[![cran
checks](https://badges.cranchecks.info/worst/mapedit.svg)](https://cran.r-project.org/web/checks/check_results_mapedit.html)
![monthly](https://cranlogs.r-pkg.org/badges/mapedit)
![total](https://cranlogs.r-pkg.org/badges/grand-total/mapedit)
[![CRAN](https://www.r-pkg.org/badges/version/mapedit?color=009999)](https://cran.r-project.org/package=mapedit)
<!-- badges: end -->

### Status

`mapedit` is still in active development. We would very much appreciate
feedback, ideas, and use cases. The API has stabilized, and wee will use
semantic versioning with Github tagged releases to track changes and
progress. All changes will also be documented in NEWS.md.

### Blog Posts

[Introduction to
mapedit](https://r-spatial.org/r/2017/01/30/mapedit_intro.html) January
30, 2017

[mapedit updates in
0.2.0](https://r-spatial.org/r/2017/06/09/mapedit_0-2-0.html) June 12,
2017

[mapedit 0.5.0 and
Leaflet.pm](https://r-spatial.org/r/2019/03/31/mapedit_leafpm.html)
March 31, 2019

### Talks

[Tim Appelhans at useR
2017](https://learn.microsoft.com/events/user-international-r-user-conferences/user-international-r-user-2017-conference/mapedit-interactive-manipulation-of-spatial-objects?term=tim%20appelhans)
July 2017

### Install

As the CRAN badge above indicates, `mapedit` has achieved CRAN status.
To install, please use `install.packages`, or for the cutting edge, use
`devtools::install_github`.

    install.packages("mapedit")
    # cutting edge
    # remotes::install_github("r-spatial/mapedit")

### Examples

We can interactively CRD (create, update, delete) features on a map with
`editMap`.

    library(mapedit)
    library(leaflet)
    library(mapview)

    editMap(leaflet() %>% addTiles())

    editMap(
      mapview(breweries91),
      targetLayerId = "breweries91"
    )

`mapedit` also offers interactive selection of map features with
`selectMap`.

    library(mapedit)
    library(leaflet)
    library(mapview)

    selectMap(
      leaflet(breweries91) %>%
        addTiles() %>%
        addCircleMarkers(layerId = ~brewery)
    )

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/r-spatial/mapedit/blob/master/CONDUCT.md).
By participating in this project you agree to abide by its terms.

### Acknowledgment

This project has been realized with financial
[support](https://r-consortium.org/all-projects/2016-group-2.html#interactive-data-manipulation-in-mapview)
from the

<a href="https://r-consortium.org/all-projects/">
<img src="http://pebesma.staff.ifgi.de/RConsortium_Horizontal_Pantone.png" width="400">
</a>
