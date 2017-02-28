# Install Gstreamer on a docker container

Let's start by building a new image using the Dockerfile 
```sh
$ docker build -t 'gstreamer' .
```
Now that we have the image let's create a container and name it gst
```sh
$ docker run -dt --name gst clientportal /bin/bash
```
To access the gst container run
```sh
$ docker exec -ti gst /bin/bash 
```
To test if the gstreamer was succsfully installed let's check using:
```sh
$ gst-launch-1.0 --gst-version
```
Below is an example of a pipeline using gst-launch
```sh
$ gst-launch-1.0 uridecodebin uri=http://podcast.dr.dk/p1/sprogminuttet/sprogminut65.mp3 ! fakesink dump=true num-buffers=10
```
We can get useful information about a stream by using gst-discoverer
```sh
$ gst-discoverer-1.0 http://open.live.bbc.co.uk/mediaselector/5/redir/version/2.0/mediaset/audio-syndication-dash/proto/http/vpid/b06w4rsk
```
To debug a pipeline we can use GST_DEBUG
```sh
$ GST_DEBUG=5 gst-launch-1.0 uridecodebin uri=http://podcast.dr.dk/p1/sprogminuttet/sprogminut65.mp3 ! fakesink dump=true num-buffers=10
```
