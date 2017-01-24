spocc - Make some maps!

Load libraries
--------------

    library('spocc')

spocc unifies access to biodiversity data across sources
--------------------------------------------------------

    out <- occ(query = 'Accipiter striatus', from = 'gbif')
    out$gbif # GBIF data w/ metadata

    #> Species [Accipiter striatus (500)] 
    #> First 10 rows of [Accipiter_striatus]
    #> 
    #> # A tibble: 500 × 97
    #>                  name  longitude latitude  prov                 issues
    #>                 <chr>      <dbl>    <dbl> <chr>                  <chr>
    #> 1  Accipiter striatus  -97.81493 26.03150  gbif cdround,cucdmis,gass84
    #> 2  Accipiter striatus -106.31531 31.71593  gbif         cdround,gass84
    #> 3  Accipiter striatus  -81.85267 28.81852  gbif                 gass84
    #> 4  Accipiter striatus  -81.85329 28.81806  gbif         cdround,gass84
    #> 5  Accipiter striatus  -95.50117 29.76086  gbif         cdround,gass84
    #> 6  Accipiter striatus  -73.23131 44.28476  gbif         cdround,gass84
    #> 7  Accipiter striatus  -97.94314 30.04580  gbif         cdround,gass84
    #> 8  Accipiter striatus  -77.05161 38.87834  gbif         cdround,gass84
    #> 9  Accipiter striatus -123.44703 48.54571  gbif         cdround,gass84
    #> 10 Accipiter striatus  -96.74874 33.03102  gbif         cdround,gass84
    #> # ... with 490 more rows, and 92 more variables: key <int>,
    #> #   datasetKey <chr>, publishingOrgKey <chr>, publishingCountry <chr>,
    #> #   protocol <chr>, lastCrawled <chr>, lastParsed <chr>, crawlId <int>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, scientificName <chr>, kingdom <chr>, phylum <chr>,
    #> #   order <chr>, family <chr>, genus <chr>, genericName <chr>,
    #> #   specificEpithet <chr>, taxonRank <chr>, dateIdentified <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, year <int>, month <int>,
    #> #   day <int>, eventDate <date>, modified <chr>, lastInterpreted <chr>,
    #> #   references <chr>, license <chr>, geodeticDatum <chr>, class <chr>,
    #> #   countryCode <chr>, country <chr>, rightsHolder <chr>,
    #> #   identifier <chr>, informationWithheld <chr>, verbatimEventDate <chr>,
    #> #   datasetName <chr>, verbatimLocality <chr>, gbifID <chr>,
    #> #   collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   `http://unknown.org/occurrenceDetails` <chr>, institutionCode <chr>,
    #> #   rights <chr>, eventTime <chr>, occurrenceRemarks <chr>,
    #> #   identificationID <chr>, individualCount <int>, elevation <dbl>,
    #> #   elevationAccuracy <dbl>, continent <chr>, stateProvince <chr>,
    #> #   institutionID <chr>, county <chr>,
    #> #   identificationVerificationStatus <chr>, language <chr>, type <chr>,
    #> #   preparations <chr>, locationAccordingTo <chr>, identifiedBy <chr>,
    #> #   georeferencedDate <chr>, higherGeography <chr>,
    #> #   nomenclaturalCode <chr>, georeferencedBy <chr>,
    #> #   georeferenceProtocol <chr>, endDayOfYear <chr>,
    #> #   georeferenceVerificationStatus <chr>, verbatimCoordinateSystem <chr>,
    #> #   locality <chr>, otherCatalogNumbers <chr>, organismID <chr>,
    #> #   previousIdentifications <chr>, identificationQualifier <chr>,
    #> #   samplingProtocol <chr>, accessRights <chr>,
    #> #   higherClassification <chr>, georeferenceSources <chr>, sex <chr>,
    #> #   dynamicProperties <chr>, vernacularName <chr>,
    #> #   reproductiveCondition <chr>, lifeStage <chr>

    out$ebird$data # empty

    #> $Accipiter_striatus
    #> # A tibble: 0 × 0

    out$gbif$meta #  metadata, your query parameters, time the call executed, etc. 

    #> $source
    #> [1] "gbif"
    #> 
    #> $time
    #> [1] "2017-01-24 12:53:04 CET"
    #> 
    #> $found
    #> [1] 617648
    #> 
    #> $returned
    #> [1] 500
    #> 
    #> $type
    #> [1] "sci"
    #> 
    #> $opts
    #> $opts$scientificName
    #> [1] "Accipiter striatus"
    #> 
    #> $opts$limit
    #> [1] 500
    #> 
    #> $opts$fields
    #> [1] "all"

    out$gbif$data # just data

    #> $Accipiter_striatus
    #> # A tibble: 500 × 97
    #>                  name  longitude latitude                 issues  prov
    #>                 <chr>      <dbl>    <dbl>                  <chr> <chr>
    #> 1  Accipiter striatus  -97.81493 26.03150 cdround,cucdmis,gass84  gbif
    #> 2  Accipiter striatus -106.31531 31.71593         cdround,gass84  gbif
    #> 3  Accipiter striatus  -81.85267 28.81852                 gass84  gbif
    #> 4  Accipiter striatus  -81.85329 28.81806         cdround,gass84  gbif
    #> 5  Accipiter striatus  -95.50117 29.76086         cdround,gass84  gbif
    #> 6  Accipiter striatus  -73.23131 44.28476         cdround,gass84  gbif
    #> 7  Accipiter striatus  -97.94314 30.04580         cdround,gass84  gbif
    #> 8  Accipiter striatus  -77.05161 38.87834         cdround,gass84  gbif
    #> 9  Accipiter striatus -123.44703 48.54571         cdround,gass84  gbif
    #> 10 Accipiter striatus  -96.74874 33.03102         cdround,gass84  gbif
    #> # ... with 490 more rows, and 92 more variables: key <int>,
    #> #   datasetKey <chr>, publishingOrgKey <chr>, publishingCountry <chr>,
    #> #   protocol <chr>, lastCrawled <chr>, lastParsed <chr>, crawlId <int>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, scientificName <chr>, kingdom <chr>, phylum <chr>,
    #> #   order <chr>, family <chr>, genus <chr>, genericName <chr>,
    #> #   specificEpithet <chr>, taxonRank <chr>, dateIdentified <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, year <int>, month <int>,
    #> #   day <int>, eventDate <date>, modified <chr>, lastInterpreted <chr>,
    #> #   references <chr>, license <chr>, geodeticDatum <chr>, class <chr>,
    #> #   countryCode <chr>, country <chr>, rightsHolder <chr>,
    #> #   identifier <chr>, informationWithheld <chr>, verbatimEventDate <chr>,
    #> #   datasetName <chr>, verbatimLocality <chr>, gbifID <chr>,
    #> #   collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   `http://unknown.org/occurrenceDetails` <chr>, institutionCode <chr>,
    #> #   rights <chr>, eventTime <chr>, occurrenceRemarks <chr>,
    #> #   identificationID <chr>, individualCount <int>, elevation <dbl>,
    #> #   elevationAccuracy <dbl>, continent <chr>, stateProvince <chr>,
    #> #   institutionID <chr>, county <chr>,
    #> #   identificationVerificationStatus <chr>, language <chr>, type <chr>,
    #> #   preparations <chr>, locationAccordingTo <chr>, identifiedBy <chr>,
    #> #   georeferencedDate <chr>, higherGeography <chr>,
    #> #   nomenclaturalCode <chr>, georeferencedBy <chr>,
    #> #   georeferenceProtocol <chr>, endDayOfYear <chr>,
    #> #   georeferenceVerificationStatus <chr>, verbatimCoordinateSystem <chr>,
    #> #   locality <chr>, otherCatalogNumbers <chr>, organismID <chr>,
    #> #   previousIdentifications <chr>, identificationQualifier <chr>,
    #> #   samplingProtocol <chr>, accessRights <chr>,
    #> #   higherClassification <chr>, georeferenceSources <chr>, sex <chr>,
    #> #   dynamicProperties <chr>, vernacularName <chr>,
    #> #   reproductiveCondition <chr>, lifeStage <chr>

