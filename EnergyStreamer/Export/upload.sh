#!/bin/bash

cd "${0%/*}" #must change to own directory for bash
make
butler push HTML.zip Norodix/energystreamer:html
butler push Android/EnergyStreamer.apk Norodix/energystreamer:android
