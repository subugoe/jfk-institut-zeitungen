Laden der Daten von SRU mit [sru-loader](https://github.com/ssp/sru-loader):

		sru-loader.py \
		--url http://services.dnb.de/sru/zdb \
		--schema oai_dc \
		--format xml \
		--folderdepth 0 \
		--idxpath "{http://purl.org/dc/elements/1.1/}identifier[@{http://www.w3.org/2001/XMLSchema-instance}type='dnb:IDN']" \
		"dnb.ssg=7,261"



Zusammenfügen in XML Datei:

	echo "<records>\n `cat xml/*` \n</records>" > zeitschriften.xml



Umwandeln in HTML Datei; Dabei Korrigieren der von der SRU Schnittstelle (typisch für Pica) fehlerhaft escapedten `&amp;amp;`

	xsltproc transform.xsl zeitschriften.xml | replace "&amp;amp;" "&amp;" > zeitschriften.html