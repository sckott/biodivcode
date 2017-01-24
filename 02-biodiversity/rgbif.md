rgbif data
----------

    library('rgbif')

Names
-----

    name_backbone(name='Helianthus', rank='genus', kingdom='plants')

    #> $usageKey
    #> [1] 3119134
    #> 
    #> $scientificName
    #> [1] "Helianthus L."
    #> 
    #> $canonicalName
    #> [1] "Helianthus"
    #> 
    #> $rank
    #> [1] "GENUS"
    #> 
    #> $status
    #> [1] "ACCEPTED"
    #> 
    #> $confidence
    #> [1] 97
    #> 
    #> $matchType
    #> [1] "EXACT"
    #> 
    #> $kingdom
    #> [1] "Plantae"
    #> 
    #> $phylum
    #> [1] "Tracheophyta"
    #> 
    #> $order
    #> [1] "Asterales"
    #> 
    #> $family
    #> [1] "Asteraceae"
    #> 
    #> $genus
    #> [1] "Helianthus"
    #> 
    #> $kingdomKey
    #> [1] 6
    #> 
    #> $phylumKey
    #> [1] 7707728
    #> 
    #> $classKey
    #> [1] 220
    #> 
    #> $orderKey
    #> [1] 414
    #> 
    #> $familyKey
    #> [1] 3065
    #> 
    #> $genusKey
    #> [1] 3119134
    #> 
    #> $synonym
    #> [1] FALSE
    #> 
    #> $class
    #> [1] "Magnoliopsida"

Registry metadata
-----------------

    dataset_search(query="stockholm", limit = 10)

    #> $meta
    #>   offset limit endOfRecords count
    #> 1      0     3         TRUE     3
    #> 
    #> $data
    #> # A tibble: 3 × 8
    #>                                                                  datasetTitle
    #>                                                                         <chr>
    #> 1                                                                  SBT-Living
    #> 2                                                                    gamma 91
    #> 3 Wissenschaftliche Ergebnisse der schwedischen zoologischen Expedition nach 
    #> # ... with 7 more variables: datasetKey <chr>, type <chr>,
    #> #   hostingOrganization <chr>, hostingOrganizationKey <chr>,
    #> #   publishingOrganization <chr>, publishingOrganizationKey <chr>,
    #> #   publishingCountry <chr>
    #> 
    #> $facets
    #> NULL
    #> 
    #> $descriptions
    #> $descriptions$`SBT-Living`
    #> [1] "Database on living organism from Bergius Botanical Garden, Stockholm, Sweden."
    #> 
    #> $descriptions$`gamma 91`
    #> [1] "This dataset contains the digitized treatments in Plazi based on the original book chapter Carolus Linnaeus (1758): gamma 91. In: Systema naturae per regna tria naturae, secundum classes, ordines, genera, species, cum characteribus, differentiis, synonymis, locis. Laurentii Salvii, Holmiae [= Stockholm].: 513, DOI: 10.5962/bhl.title.542"
    #> 
    #> $descriptions$`Wissenschaftliche Ergebnisse der schwedischen zoologischen Expedition nach dem Kilimanjaro, dem Meru und den umgebenden Massaisteppen Deutsch-Ostafrikas 1905 - 1906 ..., Band 2, Abt. 8.`
    #> [1] "This dataset contains the digitized treatments in Plazi based on the original book / thesis / monograph Sjoestedt, Y. (1909): Wissenschaftliche Ergebnisse der schwedischen zoologischen Expedition nach dem Kilimanjaro, dem Meru und den umgebenden Massaisteppen Deutsch-Ostafrikas 1905 - 1906 ..., Band 2, Abt. 8. Stockholm: Palmquist, URL: http://hdl.handle.net/10199/15424"

Occurrence data search
----------------------

