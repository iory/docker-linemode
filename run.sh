#!/bin/bash

xhost +local:root
docker run -it --rm \
       --net=host \
       -e DISPLAY=$DISPLAY \
       -e QT_X11_NO_MITSHM=1 \
       -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
       iory/docker-linemode:indigo \
       /bin/bash -i -c 'rosrun jsk_perception linemod'
xhost -local:
