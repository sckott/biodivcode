Hierarchies
-----------

Full hierarchies

    library('taxize')
    splist <- c("Helianthus annuus","Pinus contorta","Collomia grandiflora","Abies magnifica","Rosa californica","Datura wrightii","Mimulus bicolor","Nicotiana glauca","Madia sativa","Bartlettia scaposa")
    class_list <- classification(splist, db = "gbif")

    #>    gbifid                   scientificname    rank   status matchtype
    #> 1 5285750 Pinus contorta Douglas ex Loudon species ACCEPTED     EXACT
    #> 2 8405446              Pinus contorta Bol. species DOUBTFUL     EXACT
    #> 3 7617264            Pinus contorta Dougl. species DOUBTFUL     EXACT
    #>    gbifid                         scientificname    rank   status
    #> 1 2927556 Collomia grandiflora Douglas ex Lindl. species ACCEPTED
    #> 2 7845261       Collomia grandiflora sp. lindley species ACCEPTED
    #> 3 7653749            Collomia grandiflora Dougl. species  SYNONYM
    #> 4 8329565    Collomia grandiflora Douglas ex DC. species DOUBTFUL
    #>   matchtype
    #> 1     EXACT
    #> 2     EXACT
    #> 3     EXACT
    #> 4     EXACT
    #>    gbifid                    scientificname    rank   status matchtype
    #> 1 3006252 Rosa californica Cham. & Schltdl. species ACCEPTED     EXACT
    #> 2 8324010         Rosa californica E.Willm. species DOUBTFUL     EXACT
    #>    gbifid                    scientificname    rank  status matchtype
    #> 1 5414764 Mimulus bicolor Hartweg ex Benth. species SYNONYM     EXACT
    #> 2 8619323           Mimulus bicolor Hartweg species SYNONYM     EXACT
    #> 3 6070876       Mimulus discolor A.L. Grant species SYNONYM     FUZZY
    #> 4 8609737           Mimulus tricolor Hartw. species SYNONYM     FUZZY
    #> 5 6070777 Mimulus tricolor Hartw. ex Lindl. species SYNONYM     FUZZY

We can combine the hierarchy outputs

    (class_df <- cbind(class_list))

    #>    kingdom       phylum         class     order        family       genus
    #> 1  Plantae Tracheophyta Magnoliopsida Asterales    Asteraceae  Helianthus
    #> 2  Plantae Tracheophyta     Pinopsida   Pinales      Pinaceae       Pinus
    #> 3  Plantae Tracheophyta Magnoliopsida  Ericales Polemoniaceae    Collomia
    #> 4  Plantae Tracheophyta     Pinopsida   Pinales      Pinaceae       Abies
    #> 5  Plantae Tracheophyta Magnoliopsida   Rosales      Rosaceae        Rosa
    #> 6  Plantae Tracheophyta Magnoliopsida Solanales    Solanaceae      Datura
    #> 7  Plantae Tracheophyta Magnoliopsida  Lamiales    Phrymaceae Erythranthe
    #> 8  Plantae Tracheophyta Magnoliopsida Solanales    Solanaceae   Nicotiana
    #> 9  Plantae Tracheophyta Magnoliopsida Asterales    Asteraceae       Madia
    #> 10 Plantae Tracheophyta Magnoliopsida Asterales    Asteraceae  Bartlettia
    #>                 species kingdom_id phylum_id class_id order_id family_id
    #> 1     Helianthus annuus          6   7707728      220      414      3065
    #> 2        Pinus contorta          6   7707728      194      640      3925
    #> 3  Collomia grandiflora          6   7707728      220     1353      6648
    #> 4       Abies magnifica          6   7707728      194      640      3925
    #> 5      Rosa californica          6   7707728      220      691      5015
    #> 6       Datura wrightii          6   7707728      220     1176      7717
    #> 7   Erythranthe bicolor          6   7707728      220      408   4194986
    #> 8      Nicotiana glauca          6   7707728      220     1176      7717
    #> 9          Madia sativa          6   7707728      220      414      3065
    #> 10   Bartlettia scaposa          6   7707728      220      414      3065
    #>    genus_id species_id                query   db
    #> 1   3119134    3119195    Helianthus annuus gbif
    #> 2   2684241    5285750       Pinus contorta gbif
    #> 3   2927551    2927556 Collomia grandiflora gbif
    #> 4   2684876    2685422      Abies magnifica gbif
    #> 5   8395064    3006252     Rosa californica gbif
    #> 6   2928734    2928741      Datura wrightii gbif
    #> 7   7735531    8200292      Mimulus bicolor gbif
    #> 8   2928756    2928783     Nicotiana glauca gbif
    #> 9   3140905    3140910         Madia sativa gbif
    #> 10  3105455    5391636   Bartlettia scaposa gbif

