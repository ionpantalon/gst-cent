# Install Gstreamer on a docker container

Run docker build -t 'gstreamer' .

Build a container from the image created above:

docker run -dt --name gst clientportal /bin/bash

Then 

docker exec -ti gst /bin/bash 

Once the container is running we can test if Gstreamer is installed by running 

gst-launch-1.0 --gst-version

If it is installed then we can go ahead and create a pipeline using gst-launch

gst-launch-1.0 uridecodebin uri=http://podcast.dr.dk/p1/sprogminuttet/sprogminut65.mp3 ! fakesink dump=true num-buffers=10

To get useful information about a stream we can use the gst-discoverer like show below

gst-discoverer-1.0 http://open.live.bbc.co.uk/mediaselector/5/redir/version/2.0/mediaset/audio-syndication-dash/proto/http/vpid/b06w4rsk

For debugging add in front of the pipeline like so

GST_DEBUG=5 gst-launch-1.0 uridecodebin uri=http://podcast.dr.dk/p1/sprogminuttet/sprogminut65.mp3 ! fakesink dump=true num-buffers=10
