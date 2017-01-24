rgbif data quality/data cleaning
--------------------------------

    library('rgbif')

Parsing output by issue
-----------------------

    (res <- occ_search(geometry='POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1))', limit = 50))

    #> Records found [1967217] 
    #> Records returned [50] 
    #> No. unique hierarchies [38] 
    #> No. media records [48] 
    #> No. facets [0] 
    #> Args [geometry=POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1)),
    #>      limit=50, offset=0, fields=all] 
    #> # A tibble: 50 × 79
    #>                     name        key decimalLatitude decimalLongitude
    #>                    <chr>      <int>           <dbl>            <dbl>
    #> 1          Vulpes vulpes 1262387359        33.13012         35.68513
    #> 2             Sus scrofa 1229924242        33.06315         35.83303
    #> 3  Mandragora autumnalis 1233597424        32.82444         35.70061
    #> 4          Vulpes vulpes 1249281130        33.17339         35.79064
    #> 5    Pluchea dioscoridis 1249284896        32.80815         35.67768
    #> 6      Anemone coronaria 1229610123        33.17204         35.69182
    #> 7        Gazella gazella 1249283121        33.17071         35.76562
    #> 8    Echium plantagineum 1249279813        32.83495         35.79767
    #> 9          Prunus dulcis 1249279907        32.81171         35.68569
    #> 10 Passer hispaniolensis 1249278510        33.04824         35.69454
    #> # ... with 40 more rows, and 75 more variables: issues <chr>,
    #> #   datasetKey <chr>, publishingOrgKey <chr>, publishingCountry <chr>,
    #> #   protocol <chr>, lastCrawled <chr>, lastParsed <chr>, crawlId <int>,
    #> #   extensions <chr>, basisOfRecord <chr>, taxonKey <int>,
    #> #   kingdomKey <int>, phylumKey <int>, classKey <int>, orderKey <int>,
    #> #   familyKey <int>, genusKey <int>, speciesKey <int>,
    #> #   scientificName <chr>, kingdom <chr>, phylum <chr>, order <chr>,
    #> #   family <chr>, genus <chr>, species <chr>, genericName <chr>,
    #> #   specificEpithet <chr>, taxonRank <chr>, dateIdentified <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, year <int>, month <int>,
    #> #   day <int>, eventDate <chr>, modified <chr>, lastInterpreted <chr>,
    #> #   references <chr>, license <chr>, identifiers <chr>, facts <chr>,
    #> #   relations <chr>, geodeticDatum <chr>, class <chr>, countryCode <chr>,
    #> #   country <chr>, rightsHolder <chr>, identifier <chr>,
    #> #   verbatimEventDate <chr>, datasetName <chr>, verbatimLocality <chr>,
    #> #   gbifID <chr>, collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   http...unknown.org.occurrenceDetails <chr>, institutionCode <chr>,
    #> #   rights <chr>, identificationID <chr>, occurrenceRemarks <chr>,
    #> #   eventTime <chr>, informationWithheld <chr>, elevation <dbl>,
    #> #   elevationAccuracy <dbl>, depth <dbl>, depthAccuracy <dbl>,
    #> #   waterBody <chr>, locality <chr>, type <chr>,
    #> #   ownerInstitutionCode <chr>, samplingProtocol <chr>, datasetID <chr>,
    #> #   identifiedBy <chr>, georeferenceSources <chr>

