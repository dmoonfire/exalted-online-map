CS_FILES = $(wildcard src/*.cs)

all: exalted-map/z5/x0y0.png exalted-map/z4/x0y0.png exalted-map/z3/x0y0.png exalted-map/z3/x0y0.png exalted-map/z2/x0y0.png exalted-map/z1/x0y0.png exalted-map/z0/x0y0.png

exalted-map/creation-z4.png: exalted-map/creation-z5.png
	convert -scale 50% exalted-map/creation-z5.png exalted-map/creation-z4.png

exalted-map/creation-z3.png: exalted-map/creation-z4.png
	convert -scale 50% exalted-map/creation-z4.png exalted-map/creation-z3.png

exalted-map/creation-z2.png: exalted-map/creation-z3.png
	convert -scale 50% exalted-map/creation-z3.png exalted-map/creation-z2.png

exalted-map/creation-z1.png: exalted-map/creation-z2.png
	convert -scale 50% exalted-map/creation-z2.png exalted-map/creation-z1.png

exalted-map/creation-z0.png: exalted-map/creation-z1.png
	convert -scale 50% exalted-map/creation-z1.png exalted-map/creation-z0.png

exalted-map/z5/x0y0.png: exalted-map/creation-z5.png
	mkdir exalted-map/z5 -p
	convert exalted-map/creation-z5.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "exalted-map/z5/%[filename:tile].png"

exalted-map/z4/x0y0.png: exalted-map/creation-z4.png
	mkdir exalted-map/z4 -p
	convert exalted-map/creation-z4.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "exalted-map/z4/%[filename:tile].png"

exalted-map/z3/x0y0.png: exalted-map/creation-z3.png
	mkdir exalted-map/z3 -p
	convert exalted-map/creation-z3.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "exalted-map/z3/%[filename:tile].png"

exalted-map/z2/x0y0.png: exalted-map/creation-z2.png
	mkdir exalted-map/z2 -p
	convert exalted-map/creation-z2.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "exalted-map/z2/%[filename:tile].png"

exalted-map/z1/x0y0.png: exalted-map/creation-z1.png
	mkdir exalted-map/z1 -p
	convert exalted-map/creation-z1.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "exalted-map/z1/%[filename:tile].png"

exalted-map/z0/x0y0.png: exalted-map/creation-z0.png
	mkdir exalted-map/z0 -p
	convert exalted-map/creation-z0.png -crop 256x256 -set filename:tile "x%[fx:page.x/256]y%[fx:page.y/256]" +repage +adjoin "exalted-map/z0/%[filename:tile].png"

clean:
	rm -rf exalted-map/z*
	rm -f exalted-map/creation-z4.png
	rm -f exalted-map/creation-z3.png
	rm -f exalted-map/creation-z2.png
	rm -f exalted-map/creation-z1.png
	rm -f exalted-map/creation-z0.png

# markers.xml sepia-markers.xml

markers.xml: locations.xml LocationParser.exe
	mono LocationParser.exe markers.xml locations.xml

sepia-markers.xml: locations.xml sepia-locations.xml LocationParser.exe
	mono LocationParser.exe sepia-markers.xml \
		locations.xml sepia-locations.xml

LocationParser.exe: $(CS_FILES)
	gmcs /t:exe /out:LocationParser.exe $(realpath $(CS_FILES))
