Taxonomic identifiers
=====================

Search by taxonomic name
------------------------

    library('taxize')
    (out <- get_uid("Poa annua"))

    #> [1] "93036"
    #> attr(,"class")
    #> [1] "uid"
    #> attr(,"match")
    #> [1] "found"
    #> attr(,"multiple_matches")
    #> [1] FALSE
    #> attr(,"pattern_match")
    #> [1] FALSE
    #> attr(,"uri")
    #> [1] "https://www.ncbi.nlm.nih.gov/taxonomy/93036"

Sometimes you are presented with a prompt
-----------------------------------------

    get_colid("Alces alces")
    #>                       name         rank                            colid   name_status  kingdom   family
    #> 1              Alces alces      species fc7d998315ba4a3e50cfab10954bdc45 accepted name Animalia Cervidae
    #> 2        Alces alces alces infraspecies f2d7d57ae493db1767049fc11bb999cf accepted name Animalia Cervidae
    #> 3   Alces alces caucasicus infraspecies ffdb4bc3627d6293e48b07d67802388d accepted name Animalia Cervidae
    #> 4    Alces alces americana infraspecies 505aab1a2067afac631af51b575d115e       synonym     <NA>     <NA>
    #> 5    Alces alces andersoni infraspecies 505aab1a2067afac631af51b575d115e       synonym     <NA>     <NA>
    #> 6   Alces alces cameloides infraspecies c8557a9c74530ec84395efaaec4f6bfd       synonym     <NA>     <NA>
    #> 7        Alces alces gigas infraspecies 505aab1a2067afac631af51b575d115e       synonym     <NA>     <NA>
    #> 8 Alces alces pfizenmayeri infraspecies 505aab1a2067afac631af51b575d115e       synonym     <NA>     <NA>
    #> 9      Alces alces shirasi infraspecies 505aab1a2067afac631af51b575d115e       synonym     <NA>     <NA>

Underscore method: get all data
-------------------------------

    get_colid_("Alces alces")

    #> $`Alces alces`
    #>                                 id                     name         rank
    #> 1 fc7d998315ba4a3e50cfab10954bdc45              Alces alces      species
    #> 2 f2d7d57ae493db1767049fc11bb999cf        Alces alces alces infraspecies
    #> 3 ffdb4bc3627d6293e48b07d67802388d   Alces alces caucasicus infraspecies
    #> 4 e31cef1ea5767f75248e7a719d10002e    Alces alces americana infraspecies
    #> 5 161ffee346e1c38276a479ac32851fe0    Alces alces andersoni infraspecies
    #> 6 109ba8cfc0f6c01a0d546480f9742f07   Alces alces cameloides infraspecies
    #> 7 8fb6d8e1fb5a28399f2c54d26514c3af        Alces alces gigas infraspecies
    #> 8 24e57f96b4fad7c293629a0d150d05ec Alces alces pfizenmayeri infraspecies
    #> 9 0af74b43d6b1360bee482cad45fcd99e      Alces alces shirasi infraspecies
    #>          status                                                   source
    #> 1 accepted name ITIS Global: The Integrated Taxonomic Information System
    #> 2 accepted name ITIS Global: The Integrated Taxonomic Information System
    #> 3 accepted name ITIS Global: The Integrated Taxonomic Information System
    #> 4       synonym ITIS Global: The Integrated Taxonomic Information System
    #> 5       synonym ITIS Global: The Integrated Taxonomic Information System
    #> 6       synonym ITIS Global: The Integrated Taxonomic Information System
    #> 7       synonym ITIS Global: The Integrated Taxonomic Information System
    #> 8       synonym ITIS Global: The Integrated Taxonomic Information System
    #> 9       synonym ITIS Global: The Integrated Taxonomic Information System
    #>                             acc_id                    acc_name
    #> 1                             <NA>                        <NA>
    #> 2                             <NA>                        <NA>
    #> 3                             <NA>                        <NA>
    #> 4 505aab1a2067afac631af51b575d115e Alces americanus americanus
    #> 5 505aab1a2067afac631af51b575d115e Alces americanus americanus
    #> 6 c8557a9c74530ec84395efaaec4f6bfd Alces americanus cameloides
    #> 7 505aab1a2067afac631af51b575d115e Alces americanus americanus
    #> 8 505aab1a2067afac631af51b575d115e Alces americanus americanus
    #> 9 505aab1a2067afac631af51b575d115e Alces americanus americanus
    #>       acc_rank    acc_status
    #> 1         <NA>          <NA>
    #> 2         <NA>          <NA>
    #> 3         <NA>          <NA>
    #> 4 infraspecies accepted name
    #> 5 infraspecies accepted name
    #> 6 infraspecies accepted name
    #> 7 infraspecies accepted name
    #> 8 infraspecies accepted name
    #> 9 infraspecies accepted name
    #>                                                 acc_source
    #> 1                                                     <NA>
    #> 2                                                     <NA>
    #> 3                                                     <NA>
    #> 4 ITIS Global: The Integrated Taxonomic Information System
    #> 5 ITIS Global: The Integrated Taxonomic Information System
    #> 6 ITIS Global: The Integrated Taxonomic Information System
    #> 7 ITIS Global: The Integrated Taxonomic Information System
    #> 8 ITIS Global: The Integrated Taxonomic Information System
    #> 9 ITIS Global: The Integrated Taxonomic Information System