Can print whole table, or search for matches

    head(gbif_issues())

    #>    code                              issue
    #> 1   bri            BASIS_OF_RECORD_INVALID
    #> 2   ccm         CONTINENT_COUNTRY_MISMATCH
    #> 3   cdc CONTINENT_DERIVED_FROM_COORDINATES
    #> 4 conti                  CONTINENT_INVALID
    #> 5  cdiv                 COORDINATE_INVALID
    #> 6 cdout            COORDINATE_OUT_OF_RANGE
    #>                                                                                                    description
    #> 1 The given basis of record is impossible to interpret or seriously different from the recommended vocabulary.
    #> 2                                                       The interpreted continent and country do not match up.
    #> 3                  The interpreted continent is based on the coordinates, not the verbatim string information.
    #> 4                                                                      Uninterpretable continent values found.
    #> 5                                      Coordinate value given in some form but GBIF is unable to interpret it.
    #> 6                                        Coordinate has invalid lat/lon values out of their decimal max range.

    gbif_issues()[ gbif_issues()$code %in% c('cdround','cudc','gass84','txmathi'), ]

    #>       code                            issue
    #> 10 cdround               COORDINATE_ROUNDED
    #> 12    cudc COUNTRY_DERIVED_FROM_COORDINATES
    #> 23  gass84     GEODETIC_DATUM_ASSUMED_WGS84
    #> 39 txmathi           TAXON_MATCH_HIGHERRANK
    #>                                                                                                                                 description
    #> 10                                                                                  Original coordinate modified by rounding to 5 decimals.
    #> 12                                                The interpreted country is based on the coordinates, not the verbatim string information.
    #> 23 Indicating that the interpreted coordinates assume they are based on WGS84 datum as the datum was either not indicated or interpretable.
    #> 39                                        Matching to the taxonomic backbone can only be done on a higher rank and not the scientific name.

Or parse issues in various ways, e,g. remove data rows with certain
issue classes

    library('magrittr')
    res %>% occ_issues(-gass84, -mdatunl)

    #> Records found [1967217] 
    #> Records returned [1] 
    #> No. unique hierarchies [38] 
    #> No. media records [48] 
    #> No. facets [0] 
    #> Args [geometry=POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1)),
    #>      limit=50, offset=0, fields=all] 
    #> # A tibble: 1 × 79
    #>                 name        key decimalLatitude decimalLongitude issues
    #>                <chr>      <int>           <dbl>            <dbl>  <chr>
    #> 1 Dasyatis pastinaca 1248889625          27.312           33.801 cdreps
    #> # ... with 74 more variables: datasetKey <chr>, publishingOrgKey <chr>,
    #> #   publishingCountry <chr>, protocol <chr>, lastCrawled <chr>,
    #> #   lastParsed <chr>, crawlId <int>, extensions <chr>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, speciesKey <int>, scientificName <chr>, kingdom <chr>,
    #> #   phylum <chr>, order <chr>, family <chr>, genus <chr>, species <chr>,
    #> #   genericName <chr>, specificEpithet <chr>, taxonRank <chr>,
    #> #   dateIdentified <chr>, coordinateUncertaintyInMeters <dbl>, year <int>,
    #> #   month <int>, day <int>, eventDate <chr>, modified <chr>,
    #> #   lastInterpreted <chr>, references <chr>, license <chr>,
    #> #   identifiers <chr>, facts <chr>, relations <chr>, geodeticDatum <chr>,
    #> #   class <chr>, countryCode <chr>, country <chr>, rightsHolder <chr>,
    #> #   identifier <chr>, verbatimEventDate <chr>, datasetName <chr>,
    #> #   verbatimLocality <chr>, gbifID <chr>, collectionCode <chr>,
    #> #   occurrenceID <chr>, taxonID <chr>, recordedBy <chr>,
    #> #   catalogNumber <chr>, http...unknown.org.occurrenceDetails <chr>,
    #> #   institutionCode <chr>, rights <chr>, identificationID <chr>,
    #> #   occurrenceRemarks <chr>, eventTime <chr>, informationWithheld <chr>,
    #> #   elevation <dbl>, elevationAccuracy <dbl>, depth <dbl>,
    #> #   depthAccuracy <dbl>, waterBody <chr>, locality <chr>, type <chr>,
    #> #   ownerInstitutionCode <chr>, samplingProtocol <chr>, datasetID <chr>,
    #> #   identifiedBy <chr>, georeferenceSources <chr>

