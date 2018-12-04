#!/bin/bash
PORT_NUMBER=8160

#Streams are available within the network at VLC > Media > Open Network Stream > ip:$PORT_NUMBER

killall raspivid
raspivid -o - -t 0 -rot 90 -w 640 -h 480 -fps 25 | cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:'$PORT_NUMBER'}' :demux=h264