Now we can start seeing some relationships among species simply by their
shared taxonomic names

    class_df[1:2, ]

    #>   kingdom       phylum         class     order     family      genus
    #> 1 Plantae Tracheophyta Magnoliopsida Asterales Asteraceae Helianthus
    #> 2 Plantae Tracheophyta     Pinopsida   Pinales   Pinaceae      Pinus
    #>             species kingdom_id phylum_id class_id order_id family_id
    #> 1 Helianthus annuus          6   7707728      220      414      3065
    #> 2    Pinus contorta          6   7707728      194      640      3925
    #>   genus_id species_id             query   db
    #> 1  3119134    3119195 Helianthus annuus gbif
    #> 2  2684241    5285750    Pinus contorta gbif

downstream
----------

We can get downstream names, in this case all species from the genus
*Apis*

    downstream("Apis", db = "col", downto = "Species")

    #>                     name    rank                            colid
    #> 1                   Apis   genus 015be25f6b061ba517f495394b80f108
    #> 2      Actinomadura apis species 1182a102a18b40aa19385bf5f1f53367
    #> 3    Anisocentropus apis species 8891d18874dde14e44df52e931c44206
    #> 4     Apis andreniformis species 7a4a38c5095963949d6d6ec917d471de
    #> 5            Apis cerana species 39610a4ceff7e5244e334a3fbc5e47e5
    #> 6           Apis dorsata species e1d4cbf3872c6c310b7a1c17ddd00ebc
    #> 7            Apis florea species 92dca82a063fedd1da94b3f3972d7b22
    #> 8     Apis koschevnikovi species 4bbc06b9dfbde0b72c619810b564c6e6
    #> 9         Apis mellifera species 67cbbcf92cd60748759e58e802d98518
    #> 10      Apis nigrocincta species 213668a26ba6d2aad9575218f10d422f
    #> 11      Ascosphaera apis species 088549f2fb602367e84d5ffdb8c1d4fc
    #> 12          Candida apis species 3219a9635d3438e8b76a645cecf87287
    #> 13        Eristalis apis species 16d7c8023308d38f6bb831ed5fa82002
    #> 14           Hister apis species d2d7483acf488b5ed932f49b0aa51d19
    #> 15        Ifephylus apis species 9b4d00e009b58bbfc003b51bd3d0c6f0
    #> 16  Impatiens nidus-apis species 6aecf448e6aa0cb46387066db94426d1
    #> 17      Kirkaldykra apis species 70a68f13454abd937aabf56746f4a6ad
    #> 18          Mallota apis species 10c3c3921d2ea9f9425ef9fd41914520
    #> 19 Melanosella mors-apis species 4ac238f1597847dbc7998d97b8d45a0e
    #> 20         Microdon apis species 9be92242562eb923e711dc24b7bbab9a
    #> 21           Nosema apis species 5b2838dfd0ec15844fc6f659f7580322
    #> 22       Scutirodes apis species 164ab3ac910547bc945cdbb994be1ee5
    #> 23      Spiroplasma apis species 789f91571ce55de4df9821f2d05efab0
    #> 24   Trichomonascus apis species 17dc4d840323e2c5b87e67a952f6dff3
    #> 25       Pericystis apis species 088549f2fb602367e84d5ffdb8c1d4fc
    #> 26       Pericystis apis species 088549f2fb602367e84d5ffdb8c1d4fc
    #> 27       Torulopsis apis species 3219a9635d3438e8b76a645cecf87287
    #> 28       Torulopsis apis species 3219a9635d3438e8b76a645cecf87287
    #> 29         Apis aestuans species a517bc572c3c2697fe3bbfabc46a1493
    #> 30           Apis alpina species f2781627115e4212ddab5979cdd425d2
    #> 31         Apis bicornis species e67e82d00faae69da173bb31f9914056
    #> 32        Apis canescens species d6b8850db971d65d6079e3a22f35e10e
    #> 33         Apis clypeata species 706060924801130f6c3abf454087c100
    #> 34      Apis cunicularia species ebc3c5166ce2cabf419c4c6dc332cf3b
    #> 35          Apis etrusca species 6d27fd39a1d8b10050ba4e331987f3c9
    #> 36          Apis globosa species 254c8e847ca4ff128bba57fe94deb98d
    #> 37        Apis hispanica species e8d2057a3efeb2cfdaebe27ea8191cd5
    #> 38         Apis hypnorum species dfb743f54f50b9b9dbee378473542821
    #> 39      Apis ichneumonea species 13c35287e20ab9373fa445dbc44981ea
    #> 40        Apis lapidaria species f8da5667af3562ebc0f6a83e1ec408f0
    #> 41         Apis muscorum species 5bbfe59da5ce7fe59eb9ca3a7a45916c
    #> 42         Apis mystacea species fba8e4752a7fa5939a7eae293ba633ec
    #> 43         Apis obsoleta species da42bcb6cc0267903fb175f8a215aecb
    #> 44         Apis rostrata species e155a4277b66d1114182cafd875afbe3
    #> 45         Apis rostrata species e155a4277b66d1114182cafd875afbe3
    #> 46             Apis rufa species e67e82d00faae69da173bb31f9914056
    #> 47          Apis signata species 551f101ad3b9bc17b24575585b2500c1
    #> 48       Apis smaragdula species 4bc5c886b061e17e9aecb537a04c616d
    #> 49        Apis spinulosa species 56e7e9f854c9ed31ea6d0a06567607d0
    #> 50      Apis subterranea species 3d2adff364a87bf7dd30524aa8071807
    #>          name_status  kingdom              family              acc_name
    #> 1      accepted name Animalia              Apidae                  <NA>
    #> 2      accepted name Bacteria Thermomonosporaceae                  <NA>
    #> 3      accepted name Animalia     Calamoceratidae                  <NA>
    #> 4      accepted name Animalia              Apidae                  <NA>
    #> 5      accepted name Animalia              Apidae                  <NA>
    #> 6      accepted name Animalia              Apidae                  <NA>
    #> 7      accepted name Animalia              Apidae                  <NA>
    #> 8      accepted name Animalia              Apidae                  <NA>
    #> 9      accepted name Animalia              Apidae                  <NA>
    #> 10     accepted name Animalia              Apidae                  <NA>
    #> 11     accepted name    Fungi     Ascosphaeraceae                  <NA>
    #> 12     accepted name    Fungi        Not assigned                  <NA>
    #> 13     accepted name Animalia           Syrphidae                  <NA>
    #> 14     accepted name Animalia          Histeridae                  <NA>
    #> 15     accepted name Animalia             Miridae                  <NA>
    #> 16     accepted name  Plantae       Balsaminaceae                  <NA>
    #> 17     accepted name Animalia        Cicadellidae                  <NA>
    #> 18     accepted name Animalia           Syrphidae                  <NA>
    #> 19     accepted name    Fungi        Not assigned                  <NA>
    #> 20     accepted name Animalia           Syrphidae                  <NA>
    #> 21     accepted name Protozoa         Nosematidae                  <NA>
    #> 22     accepted name Animalia           Noctuidae                  <NA>
    #> 23     accepted name Bacteria   Spiroplasmataceae                  <NA>
    #> 24     accepted name    Fungi   Trichomonascaceae                  <NA>
    #> 25 ambiguous synonym     <NA>                <NA>      Ascosphaera apis
    #> 26 ambiguous synonym     <NA>                <NA>      Ascosphaera apis
    #> 27 ambiguous synonym     <NA>                <NA>          Candida apis
    #> 28 ambiguous synonym     <NA>                <NA>          Candida apis
    #> 29           synonym     <NA>                <NA>     Xylocopa aestuans
    #> 30           synonym     <NA>                <NA>        Bombus alpinus
    #> 31           synonym     <NA>                <NA>            Osmia rufa
    #> 32           synonym     <NA>                <NA>      Bembix canescens
    #> 33           synonym     <NA>                <NA>      Lestica clypeata
    #> 34           synonym     <NA>                <NA> Colletes cunicularius
    #> 35           synonym     <NA>                <NA>     Tachytes etruscus
    #> 36           synonym     <NA>                <NA>   Exomalopsis similis
    #> 37           synonym     <NA>                <NA> Tachytes freygessneri
    #> 38           synonym     <NA>                <NA>       Bombus hypnorum
    #> 39           synonym     <NA>                <NA>    Sphex ichneumoneus
    #> 40           synonym     <NA>                <NA>     Bombus lapidarius
    #> 41           synonym     <NA>                <NA>       Bombus muscorum
    #> 42           synonym     <NA>                <NA> Argogorytes mystaceus
    #> 43           synonym     <NA>                <NA>    Tachytes obsoletus
    #> 44           synonym     <NA>                <NA>       Bembix rostrata
    #> 45           synonym     <NA>                <NA>       Bembix rostrata
    #> 46           synonym     <NA>                <NA>            Osmia rufa
    #> 47           synonym     <NA>                <NA>       Stictia signata
    #> 48           synonym     <NA>                <NA>   Ceratina smaragdula
    #> 49           synonym     <NA>                <NA>   Hoplosmia spinulosa
    #> 50           synonym     <NA>                <NA>   Bombus subterraneus

    #> $Apis
    #>                       childtaxa_id     childtaxa_name childtaxa_rank
    #> 1 7a4a38c5095963949d6d6ec917d471de Apis andreniformis        species
    #> 2 39610a4ceff7e5244e334a3fbc5e47e5        Apis cerana        species
    #> 3 e1d4cbf3872c6c310b7a1c17ddd00ebc       Apis dorsata        species
    #> 4 92dca82a063fedd1da94b3f3972d7b22        Apis florea        species
    #> 5 4bbc06b9dfbde0b72c619810b564c6e6 Apis koschevnikovi        species
    #> 6 67cbbcf92cd60748759e58e802d98518     Apis mellifera        species
    #> 7 213668a26ba6d2aad9575218f10d422f   Apis nigrocincta        species
    #> 
    #> attr(,"class")
    #> [1] "downstream"
    #> attr(,"db")
    #> [1] "col"