split issues into separate columns

    res %>% occ_issues(mutate = "split")

    #> Records found [1967217] 
    #> Records returned [50] 
    #> No. unique hierarchies [38] 
    #> No. media records [48] 
    #> No. facets [0] 
    #> Args [geometry=POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1)),
    #>      limit=50, offset=0, fields=all] 
    #> # A tibble: 50 × 82
    #>                     name        key decimalLatitude decimalLongitude
    #>                    <chr>      <int>           <dbl>            <dbl>
    #> 1          Vulpes vulpes 1262387359        33.13012         35.68513
    #> 2             Sus scrofa 1229924242        33.06315         35.83303
    #> 3  Mandragora autumnalis 1233597424        32.82444         35.70061
    #> 4          Vulpes vulpes 1249281130        33.17339         35.79064
    #> 5    Pluchea dioscoridis 1249284896        32.80815         35.67768
    #> 6      Anemone coronaria 1229610123        33.17204         35.69182
    #> 7        Gazella gazella 1249283121        33.17071         35.76562
    #> 8    Echium plantagineum 1249279813        32.83495         35.79767
    #> 9          Prunus dulcis 1249279907        32.81171         35.68569
    #> 10 Passer hispaniolensis 1249278510        33.04824         35.69454
    #> # ... with 40 more rows, and 78 more variables: cdround <chr>,
    #> #   gass84 <chr>, cdreps <chr>, txmathi <chr>, datasetKey <chr>,
    #> #   publishingOrgKey <chr>, publishingCountry <chr>, protocol <chr>,
    #> #   lastCrawled <chr>, lastParsed <chr>, crawlId <int>, extensions <chr>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, speciesKey <int>, scientificName <chr>, kingdom <chr>,
    #> #   phylum <chr>, order <chr>, family <chr>, genus <chr>, species <chr>,
    #> #   genericName <chr>, specificEpithet <chr>, taxonRank <chr>,
    #> #   dateIdentified <chr>, coordinateUncertaintyInMeters <dbl>, year <int>,
    #> #   month <int>, day <int>, eventDate <chr>, modified <chr>,
    #> #   lastInterpreted <chr>, references <chr>, license <chr>,
    #> #   identifiers <chr>, facts <chr>, relations <chr>, geodeticDatum <chr>,
    #> #   class <chr>, countryCode <chr>, country <chr>, rightsHolder <chr>,
    #> #   identifier <chr>, verbatimEventDate <chr>, datasetName <chr>,
    #> #   verbatimLocality <chr>, gbifID <chr>, collectionCode <chr>,
    #> #   occurrenceID <chr>, taxonID <chr>, recordedBy <chr>,
    #> #   catalogNumber <chr>, http...unknown.org.occurrenceDetails <chr>,
    #> #   institutionCode <chr>, rights <chr>, identificationID <chr>,
    #> #   occurrenceRemarks <chr>, eventTime <chr>, informationWithheld <chr>,
    #> #   elevation <dbl>, elevationAccuracy <dbl>, depth <dbl>,
    #> #   depthAccuracy <dbl>, waterBody <chr>, locality <chr>, type <chr>,
    #> #   ownerInstitutionCode <chr>, samplingProtocol <chr>, datasetID <chr>,
    #> #   identifiedBy <chr>, georeferenceSources <chr>

