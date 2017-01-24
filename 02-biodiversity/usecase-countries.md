rgbif use case - Finding countries species are found in using rgbif
-------------------------------------------------------------------

### Load some libraries

    library(rgbif)
    library(plyr)

### List of bird species

    spplist <- c('Geothlypis trichas','Tiaris olivacea','Pterodroma axillaris','Calidris ferruginea','Pterodroma macroptera','Gallirallus australis','Falco cenchroides','Telespiza cantans','Oreomystis bairdi','Cistothorus palustris')

### Get GBIF keys for each taxon

    (keys <- sapply(spplist, function(x) name_backbone(x, rank = "species")$usageKey))

    #>    Geothlypis trichas       Tiaris olivacea  Pterodroma axillaris 
    #>               2489670               5231037               2481447 
    #>   Calidris ferruginea Pterodroma macroptera Gallirallus australis 
    #>               2481741               2481481               2474535 
    #>     Falco cenchroides     Telespiza cantans     Oreomystis bairdi 
    #>               2481009               2494416               2494355 
    #> Cistothorus palustris 
    #>               2493863

### Get data for each species

    out <- Map(function(a, b) {
      data.frame(
        taxon = b, 
        occ_search(taxonKey = a, facet = "country", limit = 0)$facets$country,
        stringsAsFactors = FALSE
      )
    }, unname(keys), names(keys))
    res <- ldply(out)
    head(res); tail(res)

    #>                taxon name   count
    #> 1 Geothlypis trichas   US 1416169
    #> 2 Geothlypis trichas   CA  166463
    #> 3 Geothlypis trichas   MX   15970
    #> 4 Geothlypis trichas   BZ    2733
    #> 5 Geothlypis trichas   HN    1972
    #> 6 Geothlypis trichas   CU    1868

    #>                    taxon name  count
    #> 62 Cistothorus palustris   US 403725
    #> 63 Cistothorus palustris   CA  48630
    #> 64 Cistothorus palustris   MX   2908
    #> 65 Cistothorus palustris   BM      2
    #> 66 Cistothorus palustris   FR      1
    #> 67 Cistothorus palustris   ZZ      1
