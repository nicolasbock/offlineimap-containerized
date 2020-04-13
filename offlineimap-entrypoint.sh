#!/bin/bash

: ${TIMEOUT:=30}
: ${UID:=0}
: ${GID:=0}

nice -n 19 \
  ionice --class idle \
  timeout ${TIMEOUT} \
  offlineimap "$@"