expand issues to more descriptive names

    res %>% occ_issues(mutate = "expand")

    #> Records found [1967217] 
    #> Records returned [50] 
    #> No. unique hierarchies [38] 
    #> No. media records [48] 
    #> No. facets [0] 
    #> Args [geometry=POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1)),
    #>      limit=50, offset=0, fields=all] 
    #> # A tibble: 50 × 79
    #>                     name        key decimalLatitude decimalLongitude
    #>                    <chr>      <int>           <dbl>            <dbl>
    #> 1          Vulpes vulpes 1262387359        33.13012         35.68513
    #> 2             Sus scrofa 1229924242        33.06315         35.83303
    #> 3  Mandragora autumnalis 1233597424        32.82444         35.70061
    #> 4          Vulpes vulpes 1249281130        33.17339         35.79064
    #> 5    Pluchea dioscoridis 1249284896        32.80815         35.67768
    #> 6      Anemone coronaria 1229610123        33.17204         35.69182
    #> 7        Gazella gazella 1249283121        33.17071         35.76562
    #> 8    Echium plantagineum 1249279813        32.83495         35.79767
    #> 9          Prunus dulcis 1249279907        32.81171         35.68569
    #> 10 Passer hispaniolensis 1249278510        33.04824         35.69454
    #> # ... with 40 more rows, and 75 more variables: issues <chr>,
    #> #   datasetKey <chr>, publishingOrgKey <chr>, publishingCountry <chr>,
    #> #   protocol <chr>, lastCrawled <chr>, lastParsed <chr>, crawlId <int>,
    #> #   extensions <chr>, basisOfRecord <chr>, taxonKey <int>,
    #> #   kingdomKey <int>, phylumKey <int>, classKey <int>, orderKey <int>,
    #> #   familyKey <int>, genusKey <int>, speciesKey <int>,
    #> #   scientificName <chr>, kingdom <chr>, phylum <chr>, order <chr>,
    #> #   family <chr>, genus <chr>, species <chr>, genericName <chr>,
    #> #   specificEpithet <chr>, taxonRank <chr>, dateIdentified <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, year <int>, month <int>,
    #> #   day <int>, eventDate <chr>, modified <chr>, lastInterpreted <chr>,
    #> #   references <chr>, license <chr>, identifiers <chr>, facts <chr>,
    #> #   relations <chr>, geodeticDatum <chr>, class <chr>, countryCode <chr>,
    #> #   country <chr>, rightsHolder <chr>, identifier <chr>,
    #> #   verbatimEventDate <chr>, datasetName <chr>, verbatimLocality <chr>,
    #> #   gbifID <chr>, collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   http...unknown.org.occurrenceDetails <chr>, institutionCode <chr>,
    #> #   rights <chr>, identificationID <chr>, occurrenceRemarks <chr>,
    #> #   eventTime <chr>, informationWithheld <chr>, elevation <dbl>,
    #> #   elevationAccuracy <dbl>, depth <dbl>, depthAccuracy <dbl>,
    #> #   waterBody <chr>, locality <chr>, type <chr>,
    #> #   ownerInstitutionCode <chr>, samplingProtocol <chr>, datasetID <chr>,
    #> #   identifiedBy <chr>, georeferenceSources <chr>

split and expand

    res %>% occ_issues(mutate = "split_expand")

    #> Records found [1967217] 
    #> Records returned [50] 
    #> No. unique hierarchies [38] 
    #> No. media records [48] 
    #> No. facets [0] 
    #> Args [geometry=POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1)),
    #>      limit=50, offset=0, fields=all] 
    #> # A tibble: 50 × 82
    #>                     name        key decimalLatitude decimalLongitude
    #>                    <chr>      <int>           <dbl>            <dbl>
    #> 1          Vulpes vulpes 1262387359        33.13012         35.68513
    #> 2             Sus scrofa 1229924242        33.06315         35.83303
    #> 3  Mandragora autumnalis 1233597424        32.82444         35.70061
    #> 4          Vulpes vulpes 1249281130        33.17339         35.79064
    #> 5    Pluchea dioscoridis 1249284896        32.80815         35.67768
    #> 6      Anemone coronaria 1229610123        33.17204         35.69182
    #> 7        Gazella gazella 1249283121        33.17071         35.76562
    #> 8    Echium plantagineum 1249279813        32.83495         35.79767
    #> 9          Prunus dulcis 1249279907        32.81171         35.68569
    #> 10 Passer hispaniolensis 1249278510        33.04824         35.69454
    #> # ... with 40 more rows, and 78 more variables: COORDINATE_ROUNDED <chr>,
    #> #   GEODETIC_DATUM_ASSUMED_WGS84 <chr>,
    #> #   COORDINATE_REPROJECTION_SUSPICIOUS <chr>,
    #> #   TAXON_MATCH_HIGHERRANK <chr>, datasetKey <chr>,
    #> #   publishingOrgKey <chr>, publishingCountry <chr>, protocol <chr>,
    #> #   lastCrawled <chr>, lastParsed <chr>, crawlId <int>, extensions <chr>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, speciesKey <int>, scientificName <chr>, kingdom <chr>,
    #> #   phylum <chr>, order <chr>, family <chr>, genus <chr>, species <chr>,
    #> #   genericName <chr>, specificEpithet <chr>, taxonRank <chr>,
    #> #   dateIdentified <chr>, coordinateUncertaintyInMeters <dbl>, year <int>,
    #> #   month <int>, day <int>, eventDate <chr>, modified <chr>,
    #> #   lastInterpreted <chr>, references <chr>, license <chr>,
    #> #   identifiers <chr>, facts <chr>, relations <chr>, geodeticDatum <chr>,
    #> #   class <chr>, countryCode <chr>, country <chr>, rightsHolder <chr>,
    #> #   identifier <chr>, verbatimEventDate <chr>, datasetName <chr>,
    #> #   verbatimLocality <chr>, gbifID <chr>, collectionCode <chr>,
    #> #   occurrenceID <chr>, taxonID <chr>, recordedBy <chr>,
    #> #   catalogNumber <chr>, http...unknown.org.occurrenceDetails <chr>,
    #> #   institutionCode <chr>, rights <chr>, identificationID <chr>,
    #> #   occurrenceRemarks <chr>, eventTime <chr>, informationWithheld <chr>,
    #> #   elevation <dbl>, elevationAccuracy <dbl>, depth <dbl>,
    #> #   depthAccuracy <dbl>, waterBody <chr>, locality <chr>, type <chr>,
    #> #   ownerInstitutionCode <chr>, samplingProtocol <chr>, datasetID <chr>,
    #> #   identifiedBy <chr>, georeferenceSources <chr>

