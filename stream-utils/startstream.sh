#!/bin/sh

./capturetest.sh& 
ssh root@192.168.1.50 ./stream-utils/OffMac.sh

