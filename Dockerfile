FROM eg5846/ubuntu-docker:trusty
MAINTAINER Andreas Egner <andreas.egner@web.de>

# Upgrade system
RUN \
  apt-get update && \
  apt-get dist-upgrade -y --no-install-recommends && \
  apt-get autoremove -y && \
  apt-get clean

# Install packages
RUN \
  apt-get install -y --no-install-recommends tor && \
  apt-get autoremove -y && \
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
