FROM ubuntu:bionic
MAINTAINER Andreas Egner <andreas.egner@web.de>

# Install packages
RUN \
  apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y --no-install-recommends tor tor-geoipdb torsocks && \
  apt-get clean

# Configure tor
Add torrc /etc/tor/torrc

# Add run.sh
ADD run.sh /run.sh
RUN chmod 0755 /run.sh

# Finally ...
EXPOSE 9050
VOLUME /var/log/tor
CMD ["/run.sh"]
