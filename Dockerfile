FROM fedora
RUN dnf -y upgrade
RUN dnf -y install dnf-plugins-core fedora-repos-rawhide
RUN dnf config-manager --set-disabled fedora updates updates-testing 
RUN dnf config-manager --set-enabled rawhide
RUN dnf install -y \
  http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
RUN dnf install -y gstreamer1*
RUN dnf -y install python-devel openssl openssl-devel gcc sqlite-devel
RUN dnf install -y procps-ng
RUN dnf install -y python-gstreamer1* python-git*
RUN pip install mopidy
