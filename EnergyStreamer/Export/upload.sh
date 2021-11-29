#!/bin/bash

cd "${0%/*}" #must change to own directory for bash
make
butler push HTML.zip Norodix/energystreamer:html
butler push Android/EnergyStreamer.apk Norodix/energystreamer:android
butler push EnergyStreamer_win.zip Norodix/energystreamer:windows
butler push EnergyStreamer_linux.zip Norodix/energystreamer:linux