Then choose which name yourself, ideally programatically.

Coerce ids to ID classes
------------------------

    as.gbifid(2704179)

    #> [1] "2704179"
    #> attr(,"class")
    #> [1] "gbifid"
    #> attr(,"match")
    #> [1] "found"
    #> attr(,"multiple_matches")
    #> [1] FALSE
    #> attr(,"pattern_match")
    #> [1] FALSE
    #> attr(,"uri")
    #> [1] "http://www.gbif.org/species/2704179"

    as.gbifid(2704179, check = FALSE)

    #> [1] "2704179"
    #> attr(,"class")
    #> [1] "gbifid"
    #> attr(,"match")
    #> [1] "found"
    #> attr(,"multiple_matches")
    #> [1] FALSE
    #> attr(,"pattern_match")
    #> [1] FALSE
    #> attr(,"uri")
    #> [1] "http://www.gbif.org/species/2704179"

Then many functions become available that act on these ID classes

Many names - the ids class
--------------------------

In this case get many identifiers for many names, then pass in
identifiers to get many classifications

    mynames <- c("Helianthus annuus","Pinus contorta","Collomia grandiflora")
    out <- get_ids(mynames, db = c('ncbi','itis','col','tropicos'))

    #>                              name    rank                            colid
    #> 1               Helianthus annuus species 87e986b0873f648711900866fa8abde7
    #> 2        Helianthus annuus annuus species 87e986b0873f648711900866fa8abde7
    #> 3  Helianthus annuus lenticularis species 87e986b0873f648711900866fa8abde7
    #> 4        Helianthus annuus annuus species 87e986b0873f648711900866fa8abde7
    #> 5       Helianthus annuus jaegeri species 87e986b0873f648711900866fa8abde7
    #> 6  Helianthus annuus lenticularis species edaca9efbba0f3de178f59be0d99362f
    #> 7    Helianthus annuus petiolaris species 5647a45549aa0c15a95bb44844bf93cc
    #> 8       Helianthus annuus texanus species 87e986b0873f648711900866fa8abde7
    #> 9        Helianthus annuus annuus species 87e986b0873f648711900866fa8abde7
    #> 10  Helianthus annuus argophyllus species f9ea8aec85f3f21e148d29f361f7c016
    #> 11 Helianthus annuus lenticularis species 87e986b0873f648711900866fa8abde7
    #> 12  Helianthus annuus macrocarpus species 87e986b0873f648711900866fa8abde7
    #> 13      Helianthus annuus texanus species 87e986b0873f648711900866fa8abde7
    #>                    name_status kingdom     family                acc_name
    #> 1  provisionally accepted name Plantae Asteraceae                    <NA>
    #> 2                      synonym    <NA>       <NA>       Helianthus annuus
    #> 3                      synonym    <NA>       <NA>       Helianthus annuus
    #> 4                      synonym    <NA>       <NA>       Helianthus annuus
    #> 5                      synonym    <NA>       <NA>       Helianthus annuus
    #> 6                      synonym    <NA>       <NA> Helianthus lenticularis
    #> 7                      synonym    <NA>       <NA>   Helianthus petiolaris
    #> 8                      synonym    <NA>       <NA>       Helianthus annuus
    #> 9                      synonym    <NA>       <NA>       Helianthus annuus
    #> 10                     synonym    <NA>       <NA>  Helianthus argophyllus
    #> 11                     synonym    <NA>       <NA>       Helianthus annuus
    #> 12                     synonym    <NA>       <NA>       Helianthus annuus
    #> 13                     synonym    <NA>       <NA>       Helianthus annuus
    #>                          name         rank
    #> 1              Pinus contorta      species
    #> 2     Pinus contorta contorta infraspecies
    #> 3    Pinus contorta latifolia infraspecies
    #> 4    Pinus contorta murrayana infraspecies
    #> 5    Pinus contorta bolanderi infraspecies
    #> 6    Pinus contorta latifolia infraspecies
    #> 7    Pinus contorta murrayana infraspecies
    #> 8    Pinus contorta bolanderi infraspecies
    #> 9  Pinus contorta hendersonii infraspecies
    #> 10  Pinus contorta yukonensis infraspecies
    #>                               colid   name_status kingdom   family
    #> 1  13c40c3f2be0b0965bddf948d2b3115f accepted name Plantae Pinaceae
    #> 2  5002b62472fd69875e2e1ed9cdb46654 accepted name Plantae Pinaceae
    #> 3  101a09a805ae665cc4fc58a36634011b accepted name Plantae Pinaceae
    #> 4  cb561ff9a21649d0b301e3ea98fbe0ed accepted name Plantae Pinaceae
    #> 5  5002b62472fd69875e2e1ed9cdb46654       synonym    <NA>     <NA>
    #> 6  101a09a805ae665cc4fc58a36634011b       synonym    <NA>     <NA>
    #> 7  cb561ff9a21649d0b301e3ea98fbe0ed       synonym    <NA>     <NA>
    #> 8  5002b62472fd69875e2e1ed9cdb46654       synonym    <NA>     <NA>
    #> 9  101a09a805ae665cc4fc58a36634011b       synonym    <NA>     <NA>
    #> 10 101a09a805ae665cc4fc58a36634011b       synonym    <NA>     <NA>
    #>                    acc_name
    #> 1                      <NA>
    #> 2                      <NA>
    #> 3                      <NA>
    #> 4                      <NA>
    #> 5   Pinus contorta contorta
    #> 6  Pinus contorta latifolia
    #> 7  Pinus contorta murrayana
    #> 8   Pinus contorta contorta
    #> 9  Pinus contorta latifolia
    #> 10 Pinus contorta latifolia
    #>                   name    rank                            colid
    #> 1 Collomia grandiflora species f312c404a28bcbbc175b8669d1957129
    #> 2 Collomia grandiflora species f312c404a28bcbbc175b8669d1957129
    #>         name_status kingdom        family             acc_name
    #> 1     accepted name Plantae Polemoniaceae                 <NA>
    #> 2 ambiguous synonym    <NA>          <NA> Collomia grandiflora
    #>        tpsid                                  name     family   rank
    #> 1    2700851                     Helianthus annuus Asteraceae    sp.
    #> 2    2700852   Helianthus annuus subsp. couplandii Asteraceae subsp.
    #> 3    2700853 Helianthus annuus subsp. lenticularis Asteraceae subsp.
    #> 4    2702619         Helianthus annuus var. annuus Asteraceae   var.
    #> 5    2702620    Helianthus annuus var. armavirskij Asteraceae   var.
    #> 6    2702621        Helianthus annuus var. bicolor Asteraceae   var.
    #> 7    2702622   Helianthus annuus var. californicus Asteraceae   var.
    #> 8    2702623 Helianthus annuus var. gallardiflorus Asteraceae   var.
    #> 9    2702624       Helianthus annuus var. globosus Asteraceae   var.
    #> 10   2702625    Helianthus annuus var. intermedius Asteraceae   var.
    #> 11   2702626     Helianthus annuus var. primulinus Asteraceae   var.
    #> 12   2702627      Helianthus annuus var. uniflorus Asteraceae   var.
    #> 13   2702628  Helianthus annuus var. vinossissimus Asteraceae   var.
    #> 14   2702629        Helianthus annuus var. zonatus Asteraceae   var.
    #> 15   2724044    Helianthus annuus var. macrocarpus Asteraceae   var.
    #> 16   2724045      Helianthus annuus subsp. jaegeri Asteraceae subsp.
    #> 17   2724046       Helianthus annuus subsp. annuus Asteraceae subsp.
    #> 18   2724756          Helianthus annuus fo. fallax Asteraceae    fo.
    #> 19   2724757          Helianthus annuus fo. annuus Asteraceae    fo.
    #> 20   2726013      Helianthus annuus subsp. texanus Asteraceae subsp.
    #> 21  50069938      Helianthus annuus var. coronatus Asteraceae   var.
    #> 22  50069939         Helianthus annuus var. aridus Asteraceae   var.
    #> 23  50069940      Helianthus annuus var. latibasis Asteraceae   var.
    #> 24  50069941    Helianthus annuus fo. lenticularis Asteraceae    fo.
    #> 25  50071063   Helianthus annuus subsp. petiolaris Asteraceae subsp.
    #> 26  50071132   Helianthus annuus var. lenticularis Asteraceae   var.
    #> 27  50229527        Helianthus annuus var. texanus Asteraceae   var.
    #> 28  50289543       Helianthus annuus var. citrinus Asteraceae   var.
    #> 29 100000278        Helianthus annuus x petiolaris Asteraceae   var.
    #>        status                        author date
    #> 1  Legitimate                            L. 1753
    #> 2  No opinion (B. Boivin) Á. Löve & D. Löve 1982
    #> 3  No opinion (Douglas ex Lindl.) Cockerell 1908
    #> 4  No opinion                                   
    #> 5  No opinion                                  *
    #> 6  No opinion                                  *
    #> 7  No opinion                                  *
    #> 8  No opinion                                  *
    #> 9     Invalid                    fistulosus    *
    #> 10 No opinion                                  *
    #> 11 No opinion                     Cockerell 1913
    #> 12 No opinion                                  *
    #> 13 No opinion                                  *
    #> 14 No opinion                                  *
    #> 15 No opinion               (DC.) Cockerell 1915
    #> 16 No opinion               (Heiser) Heiser 1955
    #> 17 No opinion                                   
    #> 18 No opinion                     B. Boivin 1960
    #> 19 No opinion                                   
    #> 20 No opinion                        Heiser 1954
    #> 21 No opinion                     Cockerell 1910
    #> 22 No opinion             (Rydb.) Cockerell 1915
    #> 23 No opinion                     Cockerell 1918
    #> 24 No opinion (Douglas ex Lindl.) B. Boivin 1960
    #> 25 No opinion              (Nutt.) Anashch. 1974
    #> 26 No opinion  (Douglas ex Lindl.) Steyerm. 1960
    #> 27 No opinion             (Heiser) Shinners 1964
    #> 28 No opinion                                  *
    #> 29 No opinion                                  *
    #>        tpsid                                name   family       rank
    #> 1   24900183                      Pinus contorta Pinaceae        sp.
    #> 2   24900184       Pinus contorta var. bolanderi Pinaceae       var.
    #> 3   24900185       Pinus contorta var. latifolia Pinaceae       var.
    #> 4   24900186       Pinus contorta var. murrayana Pinaceae       var.
    #> 5   24900317     Pinus contorta subsp. murrayana Pinaceae     subsp.
    #> 6   24900318     Pinus contorta subsp. latifolia Pinaceae     subsp.
    #> 7   24900433     Pinus contorta var. hendersonii Pinaceae       var.
    #> 8   24900487 Pinus contorta unranked hendersonii Pinaceae [unranked]
    #> 9   24900528        Pinus contorta var. contorta Pinaceae       var.
    #> 10  24900627      Pinus contorta subsp. contorta Pinaceae     subsp.
    #> 11  24900810     Pinus contorta subsp. bolanderi Pinaceae     subsp.
    #> 12  24901682       Pinus contorta var. bolanderi Pinaceae       var.
    #> 13  50231950       Pinus contorta var. bolanderi Pinaceae       var.
    #> 14  50231960     Pinus contorta subsp. murrayana Pinaceae     subsp.
    #> 15 100351799             Pinus subsect. Contorta Pinaceae   subsect.
    #> 16 100363705      Pinus contorta var. yukonensis Pinaceae       var.
    #>        status             author date
    #> 1  No opinion  Douglas ex Loudon 1838
    #> 2  No opinion              Vasey 1876
    #> 3  No opinion            Engelm. 1871
    #> 4  No opinion    (Balf.) Engelm. 1880
    #> 5  No opinion   (Balf.) Critchf. 1957
    #> 6  No opinion (Engelm.) Critchf. 1957
    #> 7  No opinion             Lemmon 1894
    #> 8  No opinion             Lemmon 1895
    #> 9  No opinion                        
    #> 10 No opinion                        
    #> 11 No opinion   (Parl.) Critchf. 1957
    #> 12 No opinion             Lemmon 1894
    #> 13 No opinion     (Parl.) Koehne 1893
    #> 14 No opinion    (Balf.) Engelm. 1880
    #> 15 No opinion                        
    #> 16 No opinion        W.L. Strong 2010
    #>        tpsid                                  name        family rank
    #> 1   25800485                  Collomia grandiflora Polemoniaceae  sp.
    #> 2   50130471   Collomia grandiflora var. axillaris Polemoniaceae var.
    #> 3   50130472 Collomia grandiflora var. grandiflora Polemoniaceae var.
    #> 4  100314137    Collomia grandiflora fo. axillaris Polemoniaceae  fo.
    #> 5  100314138   Collomia grandiflora fo. cryptantha Polemoniaceae  fo.
    #> 6  100314139      Collomia grandiflora fo. diffusa Polemoniaceae  fo.
    #> 7  100314140       Collomia grandiflora fo. scabra Polemoniaceae  fo.
    #> 8  100314141   Collomia grandiflora fo. tenuiflora Polemoniaceae  fo.
    #> 9  100314142     Collomia grandiflora var. diffusa Polemoniaceae var.
    #> 10 100314143  Collomia grandiflora var. tenuiflora Polemoniaceae var.
    #>        status             author date
    #> 1  No opinion  Douglas ex Lindl. 1828
    #> 2  No opinion          A. Nelson 1911
    #> 3  No opinion                        
    #> 4  No opinion (A. Nelson) Wherry 1944
    #> 5  No opinion             Wherry 1944
    #> 6  No opinion   (Mulford) Wherry 1944
    #> 7  No opinion    (Greene) Wherry 1944
    #> 8  No opinion    (Benth.) Wherry 1944
    #> 9  No opinion    (Mulford) Piper 1906
    #> 10 No opinion             Benth. 1845

    out$tropicos

    #>    Helianthus annuus       Pinus contorta Collomia grandiflora 
    #>            "2700851"           "24900183"           "25800485" 
    #> attr(,"class")
    #> [1] "tpsid"
    #> attr(,"match")
    #> [1] "found" "found" "found"
    #> attr(,"multiple_matches")
    #> [1] TRUE TRUE TRUE
    #> attr(,"pattern_match")
    #> [1] FALSE FALSE FALSE
    #> attr(,"uri")
    #> [1] "http://tropicos.org/Name/2700851"  "http://tropicos.org/Name/24900183"
    #> [3] "http://tropicos.org/Name/25800485"

    class(out)

    #> [1] "ids"

    class(out$col)

    #> [1] "colid"

    classification(out$col)

    #> $`87e986b0873f648711900866fa8abde7`
    #>                name    rank                               id
    #> 1           Plantae kingdom 208cf441fe2e1662376a9ce9e80782e1
    #> 2      Tracheophyta  phylum 73328ba4e1446e1ee3602956b66eb127
    #> 3     Magnoliopsida   class 53497bb664b89c28e60f020f7f21f882
    #> 4         Asterales   order 471d959a932eaaaf30c5e10143b82695
    #> 5        Asteraceae  family 686b0bd149d94e43973b551ad66d1196
    #> 6        Helianthus   genus 4c30d12747686fa7f84c74ba60e54c7a
    #> 7 Helianthus annuus species 87e986b0873f648711900866fa8abde7
    #> 
    #> $`13c40c3f2be0b0965bddf948d2b3115f`
    #>             name    rank                               id
    #> 1        Plantae kingdom 208cf441fe2e1662376a9ce9e80782e1
    #> 2   Tracheophyta  phylum 73328ba4e1446e1ee3602956b66eb127
    #> 3      Pinopsida   class b60c43b274b1d5f46c8c900add799766
    #> 4        Pinales   order 844f3ce878b11544be19b2da1c2f03dc
    #> 5       Pinaceae  family b385e5b1bd137efbb9a5387821127481
    #> 6          Pinus   genus 5802b2ad2dad3a3bb507f5838a16833e
    #> 7 Pinus contorta species 13c40c3f2be0b0965bddf948d2b3115f
    #> 
    #> $f312c404a28bcbbc175b8669d1957129
    #>                   name    rank                               id
    #> 1              Plantae kingdom 208cf441fe2e1662376a9ce9e80782e1
    #> 2         Tracheophyta  phylum 73328ba4e1446e1ee3602956b66eb127
    #> 3        Magnoliopsida   class 53497bb664b89c28e60f020f7f21f882
    #> 4             Ericales   order 1cf1fd90d9326849ef78426e68358674
    #> 5        Polemoniaceae  family 9ae6247f8992041c2770be9c18010de7
    #> 6             Collomia   genus 6c3d918371702e3a61015e2a9f528123
    #> 7 Collomia grandiflora species f312c404a28bcbbc175b8669d1957129
    #> 
    #> attr(,"class")
    #> [1] "classification"
    #> attr(,"db")
    #> [1] "col"

