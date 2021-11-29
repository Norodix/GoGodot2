zips = HTML.zip EnergyStreamer_win.zip EnergyStreamer_linux.zip

%.zip: %
	zip -r $@ $(basename $@)

all: $(zips)