split, expand, and remove an issue class

    res %>% occ_issues(-gass84, mutate = "split_expand")

    #> Records found [1967217] 
    #> Records returned [1] 
    #> No. unique hierarchies [38] 
    #> No. media records [48] 
    #> No. facets [0] 
    #> Args [geometry=POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1)),
    #>      limit=50, offset=0, fields=all] 
    #> # A tibble: 1 × 79
    #>                 name        key decimalLatitude decimalLongitude
    #>                <chr>      <int>           <dbl>            <dbl>
    #> 1 Dasyatis pastinaca 1248889625          27.312           33.801
    #> # ... with 75 more variables: COORDINATE_REPROJECTION_SUSPICIOUS <chr>,
    #> #   datasetKey <chr>, publishingOrgKey <chr>, publishingCountry <chr>,
    #> #   protocol <chr>, lastCrawled <chr>, lastParsed <chr>, crawlId <int>,
    #> #   extensions <chr>, basisOfRecord <chr>, taxonKey <int>,
    #> #   kingdomKey <int>, phylumKey <int>, classKey <int>, orderKey <int>,
    #> #   familyKey <int>, genusKey <int>, speciesKey <int>,
    #> #   scientificName <chr>, kingdom <chr>, phylum <chr>, order <chr>,
    #> #   family <chr>, genus <chr>, species <chr>, genericName <chr>,
    #> #   specificEpithet <chr>, taxonRank <chr>, dateIdentified <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, year <int>, month <int>,
    #> #   day <int>, eventDate <chr>, modified <chr>, lastInterpreted <chr>,
    #> #   references <chr>, license <chr>, identifiers <chr>, facts <chr>,
    #> #   relations <chr>, geodeticDatum <chr>, class <chr>, countryCode <chr>,
    #> #   country <chr>, rightsHolder <chr>, identifier <chr>,
    #> #   verbatimEventDate <chr>, datasetName <chr>, verbatimLocality <chr>,
    #> #   gbifID <chr>, collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   http...unknown.org.occurrenceDetails <chr>, institutionCode <chr>,
    #> #   rights <chr>, identificationID <chr>, occurrenceRemarks <chr>,
    #> #   eventTime <chr>, informationWithheld <chr>, elevation <dbl>,
    #> #   elevationAccuracy <dbl>, depth <dbl>, depthAccuracy <dbl>,
    #> #   waterBody <chr>, locality <chr>, type <chr>,
    #> #   ownerInstitutionCode <chr>, samplingProtocol <chr>, datasetID <chr>,
    #> #   identifiedBy <chr>, georeferenceSources <chr>

Other cleaning
--------------

-   Contextual cleaning based on
-   impossible lat/long values
-   expected habitat type
-   expected range of values
-   etc.

Your turn
---------

-   5 min

> Get some data from rgbif::occsearch, then use rgbif::occ\_issues to
> parse data.
