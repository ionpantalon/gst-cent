FROM centos:centos7

MAINTAINER Ion Pantalon <nanu_rtc@yahoo.com>

RUN yum -y update

RUN yum -y install curl wget git

# GStreamer 1.4.5
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

RUN yum -y install gstreamer1*
RUN yum -y install python-devel openssl openssl-devel gcc sqlite-devel

#RUN yum -y install procps-ng
RUN yum -y install python-gstreamer1* python-git*

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

RUN yum -y install python-pip
RUN pip install pafy \
RUN pip -U mopidy
RUN pip install Mopidy-GMusic
RUN pip install Mopidy-SoundCloud
RUN pip install Mopidy-YouTube
