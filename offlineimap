#!/bin/bash

set -x

home=$(readlink --canonicalize ~)
maildir=Mail

docker run \
  --rm \
  --interactive --tty \
  --volume ${home}/.offlineimap:/root/.offlineimap:rw \
  --volume ${home}/.offlineimaprc:/root/.offlineimaprc:ro \
  --volume ${home}/.offlineimap.py:/root/.offlineimap.py:ro \
  --volume ${home}/${maildir}:/root/${maildir}:rw \
  offlineimap "$@"
