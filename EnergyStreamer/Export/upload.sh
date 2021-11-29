#!/bin/bash

make
butler push HTML.zip Norodix/energystreamer:html
butler push Android/EnergyStreamer.apk Norodix/energystreamer:android