upstream
--------

We can also upstream names, in this case all genera up genus *Apis*

    upstream('Poa annua', db = 'col', upto = 'family')
    #> $`Poa annua`
    #>                        childtaxa_id   childtaxa_name childtaxa_rank
    #> 1  3834e28670fe3c8f76fea24fb496a15f    Anarthriaceae         family
    #> 2  0cead872c131282b96da3b3ca3a6fbf8     Bromeliaceae         family
    #> 3  4ec08d1396898b750fe1727545ac273b Centrolepidaceae         family
    #> 4  9c6d72055c3933fb772878569d1e2744       Cyperaceae         family
    #> 5  b11f7be500656ec5ea365a1c7a07a35f  Ecdeiocoleaceae         family
    #> 6  0d9601b89e891871a79b72d28b00f1c5    Eriocaulaceae         family
    #> 7  dcb2312860f7923e219fc4f133576021  Flagellariaceae         family
    #> 8  4e33ddf845e917d310361e74cfb39370   Joinvilleaceae         family
    #> 9  d2bce625cc55cf37f6cbc1143ad48047        Juncaceae         family
    #> 10 2c3053c3692654b0c949ccf466b1c12e       Mayacaceae         family
    #> 11 d01bb56e344e74c4cd8279d28612897e          Poaceae         family
    #> 12 529357780bc2958682ac01662c0d6bc3      Rapateaceae         family
    #> 13 2d03ecec028bdd7142736243105e905c     Restionaceae         family
    #> 14 8f16a0a86bc6377af6cbfba51fe89c38      Thurniaceae         family
    #> 15 6d55aefffa2cb553f22f0758507be694        Typhaceae         family
    #> 16 a31c53aa2ddbf8f86f17d5b89ffe2406       Xyridaceae         family

Your turn
---------

-   5 min

> For 10 names, search by name or get taxonomic IDs using our previous
> tools, and get full hierarchy, and bind them together both row-wise
> and column-wise.
