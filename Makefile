intro:
	cd 00-introduction;\
	Rscript -e 'rmarkdown::render("intro.Rmd")'

taxize:
	cd 01-taxonomy;\
	Rscript -e 'rmarkdown::render("taxize.Rmd", "md_document")';\
	Rscript -e 'rmarkdown::render("taxize.Rmd", "html_document")'

ids:
	cd 01-taxonomy;\
	Rscript -e 'rmarkdown::render("identifiers.Rmd", "md_document")';\
	Rscript -e 'rmarkdown::render("identifiers.Rmd", "html_document")'

hierarchy:
	cd 01-taxonomy;\
	Rscript -e 'rmarkdown::render("hierarchies.Rmd", "md_document")';\
	Rscript -e 'rmarkdown::render("hierarchies.Rmd", "html_document")'


countries:
	cd 02-biodiversity;\
	Rscript -e 'rmarkdown::render("usecase-countries.Rmd")'

rgbifcleaning:
	cd 02-biodiversity;\
	Rscript -e 'rmarkdown::render("rgbif_cleaning.Rmd")'

datacleaning:
	cd 02-biodiversity;\
	Rscript -e 'rmarkdown::render("data_cleaning.Rmd")'

mapping:
	cd 02-biodiversity;\
	Rscript -e 'rmarkdown::render("mapping.Rmd")'