And you can squash together data from sources easily

    out <- occ(query = 'Accipiter striatus', from = c('gbif', 'ebird'))
    occ2df(out)

    #> # A tibble: 1,000 × 6
    #>                  name  longitude latitude  prov       date        key
    #>                 <chr>      <dbl>    <dbl> <chr>     <date>      <chr>
    #> 1  Accipiter striatus  -97.81493 26.03150  gbif 2016-01-14 1229927719
    #> 2  Accipiter striatus -106.31531 31.71593  gbif 2016-01-20 1233597063
    #> 3  Accipiter striatus  -81.85267 28.81852  gbif 2016-01-18 1253301153
    #> 4  Accipiter striatus  -81.85329 28.81806  gbif 2016-01-18 1249295043
    #> 5  Accipiter striatus  -95.50117 29.76086  gbif 2016-01-09 1229610478
    #> 6  Accipiter striatus  -73.23131 44.28476  gbif 2016-01-03 1227769707
    #> 7  Accipiter striatus  -97.94314 30.04580  gbif 2016-01-24 1233600470
    #> 8  Accipiter striatus  -77.05161 38.87834  gbif 2016-01-02 1270044795
    #> 9  Accipiter striatus -123.44703 48.54571  gbif 2016-01-31 1249281424
    #> 10 Accipiter striatus  -96.74874 33.03102  gbif 2016-01-28 1257416040
    #> # ... with 990 more rows

Your turn
---------

-   5 min

> 1.  Explore getting data from other sources for the same taxa to see
>     how they compare. And combine output (hint: occ2df() function)
> 2.  If you have time, explore other ways to query with spocc,
>     including possibly by spatial area, sp class spatial objects,
>     taxize identifiers, or other things.