Your turn
---------

-   5 min

> Search 3 different data sources via get\* functions, each with a few
> taxonomic names you know off the top of your head. If you can't think
> of any see names\_list() function.

Use identifiers with other functions
====================================

Taxonomic hierarchy

    classification(9606, db = 'ncbi')

    #> $`9606`
    #>                    name         rank      id
    #> 1    cellular organisms      no rank  131567
    #> 2             Eukaryota superkingdom    2759
    #> 3          Opisthokonta      no rank   33154
    #> 4               Metazoa      kingdom   33208
    #> 5             Eumetazoa      no rank    6072
    #> 6             Bilateria      no rank   33213
    #> 7         Deuterostomia      no rank   33511
    #> 8              Chordata       phylum    7711
    #> 9              Craniata    subphylum   89593
    #> 10           Vertebrata      no rank    7742
    #> 11        Gnathostomata      no rank    7776
    #> 12           Teleostomi      no rank  117570
    #> 13         Euteleostomi      no rank  117571
    #> 14        Sarcopterygii      no rank    8287
    #> 15 Dipnotetrapodomorpha      no rank 1338369
    #> 16            Tetrapoda      no rank   32523
    #> 17              Amniota      no rank   32524
    #> 18             Mammalia        class   40674
    #> 19               Theria      no rank   32525
    #> 20             Eutheria      no rank    9347
    #> 21        Boreoeutheria      no rank 1437010
    #> 22     Euarchontoglires   superorder  314146
    #> 23             Primates        order    9443
    #> 24          Haplorrhini     suborder  376913
    #> 25          Simiiformes   infraorder  314293
    #> 26           Catarrhini    parvorder    9526
    #> 27           Hominoidea  superfamily  314295
    #> 28            Hominidae       family    9604
    #> 29            Homininae    subfamily  207598
    #> 30                 Homo        genus    9605
    #> 31         Homo sapiens      species    9606
    #> 
    #> attr(,"class")
    #> [1] "classification"
    #> attr(,"db")
    #> [1] "ncbi"

