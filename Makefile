CS_FILES = $(wildcard src/*.cs)

all: maps

maps:
	$(MAKE) -C creation
	$(MAKE) -C creation-geo

clean:
	rm -f *~
	$(MAKE) -C creation clean
	$(MAKE) -C creation-geo clean

# markers.xml sepia-markers.xml

markers.xml: locations.xml LocationParser.exe
	mono LocationParser.exe markers.xml locations.xml

sepia-markers.xml: locations.xml sepia-locations.xml LocationParser.exe
	mono LocationParser.exe sepia-markers.xml \
		locations.xml sepia-locations.xml

LocationParser.exe: $(CS_FILES)
	gmcs /t:exe /out:LocationParser.exe $(realpath $(CS_FILES))
