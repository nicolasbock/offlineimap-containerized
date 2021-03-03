#!/bin/bash

set -e -u -x

CONTAINER=offlineimap-build-container

if lxc info ${CONTAINER}; then
  lxc delete --force ${CONTAINER}
fi

lxc launch ubuntu:bionic ${CONTAINER}

while ! lxc exec ${CONTAINER} -- ping -c 1 1.1.1.1; do
  sleep 1
done

lxc exec ${CONTAINER} -- apt-get update
lxc exec ${CONTAINER} -- apt-get --yes install --no-install-recommends \
  python-pip python-setuptools python-wheel
lxc exec ${CONTAINER} -- pip install --upgrade pip
lxc exec ${CONTAINER} -- pip install setuptools
lxc exec ${CONTAINER} -- pip install six
lxc exec ${CONTAINER} -- pip install rfc6555
lxc exec ${CONTAINER} -- pip install offlineimap

lxc file push ./offlineimap-entrypoint.sh ${CONTAINER}/var/tmp

lxc stop ${CONTAINER}
lxc publish ${CONTAINER} --alias offlineimap-python2
lxc delete ${CONTAINER}