Get synonyms

    synonyms('Pomatomus saltatrix', db = 'worms')

    #> $`Pomatomus saltatrix`
    #> # A tibble: 17 × 25
    #>    AphiaID                                                           url
    #> *    <int>                                                         <chr>
    #> 1   312701 http://www.marinespecies.org/aphia.php?p=taxdetails&id=312701
    #> 2   312708 http://www.marinespecies.org/aphia.php?p=taxdetails&id=312708
    #> 3   304154 http://www.marinespecies.org/aphia.php?p=taxdetails&id=304154
    #> 4   301162 http://www.marinespecies.org/aphia.php?p=taxdetails&id=301162
    #> 5   318226 http://www.marinespecies.org/aphia.php?p=taxdetails&id=318226
    #> 6   318924 http://www.marinespecies.org/aphia.php?p=taxdetails&id=318924
    #> 7   307327 http://www.marinespecies.org/aphia.php?p=taxdetails&id=307327
    #> 8   401541 http://www.marinespecies.org/aphia.php?p=taxdetails&id=401541
    #> 9   304209 http://www.marinespecies.org/aphia.php?p=taxdetails&id=304209
    #> 10  127002 http://www.marinespecies.org/aphia.php?p=taxdetails&id=127002
    #> 11  304210 http://www.marinespecies.org/aphia.php?p=taxdetails&id=304210
    #> 12  321302 http://www.marinespecies.org/aphia.php?p=taxdetails&id=321302
    #> 13  321589 http://www.marinespecies.org/aphia.php?p=taxdetails&id=321589
    #> 14  321742 http://www.marinespecies.org/aphia.php?p=taxdetails&id=321742
    #> 15  321804 http://www.marinespecies.org/aphia.php?p=taxdetails&id=321804
    #> 16  321806 http://www.marinespecies.org/aphia.php?p=taxdetails&id=321806
    #> 17  321807 http://www.marinespecies.org/aphia.php?p=taxdetails&id=321807
    #> # ... with 23 more variables: scientificname <chr>, authority <chr>,
    #> #   status <chr>, unacceptreason <chr>, rank <chr>, valid_AphiaID <int>,
    #> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
    #> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
    #> #   lsid <chr>, isMarine <int>, isBrackish <int>, isFreshwater <int>,
    #> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
    #> 
    #> attr(,"class")
    #> [1] "synonyms"
    #> attr(,"db")
    #> [1] "worms"

Get children

    children("Salmo", db = 'worms')

    #> $Salmo
    #> # A tibble: 187 × 3
    #>    childtaxa_id        childtaxa_name childtaxa_rank
    #>           <int>                 <chr>          <chr>
    #> 1        154470       Salmo (Osmerus)       Subgenus
    #> 2        712455       Salmo abanticus        Species
    #> 3        305943          Salmo albula        Species
    #> 4        305944           Salmo albus        Species
    #> 5        305945           Salmo albus        Species
    #> 6        305946 Salmo alpinostagnalis        Species
    #> 7        154821         Salmo alpinus        Species
    #> 8        305947       Salmo altivelis        Species
    #> 9        305948      Salmo argentinus        Species
    #> 10       400236          Salmo artedi        Species
    #> # ... with 177 more rows
    #> 
    #> attr(,"class")
    #> [1] "children"
    #> attr(,"db")
    #> [1] "worms"

Your turn
=========

-   5 min

> Take some taxonomic IDs or get new ones, and inputs those IDs to other
> taxize functions. Try to use one above you just saw and another one in
> the documentation.
