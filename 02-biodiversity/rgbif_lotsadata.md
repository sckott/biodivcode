rgbif data quality/data cleaning
--------------------------------

    library('rgbif')

Downloads
---------

The user interface is slightly different from `occ_search`/`occ_data`
and other functions.

Here, we query for records that have a `basisOfRecord` value of
`LITERATURE`.

    x <- occ_download("basisOfRecord = LITERATURE")

That kicks off a request, and we get back basically an identifier with
which we can check when the request is done, and fetch it.

    occ_download_meta(x)

Then when done, we can fetch and import in one line

    occ_download_get(x) %>% occ_download_import()

Your turn
---------

-   5 min

> If you have GBIF credentials already, try to run a small download - to
> be sure it will be done very quickly, OR if you have a download you've
> already done on GBIF, you can use that ID to download that data with
> rgbif.
