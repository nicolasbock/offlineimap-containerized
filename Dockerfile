FROM ubuntu:xenial
RUN apt-get update
RUN apt-get --yes install python-pip
RUN pip install --upgrade pip
RUN pip install six
RUN pip install rfc6555
RUN pip install offlineimap
WORKDIR /root
ARG TIMEOUT
ENV TIMEOUT ${TIMEOUT:-300}
COPY offlineimap-entrypoint.sh /root/offlineimap-entrypoint.sh
ENTRYPOINT ["/root/offlineimap-entrypoint.sh"]
CMD ["-o"]
