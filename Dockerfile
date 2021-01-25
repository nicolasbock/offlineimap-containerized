FROM ubuntu:bionic

# Install software
RUN apt-get update
RUN apt-get --yes install --no-install-recommends python-pip python-setuptools
RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install six
RUN pip install rfc6555
RUN pip install offlineimap

# Set up environment
ENV HOME /var/tmp
WORKDIR /var/tmp
ARG TIMEOUT
ENV TIMEOUT ${TIMEOUT:-0}

# Create entry point
COPY offlineimap-entrypoint.sh /usr/bin/offlineimap-entrypoint.sh
ENTRYPOINT ["/usr/bin/offlineimap-entrypoint.sh"]
CMD ["-o"]