Two interfaces, one with more options, but a little slower

    occ_search(scientificName = 'Pulsatilla patens', limit=10)

    #> Records found [2326] 
    #> Records returned [10] 
    #> No. unique hierarchies [1] 
    #> No. media records [5] 
    #> No. facets [0] 
    #> Args [scientificName=Pulsatilla patens, limit=10, offset=0, fields=all] 
    #> # A tibble: 10 × 83
    #>                 name        key decimalLatitude decimalLongitude
    #>                <chr>      <int>           <dbl>            <dbl>
    #> 1  Pulsatilla patens 1323004927        41.21990       -105.36418
    #> 2  Pulsatilla patens 1291095633        38.95827       -106.99710
    #> 3  Pulsatilla patens 1291105397        38.98021       -106.97910
    #> 4  Pulsatilla patens 1291105402        38.98034       -106.97908
    #> 5  Pulsatilla patens 1228007947        57.84383         27.43936
    #> 6  Pulsatilla patens 1315045243        49.60839        -96.09044
    #> 7  Pulsatilla patens 1228008856        58.65087         26.89444
    #> 8  Pulsatilla patens 1135664771        57.69870         18.66510
    #> 9  Pulsatilla patens 1228009311        58.05958         26.11485
    #> 10 Pulsatilla patens 1135293476        57.72170         18.69630
    #> # ... with 79 more variables: issues <chr>, datasetKey <chr>,
    #> #   publishingOrgKey <chr>, publishingCountry <chr>, protocol <chr>,
    #> #   lastCrawled <chr>, lastParsed <chr>, crawlId <int>, extensions <chr>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, speciesKey <int>, scientificName <chr>, kingdom <chr>,
    #> #   phylum <chr>, order <chr>, family <chr>, genus <chr>, species <chr>,
    #> #   genericName <chr>, specificEpithet <chr>, infraspecificEpithet <chr>,
    #> #   taxonRank <chr>, dateIdentified <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, year <int>, month <int>,
    #> #   day <int>, eventDate <chr>, modified <chr>, lastInterpreted <chr>,
    #> #   references <chr>, license <chr>, identifiers <chr>, facts <chr>,
    #> #   relations <chr>, geodeticDatum <chr>, class <chr>, countryCode <chr>,
    #> #   country <chr>, rightsHolder <chr>, identifier <chr>,
    #> #   verbatimEventDate <chr>, datasetName <chr>, verbatimLocality <chr>,
    #> #   gbifID <chr>, collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   http...unknown.org.occurrenceDetails <chr>, institutionCode <chr>,
    #> #   rights <chr>, eventTime <chr>, identificationID <chr>,
    #> #   individualCount <int>, habitat <chr>, footprintWKT <chr>,
    #> #   municipality <chr>, identificationVerificationStatus <chr>,
    #> #   locationID <chr>, identifiedBy <chr>, higherClassification <chr>,
    #> #   occurrenceRemarks <chr>, coordinatePrecision <dbl>, elevation <dbl>,
    #> #   elevationAccuracy <dbl>, depth <dbl>, depthAccuracy <dbl>,
    #> #   stateProvince <chr>, county <chr>, locality <chr>

Another with less options, optimized for speed

    (key <- name_backbone(name='Encelia californica')$speciesKey)

    #> [1] 3118771

    occ_data(taxonKey = key, limit = 4)

    #> Records found [1542] 
    #> Records returned [4] 
    #> Args [taxonKey=3118771, limit=4, offset=0] 
    #> # A tibble: 4 × 59
    #>                  name        key decimalLatitude decimalLongitude
    #>                 <chr>      <int>           <dbl>            <dbl>
    #> 1 Encelia californica 1305117876        34.17704        -118.0971
    #> 2 Encelia californica 1291069011        33.06906        -117.0884
    #> 3 Encelia californica 1229925668        34.18108        -118.0964
    #> 4 Encelia californica 1249277427        32.54470        -117.1221
    #> # ... with 55 more variables: issues <chr>, datasetKey <chr>,
    #> #   publishingOrgKey <chr>, publishingCountry <chr>, protocol <chr>,
    #> #   lastCrawled <chr>, lastParsed <chr>, crawlId <int>,
    #> #   basisOfRecord <chr>, taxonKey <int>, kingdomKey <int>,
    #> #   phylumKey <int>, classKey <int>, orderKey <int>, familyKey <int>,
    #> #   genusKey <int>, scientificName <chr>, kingdom <chr>, phylum <chr>,
    #> #   order <chr>, family <chr>, genus <chr>, genericName <chr>,
    #> #   specificEpithet <chr>, taxonRank <chr>, dateIdentified <chr>,
    #> #   year <int>, month <int>, day <int>, eventDate <chr>, modified <chr>,
    #> #   lastInterpreted <chr>, references <chr>, license <chr>,
    #> #   geodeticDatum <chr>, class <chr>, countryCode <chr>, country <chr>,
    #> #   rightsHolder <chr>, identifier <chr>, verbatimEventDate <chr>,
    #> #   datasetName <chr>, verbatimLocality <chr>, gbifID <chr>,
    #> #   collectionCode <chr>, occurrenceID <chr>, taxonID <chr>,
    #> #   recordedBy <chr>, catalogNumber <chr>,
    #> #   `http://unknown.org/occurrenceDetails` <chr>, institutionCode <chr>,
    #> #   rights <chr>, identificationID <chr>,
    #> #   coordinateUncertaintyInMeters <dbl>, eventTime <chr>

Your turn
---------

-   5 min

> Search for names with any name\_\* functions, then using taxonomic Ids
> search for occurrences with occ\_search() or occ\_data.
