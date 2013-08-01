#!/bin/sh
gst-launch-0.10 -v udpsrc port=4000 caps='application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264' ! \
rtph264depay ! ffdec_h264 \
! ffmpegcolorspace ! opticalquad ! ffmpegcolorspace ! xvimagesink sync=false
#ssh root@sonny './streamCaspa.sh&'


