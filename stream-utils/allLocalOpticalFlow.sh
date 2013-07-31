#!/bin/sh
mv calib.xml calib.xml.unset
gst-launch-0.10 v4l2src ! decodebin ! ffmpegcolorspace ! opticalquad ! ffmpegcolorspace ! xvimagesink sync=false
mv calib.xml.unset calib.xml
